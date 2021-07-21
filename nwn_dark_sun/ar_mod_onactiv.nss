//::///////////////////////////////////////////////
//:: Example XP2 OnActivate Script Script
//:: x2_mod_def_act
//:: (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Put into: OnItemActivate Event

*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: 2003-07-16
//:://////////////////////////////////////////////

//#include "wow_inc_scouting"
#include "x2_inc_switches"
#include "x2_inc_itemprop"
int wow_CheckTag();

void main()
{
     object oItem = GetItemActivated();
     SetUserDefinedItemEventNumber(X2_ITEM_EVENT_ACTIVATE);
     // if(wow_CheckModuleEventForScoutingSystem()) return;
     if(wow_CheckTag()) return;

     //declaration of variables used almost everywhere
     object oActivator = GetItemActivator();
     object oTarget = GetItemActivatedTarget();
     location lTargetLoc = GetItemActivatedTargetLocation();
     string sTag = GetTag(oItem);

     //For all bioware-standard special abilities target area of effect
    if (TestStringAgainstPattern("**_pra**", sTag))
    {
        int iSpellSs = FindSubString(sTag, "_pra");
        string sSpellbyTag = GetSubString(sTag, iSpellSs, 8);
        int iSpellNum = StringToInt(GetStringRight(sSpellbyTag,4));
        AssignCommand(oActivator,ActionCastSpellAtLocation(iSpellNum, lTargetLoc ,METAMAGIC_ANY,TRUE,PROJECTILE_PATH_TYPE_DEFAULT,1));
        return;
    }

    //For all bioware-standard special abilities on non-self target object
    if (TestStringAgainstPattern("**_prb**", sTag))
    {
        int iSpellSs = FindSubString(sTag, "_prb");
        string sSpellbyTag = GetSubString(sTag, iSpellSs, 8);
        int iSpellNum = StringToInt(GetStringRight(sSpellbyTag,4));
        AssignCommand(oActivator,ActionCastSpellAtObject(iSpellNum, oTarget ,METAMAGIC_ANY,TRUE,0,PROJECTILE_PATH_TYPE_DEFAULT,1));
        return;
    }

    //For all bioware-standard special abilities target is the caster
    if (TestStringAgainstPattern("**_prc**", sTag))
    {
        int iSpellSs = FindSubString(sTag, "_prc");
        string sSpellbyTag = GetSubString(sTag, iSpellSs, 8);
        int iSpellNum = StringToInt(GetStringRight(sSpellbyTag,4));
        AssignCommand(oActivator,ActionCastSpellAtObject(iSpellNum, oActivator ,METAMAGIC_ANY,TRUE,0,PROJECTILE_PATH_TYPE_DEFAULT,1));
        return;
    }

    //BESIE Widget
    if(GetTag(GetItemActivated()) == "BESIEWidget")
        {
            AssignCommand(GetItemActivator(), ActionStartConversation(GetItemActivator(), "re_widget", TRUE));
        }

     // * Generic Item Script Execution Code
     // * If MODULE_SWITCH_EXECUTE_TAGBASED_SCRIPTS is set to TRUE on the module,
     // * it will execute a script that has the same name as the item's tag
     // * inside this script you can manage scripts for all events by checking against
     // * GetUserDefinedItemEventNumber(). See x2_it_example.nss
     if (GetModuleSwitchValue(MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS) == TRUE)
     {
        SetUserDefinedItemEventNumber(X2_ITEM_EVENT_ACTIVATE);
        int nRet =   ExecuteScriptAndReturnInt(GetUserDefinedItemEventScriptName(oItem),OBJECT_SELF);
        if (nRet == X2_EXECUTE_SCRIPT_END)
        {
           return;
        }

     }

}

void ActionXpWand()
{
    object oPC = GetItemActivator();
    object oTarget = GetItemActivatedTarget();
    if(GetIsObjectValid(oTarget) && (oTarget != oPC))
    {
        AssignCommand(oPC,SpeakString("I grant thee knowledge."));
        GiveXPToCreature(oTarget, 1000);
    }
    return;
}

void ActionJailWand()
{
    object oPC = GetItemActivator();
    object oTarget = GetItemActivatedTarget();
    string sArea = GetTag(GetArea(oTarget));
    if(GetIsObjectValid(oTarget) && (oTarget != oPC) && (sArea == "CaravanWayREBUILD") && (GetIsPC(oTarget)))
    {
        AssignCommand(oPC,SpeakString("Guards!  Take this one away!"));
        DelayCommand(1.0,AssignCommand(oTarget,ActionJumpToLocation(GetLocation(GetObjectByTag("WP_Jail")))));
        DelayCommand(4.0,FloatingTextStringOnCreature(GetName(oTarget)+" has been arrested.",oTarget,FALSE));
        DelayCommand(5.0,SetStandardFactionReputation(STANDARD_FACTION_COMMONER, 50, oTarget));
    }
    return;
}


void UseDMWand()
{
    object oItem=GetItemActivated();
    object oActivator=GetItemActivator();

    if(GetTag(oItem)=="DMsHelper")
    {
        // Test to make sure the activator is a DM, or is a DM
        // controlling a creature.
        if(GetIsDM(oActivator) != TRUE)
        {
            object oTest = GetFirstPC();
            string sTestName = GetPCPlayerName(oActivator);
            int nFound = FALSE;
            while (GetIsObjectValid(oTest) && (! nFound))
            {
                if (GetPCPlayerName(oTest) == sTestName)
                {
                    if(GetIsDM(oTest))
                    {
                        nFound = TRUE;
                    }
                    else
                    {
                        DestroyObject(oItem);
                        SendMessageToPC(oActivator,"You are mortal and this is not yours!");
                        return;
                    }
                }
                oTest=GetNextPC();
            }
        }
        // get the wand's activator and target, put target info into local vars on activator
        object oMyActivator = GetItemActivator();
        object oMyTarget = GetItemActivatedTarget();
        SetLocalObject(oMyActivator, "dmwandtarget", oMyTarget);
        location lMyLoc = GetItemActivatedTargetLocation();
        SetLocalLocation(oMyActivator, "dmwandloc", lMyLoc);

        //Make the activator start a conversation with itself
        AssignCommand(oMyActivator, ActionStartConversation(oMyActivator, "dmwand", TRUE));
        return;
    }

    if(GetTag(oItem)=="AutoFollow")
    {
        object oTarget = GetItemActivatedTarget();

        if(GetIsObjectValid(oTarget))
        {
            AssignCommand ( oActivator, ActionForceFollowObject(oTarget));
        }
        return;
    }

    if(GetTag(oItem)=="WandOfFX")
    {

        // get the wand's activator and target, put target info into local vars on activator
        object oDM = GetItemActivator();
        object oMyTarget = GetItemActivatedTarget();
        SetLocalObject(oDM, "FXWandTarget", oMyTarget);
        location lTargetLoc = GetItemActivatedTargetLocation();
        SetLocalLocation(oDM, "FXWandLoc", lTargetLoc);

        object oTest=GetFirstPC();
        string sTestName = GetPCPlayerName(oDM);
        // Test to make sure the activator is a DM, or is a DM
        // controlling a creature.

        if(GetIsDM(oDM) != TRUE)
        {
            object oTest = GetFirstPC();
            string sTestName = GetPCPlayerName(oDM);
            int nFound = FALSE;
            while (GetIsObjectValid(oTest) && (! nFound))
            {
                if (GetPCPlayerName(oTest) == sTestName)
                {
                    if(GetIsDM(oTest))
                    {
                        nFound = TRUE;
                    }
                    else
                    {
                        DestroyObject(oItem);
                        SendMessageToPC(oDM,"You are mortal and this is not yours!");
                        return;
                    }
                }
                oTest=GetNextPC();
            }
        }

        //Make the activator start a conversation with itself
        AssignCommand(oDM, ActionStartConversation(oDM, "fxwand", TRUE));
        return;

    }
    if(GetTag(oItem)=="EmoteWand")
    {
        AssignCommand(oActivator, ActionStartConversation(oActivator, "emotewand", TRUE));
        return;
    }
}


void ActionDig()
{
    object oPC = GetItemActivator();
    object oFishingRod = GetObjectByTag("AR_IT_SHOVEL");
    object oPoss = GetItemPossessedBy(oPC, "AR_IT_SHOVEL");
    object oBearspawn = GetWaypointByTag("WP_Dig");
    location lBear = GetLocation(oBearspawn);
    location lLoc = GetLocation(oPC);
    int nDexMod = GetAbilityModifier (ABILITY_DEXTERITY, oPC);
    int nWisMod = GetAbilityModifier (ABILITY_WISDOM, oPC);
    int nRoll = d20(); //The roll
    float fDist = GetDistanceBetween(oPC,oBearspawn);
    int nTotal = nRoll + nDexMod + nWisMod; //Total roll
    SendMessageToPC(oPC, "You try to dig.");
    //int nFishLong = d20() + 9; //The longer of the fish
    //string sFish = IntToString(nFishLong);
    if ( fDist <= 30.0 )
    {
        if (oPoss != OBJECT_INVALID) //Checks if the PC has a fishing rod!
        {
            //PlaySound("as_na_splash2");
            if (nTotal >= 18) //DC check to catch a fish, it's not that easy!
            {
                int nCatch= d100(); //ok, what did the PC caught?
                if (nCatch == 100) //PC gets a loot bag!
                {
                    CreateObject(OBJECT_TYPE_PLACEABLE, "plc_lootbag2", lLoc, TRUE);
                    SendMessageToPC(oPC, "You found a bag");
                }
                if ( (nCatch >= 50) && (nCatch <= 99) ) //PC gets a fish
                {
                    //CreateObject(OBJECT_TYPE_ITEM, "OrboftheAncients", lLoc, TRUE);
                    SendMessageToPC(oPC, "You found a lot of sand.");
                }
                if ( (nCatch >= 30) && (nCatch <=49) ) //PC gets a bottle
                {
                    CreateObject(OBJECT_TYPE_ITEM, "nw_it_thnmisc001", lLoc, TRUE);
                    SendMessageToPC(oPC, "You found an empty bottle!!!!");
                }
                if ( (nCatch >= 25) && (nCatch <=29) ) //PC gets a skeleton and fight
                {
                    CreateObject(OBJECT_TYPE_PLACEABLE, "nw_pl_skeleton", lLoc, TRUE);
                    SendMessageToPC(oPC, "You found a skeleton");
                }
                if ( (nCatch >= 20) && (nCatch <=24) ) //PC gets a corpse
                {
                    CreateObject(OBJECT_TYPE_PLACEABLE, "plc_corpse1", lLoc, TRUE);
                    SendMessageToPC(oPC, "You found a corpse");
                }
                if ( (nCatch >= 10) && (nCatch <=19) ) //PC gets rags
                {
                    CreateObject(OBJECT_TYPE_ITEM, "nw_it_msmlmisc21", lLoc, TRUE);
                    SendMessageToPC(oPC, "You found some smelly rags");
                }
                if ( (nCatch >= 05) && (nCatch <=09) ) //PC gets a gargoyle skull
                {
                    CreateObject(OBJECT_TYPE_ITEM, "nw_it_msmlmisc14", lLoc, TRUE);
                    SendMessageToPC(oPC, "You found a skull");
                }
                if ( (nCatch >= 01) && (nCatch <=04) ) //PC gets stein
                {
                    CreateObject(OBJECT_TYPE_ITEM, "QST_ORBANCIENTS", lLoc, TRUE);
                    SendMessageToPC(oPC, "You found an orb");
                }
            }
            if (nTotal <= 17) //Too bad!
            {
                SendMessageToPC(oPC, "You found nothing, better luck next time!");
                AssignCommand(oPC,ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_BORED , 1.0, 2.0));
            }
            int nBreak = d100(); //that's to check if the rod will break!
            if (nBreak >= 95)
            {
                SendMessageToPC(oPC, "You broke your shovel.");
                DestroyObject(oPoss, 0.0);
                //PlaySound("as_na_branchsnp3");
                //AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SIT_CROSS , 1.0, 2.0));
            }
        }
        else
        {
            SendMessageToPC(oPC, "You don't have a shovel.");
            //AssignCommand(oPC,
            //ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD , 1.0, 2.0));
        }
    }
    else
    {
        SendMessageToPC(oPC, "You can't dig here.");
    }
}

void ActionForeHelm()
{
    object oPC;
    oPC = GetItemActivator();
    object oTarget;
    object oItem;
    oTarget = oPC;
    oItem = GetItemInSlot(INVENTORY_SLOT_HEAD, oTarget);

    itemproperty ipAdd;
    ipAdd = ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_BACKSTAB);
    IPSafeAddItemProperty(oItem, ipAdd, 120.0f);
    oTarget = GetItemActivator();

    //Visual effects can't be applied to waypoints, so if it is a WP
    //apply to the WP's location instead
    int nInt;
    nInt = GetObjectType(oTarget);

    if (nInt != OBJECT_TYPE_WAYPOINT)
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_GLOBE_USE), oTarget);

        else
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_POLYMORPH), GetLocation(oTarget));
}

void ActionMagicBook()
{
   object oMyActivator = OBJECT_SELF;
   object oMyTarget;
   SetLocalObject(oMyActivator, "magicbook", oMyTarget);
   location lMyLoc;
   SetLocalLocation(oMyActivator, "magicbookloc", lMyLoc);

   //Make the activator start a conversation with itself
   AssignCommand(oMyActivator, ActionStartConversation(oMyActivator, "ka_magicbook", TRUE));
   return;
}
void ActionLawBook()
{
   object oMyActivator = OBJECT_SELF;
   object oMyTarget;
   SetLocalObject(oMyActivator, "lawbook", oMyTarget);
   location lMyLoc;
   SetLocalLocation(oMyActivator, "lawbookloc", lMyLoc);

   //Make the activator start a conversation with itself
   AssignCommand(oMyActivator, ActionStartConversation(oMyActivator, "ka_lawbook", TRUE));
   return;
}
void ActionBloodBone()
{
    object oPC;

object oTarget;
oTarget = GetItemActivator();

//Visual effects can't be applied to waypoints, so if it is a WP
//apply to the WP's location instead

int nInt;
int nEvent =GetUserDefinedItemEventNumber();
nInt = GetObjectType(oTarget);
if (nEvent ==  X2_ITEM_EVENT_ACTIVATE)
if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DEATH), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DEATH), GetLocation(oTarget));

//Visual effects can't be applied to waypoints, so if it is a WP
//apply to the WP's location instead

nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_PWKILL), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_PWKILL), GetLocation(oTarget));

oPC = GetItemActivator();

object oItem;
oTarget = oPC;

oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oTarget);

itemproperty ipAdd;
ipAdd = ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_BACKSTAB);

IPSafeAddItemProperty(oItem, ipAdd, 120.0f);

oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oTarget);

ipAdd = ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_CRITICAL_HITS);

IPSafeAddItemProperty(oItem, ipAdd, 120.0f);

oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oTarget);

ipAdd = ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_DEATH_MAGIC);

IPSafeAddItemProperty(oItem, ipAdd, 120.0f);

oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oTarget);

ipAdd = ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_DISEASE);

IPSafeAddItemProperty(oItem, ipAdd, 120.0f);

oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oTarget);

ipAdd = ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_FEAR);

IPSafeAddItemProperty(oItem, ipAdd, 120.0f);

oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oTarget);

ipAdd = ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_LEVEL_ABIL_DRAIN);

IPSafeAddItemProperty(oItem, ipAdd, 120.0f);

oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oTarget);

ipAdd = ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_PARALYSIS);

IPSafeAddItemProperty(oItem, ipAdd, 120.0f);

oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oTarget);

ipAdd = ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_POISON);

IPSafeAddItemProperty(oItem, ipAdd, 120.0f);

oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oTarget);

ipAdd = ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_MINDSPELLS);

IPSafeAddItemProperty(oItem, ipAdd, 120.0f);
}
void ActionBootsEvasion()
{
    int nEvent =GetUserDefinedItemEventNumber();
    object oPC;
    object oItem;
    object oTarget;
    oTarget = oPC;

    if (nEvent ==  X2_ITEM_EVENT_ACTIVATE)
    {
        oItem = GetItemActivated();
        IPSafeAddItemProperty(oItem, ItemPropertyImprovedEvasion(), RoundsToSeconds(10));
    }
int nInt;
nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_BREACH), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_BREACH), GetLocation(oTarget));
}
void ActionStaffTime()
{
object oPC;

object oTarget;
oTarget = GetItemActivator();

//Visual effects can't be applied to waypoints, so if it is a WP
//apply to the WP's location instead

int nInt;
int nEvent =GetUserDefinedItemEventNumber();
nInt = GetObjectType(oTarget);
if (nEvent ==  X2_ITEM_EVENT_ACTIVATE)
if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_TIME_STOP), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_TIME_STOP), GetLocation(oTarget));

//Visual effects can't be applied to waypoints, so if it is a WP
//apply to the WP's location instead

nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), GetLocation(oTarget));

oPC = GetItemActivator();


object oItem;
oTarget = oPC;

oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oTarget);

itemproperty ipAdd;
ipAdd = ItemPropertyHaste();

IPSafeAddItemProperty(oItem, ipAdd, 120.0f);

oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oTarget);

ipAdd = ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_PARALYSIS);

IPSafeAddItemProperty(oItem, ipAdd, 120.0f);

oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oTarget);

ipAdd = ItemPropertyImprovedEvasion();

IPSafeAddItemProperty(oItem, ipAdd, 120.0f);

}


int wow_CheckTag()
{
    object oItem = GetItemActivated();
    string sTag = GetTag(oItem);
    int nReturn;

    if(sTag == "AR_IT_SHOVEL")
    {
        nReturn = TRUE;
        ActionDig();
    }
    else if(sTag == "AR_HELM_FORSEE")
    {
        nReturn = TRUE;
        ActionForeHelm();
    }
    else if(sTag == "XpWand")
    {
        nReturn = TRUE;
        ActionXpWand();
    }
    else if(sTag == "JailWand")
    {
        nReturn = TRUE;
        ActionJailWand();
    }
     else if(sTag == "staffoftime")
    {
        nReturn = TRUE;
        ActionStaffTime();
    }
     else if(sTag == "bloodbonearmor")
    {
        nReturn = TRUE;
        ActionBloodBone();
    }
     else if(sTag == "AR_ITMBTS_EVADE")
    {
        nReturn = TRUE;
        ActionBootsEvasion();
    }
    else if(sTag == "bookofmagical")
    {
        nReturn = TRUE;
        ActionMagicBook();
    }
    else if(sTag == "bookoflaws")
    {
        nReturn = TRUE;
        ActionLawBook();
    }
    else if(sTag == "DMsHelper" || sTag == "AutoFollow" || sTag == "WandOfFX" || sTag == "EmoteWand")
    {
        nReturn = TRUE;
        UseDMWand();
    }
    return nReturn;
}

