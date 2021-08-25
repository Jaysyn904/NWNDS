//::///////////////////////////////////////////////
//:: OnPlayerRest eventscript
//:: prc_rest
//:://////////////////////////////////////////////
/*
    Hooked NPC's into this via prc_npc_rested - 06.03.2004, Ornedan
*/

#include "prc_inc_function"
#include "psi_inc_psifunc"
#include "prc_sp_func"
#include "prc_inc_domain"
#include "true_inc_trufunc"
#include "inv_inc_invfunc"
#include "inc_epicspells"
#include "prc_inc_scry"
#include "prc_inc_dragsham"
#include "prc_inc_wpnrest"
#include "inc_dynconv"
#include "prc_inc_util"
#include "shd_inc_myst"
#include "prc_inc_template"

void PrcFeats(object oPC)
{
    if(DEBUG) DoDebug("prc_rest: Evaluating PC feats for " + DebugObject2Str(oPC));

    SetLocalInt(oPC,"ONREST",1);
    object oSkin = GetPCSkin(oPC);
    DelayCommand(0.0, ScrubPCSkin(oPC, oSkin));
    DelayCommand(0.1, FeatSpecialUsePerDay(oPC));
    DelayCommand(0.2, DeletePRCLocalInts(oSkin));
    DelayCommand(0.3, DeletePRCLocalIntsT(oPC));
    DelayCommand(0.4, EvalPRCFeats(oPC));
    DelayCommand(0.4, DoWeaponsEquip(oPC));
    DelayCommand(1.0, DeleteLocalInt(oPC,"ONREST"));
}

void RestCancelled(object oPC)
{
    if(GetPRCSwitch(PRC_PNP_REST_HEALING))
    {
        int nHP = GetLocalInt(oPC, "PnP_Rest_InitialHP");
        //cancelled, dont heal anything
        //nHP += GetHitDice(oPC);
        int nCurrentHP = GetCurrentHitPoints(oPC);
        int nDamage = nCurrentHP-nHP;
        //check its a positive number
        if(nDamage > 0)
        {
            //DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_PLUS_TWENTY), oPC));
            SetCurrentHitPoints(oPC, nCurrentHP - nDamage);
        }    
    }
    if(DEBUG) DoDebug("prc_rest: Rest cancelled for " + DebugObject2Str(oPC));
    DelayCommand(1.0,PrcFeats(oPC));
    // Execute scripts hooked to this event for the player triggering it
    ExecuteAllScriptsHookedToEvent(oPC, EVENT_ONPLAYERREST_CANCELLED);
}

void RestFinished(object oPC)
{
    int nGeneration = PRC_NextGeneration(GetLocalInt(oPC, PRC_Rest_Generation));
    if (DEBUG > 1) DoDebug("Rest Generation: " + IntToString(nGeneration));
    SetLocalInt(oPC, PRC_Rest_Generation, nGeneration);

    if(DEBUG) DoDebug("prc_rest: Rest finished for for " + DebugObject2Str(oPC));
    //Restore Power Points for Psionics
    ExecuteScript("prc_psi_ppoints", oPC);
    ExecuteScript("tob_evnt_recover", oPC);
    DelayCommand(0.0, BonusDomainRest(oPC));
    DelayCommand(0.0, ClearLawLocalVars(oPC));
    DelayCommand(0.0, ClearMystLocalVars(oPC));
    DelayCommand(0.0, ClearLegacyUses(oPC));
    DelayCommand(0.1, ClearInvocationLocalVars(oPC));

    // To heal up enslaved creatures...
    object oSlave = GetLocalObject(oPC, "EnslavedCreature");
    if (GetIsObjectValid(oSlave) && !GetIsDead(oSlave) && !GetIsInCombat(oSlave))
            AssignCommand(oSlave, ActionRest());
            //ForceRest(oSlave);

    if (GetIsEpicSpellcaster(oPC)) {
        FloatingTextStringOnCreature("*You feel refreshed*", oPC, FALSE);
        ReplenishSlots(oPC);
    }

    if (GetHasFeat(FEAT_SF_CODE,oPC))
        DelayCommand(0.1, RemoveSpecificProperty(GetPCSkin(oPC),ITEM_PROPERTY_BONUS_FEAT,IP_CONST_FEAT_SF_CODE));

    // begin flurry of swords array
    if (GetLevelByClass(CLASS_TYPE_ARCANE_DUELIST, oPC))
    {
        DeleteLocalInt(oPC, "FLURRY_TARGET_NUMBER");

        int i;
        for (i = 0 ; i < 10 ; i++)
        {
            string sName = "FLURRY_TARGET_" + IntToString(i);
            SetLocalObject(oPC, sName, OBJECT_INVALID);
        }
    }
    // end flurry or swords array

    //Check for leftover Diamond Dragon appendages
    if (GetLevelByClass(CLASS_TYPE_DIAMOND_DRAGON, oPC))
    {
        if(GetPersistantLocalInt(oPC, "ChannelingTail"))
        {
            SetPersistantLocalInt(oPC, "ChannelingTail", FALSE);
            SetCreatureTailType(CREATURE_TAIL_TYPE_NONE, oPC);
        }
        if(GetPersistantLocalInt(oPC, "ChannelingWings"))
        {
            SetPersistantLocalInt(oPC, "ChannelingWings", FALSE);
            SetCreatureWingType(CREATURE_WING_TYPE_NONE, oPC);
        }
    }

    if(GetPRCSwitch(PRC_PNP_REST_HEALING))
    {
        int nHP = GetLocalInt(oPC, "PnP_Rest_InitialHP");
        int nOldMax = GetLocalInt(oPC, "PnP_Rest_InitialMax");
        if(DEBUG) DoDebug("prc_rest: Finished HPs for " + DebugObject2Str(oPC)+"n/n/"+" nCurrent: "+IntToString(nHP)+" nMax: "+IntToString(nOldMax));
        //only heal HP if not undead and not a construct
        if(MyPRCGetRacialType(oPC) != RACIAL_TYPE_UNDEAD && MyPRCGetRacialType(oPC) != RACIAL_TYPE_CONSTRUCT)
            nHP = GetMaxHitPoints(oPC) - nOldMax + nHP + GetHitDice(oPC);
        int nCurrentHP = GetCurrentHitPoints(oPC);
        int nDamage = nCurrentHP-nHP;
        //check its a positive number
        if(nDamage > 0)
        {
            //DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_PLUS_TWENTY), oPC));
            SetCurrentHitPoints(oPC, nCurrentHP - nDamage);
        }  
        // We've finished rest, clean up
        DeleteLocalInt(oPC, "PnP_Rest_InitialHP");
        DeleteLocalInt(oPC, "PnP_Rest_InitialMax");
    }

    int nSpellCount = GetPRCSwitch(PRC_DISABLE_SPELL_COUNT);
    int i;
    string sMessage;
    for(i=1;i<nSpellCount;i++)
    {   //WARNING! WILL DO BAD THINGS TO SPONTANEOUS CASTERS AFFECTED
        int nSpell = GetPRCSwitch(PRC_DISABLE_SPELL_+IntToString(i));
        int nMessage;
        while(PRCGetHasSpell(nSpell, oPC))
        {
            if(!nMessage)
            {
                sMessage += "You cannot use "+GetStringByStrRef(StringToInt(Get2DACache("spells", "Name", nSpell)))+" in this module.\n";
                nMessage = TRUE;
            }
            PRCDecrementRemainingSpellUses(oPC, nSpell);
        }
    }
    if(sMessage != "")
        FloatingTextStringOnCreature(sMessage, oPC, TRUE);

    //Clear Battle Fortitude lock
    DeleteLocalInt(oPC, "BattleFortitude");
    DeleteLocalInt(oPC, "ArmouredStealth");
    
    //Clear Spelldancing
    DeleteLocalInt(oPC, "SpelldanceFatigue");
    DeleteLocalInt(oPC, "SpelldanceExhaust");    
    DeleteLocalInt(oPC, "SpelldanceRounds");  
    
    //Clear Killoren
    DeleteLocalInt(oPC, "KillorenAncient");    
    DeleteLocalInt(oPC, "KillorenHunter"); 
    
    //Clear Earth Smite
    DeleteLocalInt(oPC, "EarthSmite"); 
    
    //Clear Fatigue
    DeleteLocalInt(oPC, "Fatigued");    
    DeleteLocalInt(oPC, "HeatstrokeCount");  
    
    // Allow Readying
    DeleteLocalInt(oPC, "ReadyManeuverCru");
    DeleteLocalInt(oPC, "ReadyManeuverSwd");
    DeleteLocalInt(oPC, "ReadyManeuverWar");
    
    // Rest Ranged Recall
    DeleteLocalInt(oPC, "RangedRecall");  
    
    // Animal Affinity
    DeleteLocalInt(oPC, "AnimalAffin"+IntToString(ABILITY_STRENGTH));
    DeleteLocalInt(oPC, "AnimalAffin"+IntToString(ABILITY_DEXTERITY));
    DeleteLocalInt(oPC, "AnimalAffin"+IntToString(ABILITY_CONSTITUTION));
    DeleteLocalInt(oPC, "AnimalAffin"+IntToString(ABILITY_WISDOM));
    DeleteLocalInt(oPC, "AnimalAffin"+IntToString(ABILITY_INTELLIGENCE));
    DeleteLocalInt(oPC, "AnimalAffin"+IntToString(ABILITY_CHARISMA));

    if(GetHasFeat(FEAT_WEAPON_APTITUDE, oPC))
    {
        FloatingTextStringOnCreature(GetStringByStrRef(16837723), oPC, FALSE);
        SetLocalInt(oPC, "PRC_WEAPON_APTITUDE_APPLIED", 0);
    }

    //DelayCommand(1.0,PrcFeats(oPC));
    PrcFeats(oPC);

    //allow players to recruit a new cohort
    DeleteLocalInt(oPC, "CohortRecruited");

    //in large parties, sometimes people dont rest
    //loop over all and forcerest when necessary
    //assumes NPCs start and finish resting after the PC
    /*if(!GetIsObjectValid(GetMaster(oPC)))
    {*/
        int nType;
        for(nType = 1; nType < 6; nType++)
        {
            int i = 1;
            object oOldTest;
            object oTest = GetAssociate(nType, oPC, i);
            while(GetIsObjectValid(oTest) && oTest != oOldTest)
            {
                if(GetCurrentAction(oTest) != ACTION_REST)
                    AssignCommand(oTest, DelayCommand(0.01, PRCForceRest(oTest)));
                i++;
                oOldTest = oTest;
                oTest = GetAssociate(nType, oPC, i);
            }
        }
    //}

    // New Spellbooks
    DelayCommand(0.3, CheckNewSpellbooks(oPC));
    // PnP spellschools
    if(GetPRCSwitch(PRC_PNP_SPELL_SCHOOLS)
        && GetLevelByClass(CLASS_TYPE_WIZARD, oPC)|| GetLevelByClass(CLASS_TYPE_DEFILER)) // NWN Dark Sun class
    {
        //need to put a check in to make sure the player
        //memorized one spell of their specialized
        //school for each spell level
        //also need to remove spells of prohibited schools
    }

    //Reset potions brewed
    DeleteLocalInt(oPC, "PRC_POTIONS_BREWED");

    //Reset scry on familiar uses
    DeleteLocalInt(oPC, "Scry_Familiar");

    //for Touch of Vitality point resetting
    ResetTouchOfVitality(oPC);

    //Lahm's finger darts - recover lost fingers
    SetPersistantLocalInt(oPC, "FINGERS_LEFT_HAND", 6);
    SetPersistantLocalInt(oPC, "FINGERS_RIGHT_HAND", 6);
    SetPersistantLocalInt(oPC, "LEFT_HAND_USELESS", FALSE);
    SetPersistantLocalInt(oPC, "RIGHT_HAND_USELESS", FALSE);

    //DelayCommand(6.0f, ExecuteScript("prc_trueappear", oPC));

    //skip time forward if applicable
    DelayCommand(0.4, AdvanceTimeForPlayer(oPC, HoursToSeconds(8)));
    
    int nRest = GetPRCSwitch(PRC_PNP_REST_LIMIT);
    if(nRest > 0 || nRest < 0)    
    {
        int nDelay = nRest * GetHitDice(oPC);
        if (nRest == -1) nDelay = 24; 
        else if (nRest == -2) nDelay = 16;     
      
        SetLocalInt(oPC, "RestTimer", TRUE);
        DelayCommand(HoursToSeconds(nDelay), DeleteLocalInt(oPC, "RestTimer"));
        DelayCommand(HoursToSeconds(nDelay), FloatingTextStringOnCreature("You may now rest again.", oPC, FALSE));
        FloatingTextStringOnCreature("You may rest again in "+IntToString(nDelay)+" hours.", oPC, FALSE);
    }    

    // Execute scripts hooked to this event for the player triggering it
    ExecuteAllScriptsHookedToEvent(oPC, EVENT_ONPLAYERREST_FINISHED);
}

void RestStarted(object oPC)
{
    if(DEBUG) DoDebug("prc_rest: Rest started for " + DebugObject2Str(oPC));

    // Scrying cleanup
    if (GetIsScrying(oPC))
    {
        object oCopy = GetLocalObject(oPC, "Scry_Copy");
        DoScryEnd(oPC, oCopy);
    }
    
    int nRest = GetPRCSwitch(PRC_PNP_REST_LIMIT);
    if(nRest > 0 || nRest < 0)    
    {
        int nDelay = nRest * GetHitDice(oPC);
        if (nRest == -1) nDelay = 24; 
        else if (nRest == -2) nDelay = 16;     
        
        if(GetLocalInt(oPC, "RestTimer"))
        {
            AssignCommand(oPC, ClearAllActions());
            FloatingTextStringOnCreature("You may not rest yet. You may rest once every "+IntToString(nDelay)+" hours.", oPC, FALSE);
        }
    }
    
    // Clean up Crown of Might
    object oCrown = GetItemPossessedBy(oPC, "prc_crown_might");
    if (GetIsObjectValid(oCrown)) DestroyObject(oCrown);
    oCrown = GetItemPossessedBy(oPC, "prc_crown_prot");
    if (GetIsObjectValid(oCrown)) DestroyObject(oCrown);    

    if (GetLevelByClass(CLASS_TYPE_DRUNKEN_MASTER, oPC)){
        SetLocalInt(oPC, "DRUNKEN_MASTER_IS_IN_DRUNKEN_RAGE", 0);
        SetLocalInt(oPC, "DRUNKEN_MASTER_IS_DRUNK_LIKE_A_DEMON", 0);
    }
    /* Left here in case the multisummon trick is ever broken. In that case, use this to make Astral Constructs get unsummoned properly
    if(GetHasFeat(whatever feat determines if the PC can manifest Astral Construct here)){
        int i = 1;
        object oCheck = GetHenchman(oPC, i);
        while(oCheck != OBJECT_INVALID){
            if(GetStringLeft(GetTag(oCheck), 14) == "psi_astral_con")
                DoDespawn(oCheck);
            i++;
            oCheck = GetHenchman(oPC, i);
        }
    }
    */

    if (GetIsPC(oPC)) SetLocalInt(oPC, "PnP_Rest_InitialHP", GetCurrentHitPoints(oPC));
    SetLocalInt(oPC, "PnP_Rest_InitialMax", GetMaxHitPoints(oPC));
    if(DEBUG) DoDebug("prc_rest: HPs for " + DebugObject2Str(oPC)+"n/n/"+" nCurrent: "+IntToString(GetCurrentHitPoints(oPC))+" nMax: "+IntToString(GetMaxHitPoints(oPC)));
    // Remove Psionic Focus
    if(GetIsPsionicallyFocused(oPC))
    {
        LosePsionicFocus(oPC);
    }
    DeleteLocalInt(oPC, PRC_SPELL_CHARGE_COUNT);
    DeleteLocalInt(oPC, PRC_SPELL_CHARGE_SPELLID);
    DeleteLocalObject(oPC, PRC_SPELL_CONC_TARGET);
    if(GetLocalInt(oPC, PRC_SPELL_HOLD)) FloatingTextStringOnCreature("*Normal Casting*", oPC);
    DeleteLocalInt(oPC, PRC_SPELL_HOLD);
    DeleteLocalInt(oPC, PRC_SPELL_METAMAGIC);
    DeleteLocalManifestation(oPC, PRC_POWER_HOLD_MANIFESTATION);
    DeleteLocalMystery(oPC, "MYST_HOLD_MYST");
    // run the prereq check here
    ExecuteScript("prc_prereq", oPC);
    // Execute scripts hooked to this event for the player triggering it
    ExecuteAllScriptsHookedToEvent(oPC, EVENT_ONPLAYERREST_STARTED);
}

void main()
{
    object oPC = GetLastBeingRested();

    if(DEBUG) DoDebug("prc_rest: Running for " + DebugObject2Str(oPC));
    if(DEBUG) DoDebug("prc_rest Void Main: HPs for " + DebugObject2Str(oPC) +" nCurrent: "+IntToString(GetCurrentHitPoints(oPC)));

    // return here for DMs as they don't need all this stuff
    if(GetIsDM(oPC))
        return;

    //rest kits
    if(GetPRCSwitch(PRC_SUPPLY_BASED_REST))
        ExecuteScript("sbr_onrest", OBJECT_SELF);

    // Handle the PRCForceRest() wrapper
    if(GetLocalInt(oPC, "PRC_ForceRested"))
    {
        if(DEBUG) DoDebug("prc_rest: Handling forced rest");
        RestStarted(oPC);
        // A minor delay to break the script association and to lessen TMI chances
        DelayCommand(0.1f, RestFinished(oPC));
        // Clear the flag
        DeleteLocalInt(oPC, "PRC_ForceRested");
    }
    else
    {
        switch(MyGetLastRestEventType()){
            case REST_EVENTTYPE_REST_CANCELLED:{
                RestCancelled(oPC);
                break;
            }
            case REST_EVENTTYPE_REST_STARTED:{
                RestStarted(oPC);
                break;
            }
            case REST_EVENTTYPE_REST_FINISHED:{
                RestFinished(oPC);
                break;
            }
            case REST_EVENTTYPE_REST_INVALID:{
                break;
            }
        }
    }
}
