//::///////////////////////////////////////////////
//:: Death Script
//:: AR_MOD_ONDEATH.NSS
//:: Copyright (c) 2008 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script handles the default behavior
    that occurs when a player or creature dies.

    BK: October 8 2002: Overriden for Expansion

    Deva Winblood:  April 21th, 2008: Modified to
    handle dismounts when PC dies while mounted.

    DM Heatstroke: 09/01/09
    Added AR additions

*/
//:://////////////////////////////////////////////
//:: Created By: Brent Knowles
//:: Created On: November 6, 2001
//:://////////////////////////////////////////////

#include "dante_db"
#include "aps_include"
#include "_inc_livingdead_"
#include "_inc_battlecry_"
//#include "ar_db_main"
//#include "wow_inc_scouting"

void AdjustPlayerStats(object oDied, object oKiller);
void ApplyPenalty(object oDied);
void ClearAllFactionMembers(object oPlayer);
void ItemLossUponDeath(object oPlayer);
location RadiusAroundLocation(object oPlayer);
void BoardChange(object oPlayer, string sBoard);
//void UndeadCheck(object oMyKiller);

//Updates the arena kill board
void ArenaKillsUpdate();

void main()
{
    object oPlayer = GetLastPlayerDied();
    object oKiller = GetLastHostileActor(oPlayer);

    //log the death to arsx
    //SetLocalInt(oPlayer,"arsx_Last_kill",ARSX_LogKill(oPlayer,oKiller));

    // Necromancy 101/
    DoDeathCry();
    //////////////////
    // * Destroy some items xp and gold.

    if (GetTag(GetArea(oPlayer)) != "TYR_GS_ARENA")
    {
        //If was killed by a player and that player was 4 or less levels higher
        if (((GetIsPC(oKiller)) || (GetIsPC(GetMaster(oKiller)))))
        {
            if ((GetHitDice(oKiller) <= (GetHitDice(oPlayer) + 8)))
            {
                //Set correct stats for the PvP boards
                AdjustPlayerStats(oPlayer, oKiller);
                ItemLossUponDeath(oPlayer);
                //If was killed by a player 17% chance that a ghost will spawn
                if (d6() > 5)
                {
                    AssignCommand(oPlayer,SpeakString("My ghost will haunt you!", TALKVOLUME_TALK));
                    CreateObject(OBJECT_TYPE_CREATURE, "shfiend001", GetLocation(oPlayer));
                }
            }
        }
        //Wasn't killed by a player
        else
        {
            if ((GetTag(oKiller) == "npc_tyrguard001") ||   // Tyr Guard
                (GetTag(oKiller) == "npc_tyrguardcapt") ||  // Tyr Guard Capt
                (GetTag(oKiller) == "npc_tyrtowncrier") ||  // Tyr Town Crier
                (GetTag(oKiller) == "UrikiteGuard") ||
                (GetTag(oKiller) == "UrikiteTemplar") ||
                (GetTag(oKiller) == "MrHelpful"))
            {
                SetLocalInt(oPlayer, "DefenderKill", TRUE);
                SetLocalString(oPlayer,"DefenderTag",GetTag(oKiller));
                SpeakString("You fought the law, & the law won.");
            }
            ItemLossUponDeath(oPlayer);
            ApplyPenalty(oPlayer);
        }
        //Player died so here's a death variable
        SetLocalInt(oPlayer, "bDeath", TRUE);
    }
    else
    {
        AdjustPlayerStats(oPlayer, oKiller);
    }
    //Remove NPC hostilities
    ClearAllFactionMembers(oPlayer);
    //Pop up the Respawn GUI
    DelayCommand(2.5, PopUpGUIPanel(oPlayer, GUI_PANEL_PLAYER_DEATH));
}

void AdjustPlayerStats(object oDied, object oKiller)
{
    string sDied = GetName(oDied);
    int nDied;

    //Ok, someone pked?
    if(GetIsPC(oKiller) || GetIsPC(GetMaster(oKiller)) || GetIsPC(GetAreaOfEffectCreator(oKiller)))
    {
        if (!GetIsDM(oKiller) && !GetIsDMPossessed(oKiller) && !GetIsDM(GetMaster(oKiller)))
        {
            // Let everyone know of PK kill.
            string sWhere = GetName(GetArea(oDied));
            string sKiller = GetName(oKiller);
            string sVarDead = GetCampaignVariableName(oDied);
            //Make sure if it's a pet their master gets the credit
            if(GetIsPC(GetMaster(oKiller)))
            {
                oKiller = GetMaster(oKiller);
                sKiller = GetName(oKiller);
            }
            else if(GetIsPC(GetAreaOfEffectCreator(oKiller)))
            {
                oKiller = GetAreaOfEffectCreator(oKiller);
                sKiller = GetName(oKiller);
            }
            string sVarKiller = GetCampaignVariableName(oKiller);

            string sMsg;
            switch(d8())
            {
                case 1: sMsg = " has been slain by "; break;
                case 2: sMsg = " fell before the might of "; break;
                case 3: sMsg = " was put down by "; break;
                case 4: sMsg = " felt the cold wrath of "; break;
                case 5: sMsg = " suffered a humiliating defeat at the hands of "; break;
                case 6: sMsg = " was destroyed by "; break;
                case 7: sMsg = " has been destroyed by "; break;
                case 8: sMsg = " was crushed by "; break;
            }
            string sPKKillMsg = sDied + sMsg + sKiller + " in " + sWhere + "!";
            string sBounty = "";

            if(oKiller == oDied)
            {
                if(GetGender(oDied))
                    sPKKillMsg = sDied + " killed herself!";
                else
                    sPKKillMsg = sDied + " killed himself!";

                object oPl = GetFirstPC();
                while(GetIsObjectValid(oPl))
                {
                    SendMessageToPC(oPl, sPKKillMsg);
                    oPl = GetNextPC();
                }
            }
            //Was the kill in the arena?
            else if(GetTag(GetArea(oKiller)) == "TyrSSArena")
            {
                //Increment kill variable
                int nKills = GetLocalInt(oKiller, "Arena");
                SetLocalInt(oKiller, "Arena", ++nKills);
                //SetCampaignInt("DSOSTATS", "Arena" + sVarKiller, nKills, oKiller);
                SetPersistentInt(oKiller, "Arena" + sVarKiller, nKills,0,"ar_dsostats");
                //ARSX_ArenaKill(oKiller);

                BoardChange(oKiller, "Arena");

                object oPl = GetFirstPC();
                while(GetIsObjectValid(oPl))
                {
                    SendMessageToPC(oPl, sPKKillMsg);
                    oPl = GetNextPC();
                }
                //Updates the arena kill board
                ArenaKillsUpdate();
            }
            else //Kill was made outside of the arena
            {
                //Increment the kill variable
                int nKills = GetLocalInt(oKiller, "Player");
                SetLocalInt(oKiller, "Player", ++nKills);
                //SetCampaignInt("DSOStats", "Player" + sVarKiller, nKills, oKiller);
                nKills = GetPersistentInt(oKiller, "Player" + sVarKiller, "ar_dsostats");
                SetPersistentInt(oKiller, "Player" + sVarKiller, nKills++,0,"ar_dsostats");

                BoardChange(oKiller, "Player");

                int nGoldToTake = FloatToInt(0.15 * GetGold(oDied));
                int nBounty = FloatToInt(nGoldToTake * 0.30f);
                nGoldToTake -= nBounty;
                //AssignCommand(oDied, GiveGoldToCreature(oKiller, nGoldToTake));
                AssignCommand(oDied, TakeGoldFromCreature((nBounty+nGoldToTake), oDied, TRUE));
                //int nDiedBounty = GetLocalInt(oDied, "Bounty");
                int nDiedBounty = GetPersistentInt(oDied, "Bounty" + sVarDead, "ar_dsostats");
                //SetLocalInt(oDied, "Bounty", 0);
                //SetCampaignInt("DSOStats", "Bounty" + sVarDead, 0, oDied);

                if(nDiedBounty > 0)
                {
                    AssignCommand(oDied, GiveGoldToCreature(oKiller, nDiedBounty+nGoldToTake));
                    SetPersistentInt(oDied, "Bounty" + sVarDead, 0,0,"ar_dsostats");
                    SetLocalInt(oDied, "nBounty", 0);
                    string sBounty = GetName(oKiller) + " received " + IntToString(nDiedBounty) + " ceramic pieces from the bounty on " + GetName(oDied) + "'s head!";

                    object oPl = GetFirstPC();
                    while(GetIsObjectValid(oPl))
                    {
                        SendMessageToPC(oPl, sPKKillMsg);
                        SendMessageToPC(oPl, sBounty);
                        oPl = GetNextPC();
                    }
                }
                else
                {
                    SendMessageToPC(oDied, "The dead players bounty is not greater than 0");
                    int nOldBounty = GetPersistentInt(oKiller, "Bounty" + sVarKiller, "ar_dsostats");
                    SetPersistentInt(oKiller, "Bounty" + sVarKiller, (nOldBounty+nBounty),0,"ar_dsostats");
                    SetLocalInt(oDied, "nBounty", (nOldBounty+nBounty));
                    AssignCommand(oDied, GiveGoldToCreature(oKiller, nGoldToTake));
                    object oPl = GetFirstPC();
                    while(GetIsObjectValid(oPl))
                    {
                        SendMessageToPC(oPl, sPKKillMsg);
                        oPl = GetNextPC();
                    }
                }
                //int nCampBounty = GetLocalInt(oKiller, "Bounty");
                //SetLocalInt(oKiller, "Bounty", (nCampBounty+nBounty));
                //SetCampaignInt("DSOStats", "Bounty" + sVarKiller, (nCampBounty+nBounty), oKiller);
                //SetPersistentInt(oKiller, "Bounty" + sVarKiller, (nCampBounty+nBounty),0,"ar_dsostats");
            }
        }
    }
    else //Died from monsters or something other than players
    {
        int nGoldToTake = FloatToInt(0.10 * GetGold(oDied));
        // * a cap of 10 000gp taken from you
        if (nGoldToTake > 10000)
            nGoldToTake = 10000;
        TakeGoldFromCreature(nGoldToTake, oDied, TRUE);
    }
}

void ApplyPenalty(object oDied)
{
    int nXP = GetXP(oDied);
    int nPenalty = 50 * GetHitDice(oDied);
    int nHD = GetHitDice(oDied);
    // * You can not lose a level with this respawning
    int nMin = ((nHD * (nHD - 1)) / 2) * 1000;

    int nNewXP = nXP - nPenalty;
    if (nNewXP < nMin)
       nNewXP = nMin;
    if (nXP != nNewXP)
        SetXP(oDied, nNewXP);
}

void ClearAllFactionMembers(object oPlayer)
{
    if( GetRacialType(oPlayer) == 225 ) //  Illithid
        {
            AdjustReputation(oPlayer, GetObjectByTag("ATHAS_FACTION_ILLITHID"), 90); // Adjust faction reputation
        }
    // * make friendly to Each of the 3 common factions
    AssignCommand(oPlayer, ClearAllActions());
    // * Note: waiting for Sophia to make SetStandardFactionReptuation to clear all personal reputation
    if (GetStandardFactionReputation(STANDARD_FACTION_COMMONER, oPlayer) <= 10)
    {
        SetLocalInt(oPlayer, "NW_G_Playerhasbeenbad", 10); // * Player bad
        SetStandardFactionReputation(STANDARD_FACTION_COMMONER, 80, oPlayer);
    }
    if (GetStandardFactionReputation(STANDARD_FACTION_MERCHANT, oPlayer) <= 10)
    {
        SetLocalInt(oPlayer, "NW_G_Playerhasbeenbad", 10); // * Player bad
        SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, 80, oPlayer);
    }
    if (GetStandardFactionReputation(STANDARD_FACTION_DEFENDER, oPlayer) <= 10)
    {
        SetLocalInt(oPlayer, "NW_G_Playerhasbeenbad", 10); // * Player bad
        SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, 80, oPlayer);
    }
}

void ItemLossUponDeath(object oPlayer)
{
    // Loop thru the backpack and have
    object oItem = GetFirstItemInInventory(oPlayer);
    while(GetIsObjectValid(oItem))
    {
        //If the item is stolen it is dropped
        if(GetStolenFlag(oItem))
        {
            if(!GetPlotFlag(oItem))
            {
                //Every item lost has a 20% chance to be destroyed
                if(Random(100) < 20)
                {
                    //Destroy original item
                    DestroyObject(oItem);
                }
                else
                {
                    //'Drop' the item in a 1 meter radius around where the player fell
                    CopyObject(oItem, RadiusAroundLocation(oPlayer));
                    //Destroy original item
                    DestroyObject(oItem);
                }
            }
        }
        else
        {
            //Every item has a 4% chance to be lost
            if(Random(100) < 4)
            {
                //Make sure the item is not a plot item
                if (!GetPlotFlag(oItem))
                {
                    //Every item lost has a 20% chance to be destroyed
                    if(Random(100) < 20)
                    {
                        //Destroy original item
                        DestroyObject(oItem);
                    }
                    else
                    {
                        //'Drop' the item in a 1 meter radius around where the player fell
                        CopyObject(oItem, RadiusAroundLocation(oPlayer));
                        //Destroy original item
                        DestroyObject(oItem);
                    }
                }
            }
        }
        oItem = GetNextItemInInventory(oPlayer);
    }
}

location RadiusAroundLocation(object oPlayer)
{
    object oArea = GetArea(oPlayer);
    vector vPosition = (GetPosition(oPlayer) + Vector(((((Random(100) + 1) * 0.01f) * 2) - 1.0f), ((((Random(100) + 1) * 0.01f) * 2) - 1.0f), 0.0f));
    float fOrientation = IntToFloat(Random(360) + 1);
    location lLocation = Location(oArea, vPosition, fOrientation);

    return lLocation;
}

void BoardChange(object oPlayer, string sBoard)
{
    object oModule = GetModule();
    int nTemp = GetLocalInt(oPlayer, sBoard);
    string sTemp = GetName(oPlayer);
    string sPlayerName = sTemp;
    string sAccountTemp = GetStringUpperCase(GetPCPlayerName(oPlayer));
    string sPlayerAccount = sAccountTemp;
    int nTemp2;
    string sTemp2;
    string sAccountTemp2;
    int x;

    for (x = 1; x <= 10; x++)
    {
        if ((sPlayerAccount == GetLocalString(oModule, "s" + sBoard + "KillsAccount" + IntToString(x))) && (sPlayerName == GetLocalString(oModule, "s" + sBoard + "Kills" + IntToString(x))))
        {
            SetLocalInt(oModule, "n" + sBoard + "Kills" + IntToString(x), 0);
            SetLocalString(oModule, "s" + sBoard + "Kills" + IntToString(x), "");
            SetLocalString(oModule, "s" + sBoard + "KillsAccount" + IntToString(x), "");
        }

        if (sAccountTemp == sPlayerAccount)
        {
            if (nTemp > GetLocalInt(oModule, "n" + sBoard + "Kills" + IntToString(x)))
            {
                nTemp2 = GetLocalInt(oModule, "n" + sBoard + "Kills" + IntToString(x));
                sTemp2 = GetLocalString(oModule, "s" + sBoard + "Kills" + IntToString(x));
                sAccountTemp2 = GetLocalString(oModule, "s" + sBoard + "KillsAccount" + IntToString(x));

                SetLocalInt(oModule, "n" + sBoard + "Kills" + IntToString(x), nTemp);
                SetLocalString(oModule, "s" + sBoard + "Kills" + IntToString(x), sTemp);
                SetLocalString(oModule, "s" + sBoard + "KillsAccount" +  IntToString(x), sAccountTemp);
                // SetCampaignInt("DSOStats", "n" + sBoard + "Kills" + IntToString(x), nTemp);
                SetPersistentInt(oModule, "n" + sBoard + "Kills" + IntToString(x), nTemp,0,"ar_dsostats");

                //SetCampaignString("DSOStats", "s" + sBoard + "Kills" + IntToString(x), sTemp);
                SetPersistentString(oModule,"s" + sBoard + "Kills" + IntToString(x), sTemp,0,"ar_dsostats");
                //SetCampaignString("DSOStats", "s" + sBoard + "KillsAccount" + IntToString(x), sAccountTemp);
                SetPersistentString(oModule,"s" + sBoard + "KillsAccount" + IntToString(x), sAccountTemp,0,"ar_dsostats");

                nTemp = nTemp2;
                sTemp = sTemp2;
                sAccountTemp = sAccountTemp2;
            }
        }
        else
        {
            if (nTemp >= GetLocalInt(oModule, "n" + sBoard + "Kills" + IntToString(x)))
            {
                nTemp2 = GetLocalInt(oModule, "n" + sBoard + "Kills" + IntToString(x));
                sTemp2 = GetLocalString(oModule, "s" + sBoard + "Kills" + IntToString(x));
                sAccountTemp2 = GetLocalString(oModule, "s" + sBoard + "KillsAccount" + IntToString(x));

                SetLocalInt(oModule, "n" + sBoard + "Kills" + IntToString(x), nTemp);
                SetLocalString(oModule, "s" + sBoard + "Kills" + IntToString(x), sTemp);
                SetLocalString(oModule, "s" + sBoard + "KillsAccount" +  IntToString(x), sAccountTemp);
               // SetCampaignInt("DSOStats", "n" + sBoard + "Kills" + IntToString(x), nTemp);
                SetPersistentInt(oModule, "n" + sBoard + "Kills" + IntToString(x), nTemp,0,"ar_dsostats");

                //SetCampaignString("DSOStats", "s" + sBoard + "Kills" + IntToString(x), sTemp);
                SetPersistentString(oModule,"s" + sBoard + "Kills" + IntToString(x), sTemp,0,"ar_dsostats");
                //SetCampaignString("DSOStats", "s" + sBoard + "KillsAccount" + IntToString(x), sAccountTemp);
                SetPersistentString(oModule,"s" + sBoard + "KillsAccount" + IntToString(x), sAccountTemp,0,"ar_dsostats");

                nTemp = nTemp2;
                sTemp = sTemp2;
                sAccountTemp = sAccountTemp2;
            }
        }
    }
}

void ArenaKillsUpdate()
{
    string sFetchString = "SELECT * FROM athaspw.ar_dsostats WHERE name LIKE'Arena%' ORDER BY val desc";
    SQLExecDirect(sFetchString);
    object oModule = GetModule();
    string sName;
    int x;

    for (x = 1; x <= 10; x++)
    {
        SQLFetch();
        sName = SQLGetData(2);
        SetLocalString(oModule, "sArenaKills" + IntToString(x), sName);
    }
}





















/*
#include "x3_inc_horse"
#include "dante_db"
//#include "aps_include"
#include "ar_db_main"  //-  Waiting on Nitecap -DMH

void AdjustPlayerStats(object oDied, object oKiller);
void ApplyPenalty(object oDead);
void ClearAllFactionMembers(object oPlayer);
void ItemLossUponDeath(object oPlayer);
void BoardChange(object oPlayer, string sBoard);
location RadiusAroundLocation(object oPlayer);

void Raise(object oPlayer)
{
        effect eVisual = EffectVisualEffect(VFX_IMP_RESTORATION);

        effect eBad = GetFirstEffect(oPlayer);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oPlayer);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints(oPlayer)), oPlayer);

        //Search for negative effects
        while(GetIsEffectValid(eBad))
        {
            if (GetEffectType(eBad) == EFFECT_TYPE_ABILITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_AC_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_ATTACK_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SAVING_THROW_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SPELL_RESISTANCE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SKILL_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_BLINDNESS ||
                GetEffectType(eBad) == EFFECT_TYPE_DEAF ||
                GetEffectType(eBad) == EFFECT_TYPE_PARALYZE ||
                GetEffectType(eBad) == EFFECT_TYPE_NEGATIVELEVEL)
                {
                    //Remove effect if it is negative.
                    RemoveEffect(oPlayer, eBad);
                }
            eBad = GetNextEffect(oPlayer);
        }
        //Fire cast spell at event for the specified target
        SignalEvent(oPlayer, EventSpellCastAt(OBJECT_SELF, SPELL_RESTORATION, FALSE));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oPlayer);
}


///////////////////////////////////////////////////////////////[ MAIN ]/////////
void main()
{
    object oPlayer = GetLastPlayerDied();
    object oKiller = GetLastHostileActor(oPlayer);
    object oHorse;
    object oInventory;
    string sID;
    int nC;
    string sT;
    string sR;
    int nCH;
    int nST;
    object oItem;
    effect eEffect;
    string sDB="X3SADDLEBAG"+GetTag(GetModule());
    if (GetStringLength(GetLocalString(GetModule(),"X3_SADDLEBAG_DATABASE"))>0) sDB=GetLocalString(GetModule(),"X3_SADDLEBAG_DATABASE");
    if (HorseGetIsMounted(oPlayer))
    { // Dismount and then die
        //SetCommandable(FALSE,oPlayer);
        //ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oPlayer);
        DelayCommand(0.3,HORSE_SupportResetUnmountedAppearance(oPlayer));
        DelayCommand(3.0,HORSE_SupportCleanVariables(oPlayer));
        DelayCommand(1.0,HORSE_SupportRemoveACBonus(oPlayer));
        DelayCommand(1.0,HORSE_SupportRemoveHPBonus(oPlayer));
        DelayCommand(1.1,HORSE_SupportRemoveMountedSkillDecreases(oPlayer));
        DelayCommand(1.1,HORSE_SupportAdjustMountedArcheryPenalty(oPlayer));
        DelayCommand(1.2,HORSE_SupportOriginalSpeed(oPlayer));
        if (!GetLocalInt(GetModule(),"X3_HORSE_NO_CORPSES"))
        { // okay to create lootable horse corpses
            sR=GetSkinString(oPlayer,"sX3_HorseResRef");
            sT=GetSkinString(oPlayer,"sX3_HorseMountTag");
            nCH=GetSkinInt(oPlayer,"nX3_HorseAppearance");
            nST=GetSkinInt(oPlayer,"nX3_HorseTail");
            nC=GetLocalInt(oPlayer,"nX3_HorsePortrait");
            if (GetStringLength(sR)>0&&GetStringLeft(sR,GetStringLength(HORSE_PALADIN_PREFIX))!=HORSE_PALADIN_PREFIX)
            { // create horse
                oHorse=HorseCreateHorse(sR,GetLocation(oPlayer),oPlayer,sT,nCH,nST);
                SetLootable(oHorse,TRUE);
                SetPortraitId(oHorse,nC);
                SetLocalInt(oHorse,"bDie",TRUE);
                AssignCommand(oHorse,SetIsDestroyable(FALSE,TRUE,TRUE));
            } // create horse
        } // okay to create lootable horse corpses
        oInventory=GetLocalObject(oPlayer,"oX3_Saddlebags");
        sID=GetLocalString(oPlayer,"sDB_Inv");
        if (GetIsObjectValid(oInventory))
        { // drop horse saddlebags
            if (!GetIsObjectValid(oHorse))
            { // no horse created
                HORSE_SupportTransferInventory(oInventory,OBJECT_INVALID,GetLocation(oPlayer),TRUE);
            } // no horse created
            else
            { // transfer to horse
                HORSE_SupportTransferInventory(oInventory,oHorse,GetLocation(oHorse),TRUE);
                //DelayCommand(2.0,PurgeSkinObject(oHorse));
                //DelayCommand(3.0,KillTheHorse(oHorse));
                //DelayCommand(1.8,PurgeSkinObject(oHorse));
            } // transfer to horse
        } // drop horse saddlebags
        else if (GetStringLength(sID)>0)
        { // database based inventory
            nC=GetCampaignInt(sDB,"nCO_"+sID);
            while(nC>0)
            { // restore inventory
                sR=GetCampaignString(sDB,"sR"+sID+IntToString(nC));
                sT=GetCampaignString(sDB,"sT"+sID+IntToString(nC));
                nST=GetCampaignInt(sDB,"nS"+sID+IntToString(nC));
                nCH=GetCampaignInt(sDB,"nC"+sID+IntToString(nC));
                DeleteCampaignVariable(sDB,"sR"+sID+IntToString(nC));
                DeleteCampaignVariable(sDB,"sT"+sID+IntToString(nC));
                DeleteCampaignVariable(sDB,"nS"+sID+IntToString(nC));
                DeleteCampaignVariable(sDB,"nC"+sID+IntToString(nC));
                if (!GetIsObjectValid(oHorse))
                { // no lootable corpse
                    oItem=CreateObject(OBJECT_TYPE_ITEM,sR,GetLocation(oPlayer),FALSE,sT);
                } // no lootable corpse
                else
                { // lootable corpse
                    oItem=CreateItemOnObject(sR,oHorse,nST,sT);
                } // lootable corpse
                if (GetItemStackSize(oItem)!=nST) SetItemStackSize(oItem,nST);
                if (nCH>0) SetItemCharges(oItem,nCH);
                nC--;
            } // restore inventory
            DeleteCampaignVariable(sDB,"nCO_"+sID);
            //DelayCommand(2.0,PurgeSkinObject(oHorse));
            if (GetIsObjectValid(oHorse)&&GetLocalInt(oHorse,"bDie")) DelayCommand(3.0,KillTheHorse(oHorse));
            //DelayCommand(2.5,PurgeSkinObject(oHorse));
        } // database based inventory
        else if (GetIsObjectValid(oHorse))
        { // no inventory
            //DelayCommand(1.0,PurgeSkinObject(oHorse));
            DelayCommand(2.0,KillTheHorse(oHorse));
            //DelayCommand(1.8,PurgeSkinObject(oHorse));
        } // no inventory
        //eEffect=EffectDeath();
        //DelayCommand(1.6,ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,oPlayer));
        //DelayCommand(1.7,SetCommandable(TRUE,oPlayer));
        //return;
    } // Dismount and then die

    // * increment global tracking number of times that I died
    SetLocalInt(oPlayer, "NW_L_PLAYER_DIED", GetLocalInt(oPlayer, "NW_L_PLAYER_DIED") + 1);

    // * BK: Automation Control. Autopcs ignore death
    if (GetLocalInt(oPlayer, "NW_L_AUTOMATION") == 10)
    {
        Raise(oPlayer);
        DelayCommand(1.0, ExecuteScript("crawl", OBJECT_SELF));
        return; // Raise and return
    }

    //log the death to arsx  - Waiting on Nitecap -DMH
    //SetLocalInt(oPlayer,"arsx_Last_kill",ARSX_LogKill(oPlayer,oKiller));

        // * Destroy some items xp and gold.
    //DoDeathCry();
    if (GetTag(GetArea(oPlayer)) != "TYR_GS_ARENA")
    {
        //If was killed by a player and that player was 4 or less levels higher
        if (((GetIsPC(oKiller)) || (GetIsPC(GetMaster(oKiller)))))
        {
            if ((GetHitDice(oKiller) <= (GetHitDice(oPlayer) + 8)))
            {
                //Set correct stats for the PvP boards
                AdjustPlayerStats(oPlayer, oKiller);
                ItemLossUponDeath(oPlayer);
                //If was killed by a player 17% chance that a ghost will spawn
                if (d6() > 5)
                {
                    AssignCommand(oPlayer,SpeakString("My ghost will haunt you!", TALKVOLUME_TALK));
                    CreateObject(OBJECT_TYPE_CREATURE, "shfiend001", GetLocation(oPlayer));
                }
            }
        }
        //Wasn't killed by a player
        else
        {
            if ((GetTag(oKiller) == "TyrGuard") ||
                (GetTag(oKiller) == "TyrGuardCaptain") ||
                (GetTag(oKiller) == "MrsHelpful") ||
                (GetTag(oKiller) == "UrikiteGuard") ||
                (GetTag(oKiller) == "UrikiteTemplar") ||
                (GetTag(oKiller) == "MrHelpful"))
            {
                SetLocalInt(oPlayer, "DefenderKill", TRUE);
                SetLocalString(oPlayer,"DefenderTag",GetTag(oKiller));
                SpeakString("You fought the law, & the law won.");
            }
            ItemLossUponDeath(oPlayer);
            ApplyPenalty(oPlayer);
        }
        //Player died so here's a death variable
        SetLocalInt(oPlayer, "bDeath", TRUE);
    }
    else
    {
        AdjustPlayerStats(oPlayer, oKiller);
    }
    //Remove NPC hostilities
    ClearAllFactionMembers(oPlayer);

    //Pop up the Respawn GUI
    DelayCommand(2.5, PopUpGUIPanel(oPlayer,GUI_PANEL_PLAYER_DEATH));

}
///////////////////////////////////////////////////////////////[ MAIN ]/////////
void AdjustPlayerStats(object oDied, object oKiller)
{
    string sDied = GetName(oDied);
    int nDied;

    //Ok, someone pked?
    if(GetIsPC(oKiller) || GetIsPC(GetMaster(oKiller)) || GetIsPC(GetAreaOfEffectCreator(oKiller)))
    {
        if (!GetIsDM(oKiller) && !GetIsDMPossessed(oKiller) && !GetIsDM(GetMaster(oKiller)))
        {
            // Let everyone know of PK kill.
            string sWhere = GetName(GetArea(oDied));
            string sKiller = GetName(oKiller);
            string sVarDead = GetCampaignVariableName(oDied);
            //Make sure if it's a pet their master gets the credit
            if(GetIsPC(GetMaster(oKiller)))
            {
                oKiller = GetMaster(oKiller);
                sKiller = GetName(oKiller);
            }
            else if(GetIsPC(GetAreaOfEffectCreator(oKiller)))
            {
                oKiller = GetAreaOfEffectCreator(oKiller);
                sKiller = GetName(oKiller);
            }
            string sVarKiller = GetCampaignVariableName(oKiller);

            string sMsg;
            switch(d8())
            {
                case 1: sMsg = " has been slain by "; break;
                case 2: sMsg = " fell before the might of "; break;
                case 3: sMsg = " was put down by "; break;
                case 4: sMsg = " felt the cold wrath of "; break;
                case 5: sMsg = " suffered a humiliating defeat at the hands of "; break;
                case 6: sMsg = " was destroyed by "; break;
                case 7: sMsg = " has been destroyed by "; break;
                case 8: sMsg = " was crushed by "; break;
            }
            string sPKKillMsg = sDied + sMsg + sKiller + " in " + sWhere + "!";
            string sBounty = "";

            if(oKiller == oDied)
            {
                if(GetGender(oDied))
                    sPKKillMsg = sDied + " killed herself!";
                else
                    sPKKillMsg = sDied + " killed himself!";

                object oPl = GetFirstPC();
                while(GetIsObjectValid(oPl))
                {
                    SendMessageToPC(oPl, sPKKillMsg);
                    oPl = GetNextPC();
                }
            }
            //Was the kill in the arena?
            else if(GetTag(GetArea(oKiller)) == "TyrSSArena")
            {
                //Increment kill variable
                int nKills = GetLocalInt(oKiller, "Arena");
                SetLocalInt(oKiller, "Arena", ++nKills);
                //SetCampaignInt("DSOSTATS", "Arena" + sVarKiller, nKills, oKiller);
                SetPersistentInt(oKiller, "Arena" + sVarKiller, nKills,0,"ar_dsostats");
                //ARSX_ArenaKill(oKiller);

                BoardChange(oKiller, "Arena");

                object oPl = GetFirstPC();
                while(GetIsObjectValid(oPl))
                {
                    SendMessageToPC(oPl, sPKKillMsg);
                    oPl = GetNextPC();
                }
            }
            else //Kill was made outside of the arena
            {
                //Increment the kill variable
                int nKills = GetLocalInt(oKiller, "Player");
                SetLocalInt(oKiller, "Player", ++nKills);
                //SetCampaignInt("DSOStats", "Player" + sVarKiller, nKills, oKiller);
                SetPersistentInt(oKiller, "Player" + sVarKiller, nKills,0,"ar_dsostats");

                BoardChange(oKiller, "Player");

                int nGoldToTake = FloatToInt(0.15 * GetGold(oDied));
                int nBounty = FloatToInt(nGoldToTake * 0.30f);
                nGoldToTake -= nBounty;
                AssignCommand(oDied, GiveGoldToCreature(oKiller, nGoldToTake));
                AssignCommand(oDied, TakeGoldFromCreature((nBounty+nGoldToTake), oDied, TRUE));
                int nDiedBounty = GetLocalInt(oDied, "Bounty");
                SetLocalInt(oDied, "Bounty", 0);
                //SetCampaignInt("DSOStats", "Bounty" + sVarDead, 0, oDied);
                SetPersistentInt(oKiller, "Bounty" + sVarDead, 0,0,"ar_dsostats");

                if(nDiedBounty > 0)
                {
                    AssignCommand(oDied, GiveGoldToCreature(oKiller, nDiedBounty));
                    string sBounty = GetName(oKiller) + " received " + IntToString(nDiedBounty) + " ceramic pieces from the bounty on " + GetName(oDied) + "'s head!";

                    object oPl = GetFirstPC();
                    while(GetIsObjectValid(oPl))
                    {
                        SendMessageToPC(oPl, sPKKillMsg);
                        SendMessageToPC(oPl, sBounty);
                        oPl = GetNextPC();
                    }
                }
                else
                {
                    object oPl = GetFirstPC();
                    while(GetIsObjectValid(oPl))
                    {
                        SendMessageToPC(oPl, sPKKillMsg);
                        oPl = GetNextPC();
                    }
                }
                int nCampBounty = GetLocalInt(oKiller, "Bounty");
                SetLocalInt(oKiller, "Bounty", (nCampBounty+nBounty));
                //SetCampaignInt("DSOStats", "Bounty" + sVarKiller, (nCampBounty+nBounty), oKiller);
                SetPersistentInt(oKiller, "Bounty" + sVarKiller, (nCampBounty+nBounty),0,"ar_dsostats");
            }
        }
    }
    else //Died from monsters or something other than players
    {
        int nGoldToTake = FloatToInt(0.10 * GetGold(oDied));
        // * a cap of 10 000gp taken from you
        if (nGoldToTake > 10000)
            nGoldToTake = 10000;
        TakeGoldFromCreature(nGoldToTake, oDied, TRUE);
    }
}

void ApplyPenalty(object oDead)
{
    int nXP = GetXP(oDead);
    int nPenalty = 50 * GetHitDice(oDead);
    int nHD = GetHitDice(oDead);
    // * You can not lose a level with this respawning
    int nMin = ((nHD * (nHD - 1)) / 2) * 1000;

    int nNewXP = nXP - nPenalty;
    if (nNewXP < nMin)
       nNewXP = nMin;
    if (nXP != nNewXP)
        SetXP(oDead, nNewXP);
}

void ItemLossUponDeath(object oPlayer)
{
    // Loop thru the backpack and have
    object oItem = GetFirstItemInInventory(oPlayer);
    while(GetIsObjectValid(oItem))
    {
        //If the item is stolen it is dropped
        if(GetStolenFlag(oItem))
        {
            if(!GetPlotFlag(oItem))
            {
                //Every item lost has a 20% chance to be destroyed
                if(Random(100) < 20)
                {
                    //Destroy original item
                    DestroyObject(oItem);
                }
                else
                {
                    //'Drop' the item in a 1 meter radius around where the player fell
                    CopyObject(oItem, RadiusAroundLocation(oPlayer));
                    //Destroy original item
                    DestroyObject(oItem);
                }
            }
        }
        else
        {
            //Every item has a 4% chance to be lost
            if(Random(100) < 4)
            {
                //Make sure the item is not a plot item
                if (!GetPlotFlag(oItem))
                {
                    //Every item lost has a 20% chance to be destroyed
                    if(Random(100) < 20)
                    {
                        //Destroy original item
                        DestroyObject(oItem);
                    }
                    else
                    {
                        //'Drop' the item in a 1 meter radius around where the player fell
                        CopyObject(oItem, RadiusAroundLocation(oPlayer));
                        //Destroy original item
                        DestroyObject(oItem);
                    }
                }
            }
        }
        oItem = GetNextItemInInventory(oPlayer);
    }
}

location RadiusAroundLocation(object oPlayer)
{
    object oArea = GetArea(oPlayer);
    vector vPosition = (GetPosition(oPlayer) + Vector(((((Random(100) + 1) * 0.01f) * 2) - 1.0f), ((((Random(100) + 1) * 0.01f) * 2) - 1.0f), 0.0f));
    float fOrientation = IntToFloat(Random(360) + 1);
    location lLocation = Location(oArea, vPosition, fOrientation);

    return lLocation;
}

void BoardChange(object oPlayer, string sBoard)
{
    object oModule = GetModule();
    int nTemp = GetLocalInt(oPlayer, sBoard);
    string sTemp = GetName(oPlayer);
    string sPlayerName = sTemp;
    string sAccountTemp = GetStringUpperCase(GetPCPlayerName(oPlayer));
    string sPlayerAccount = sAccountTemp;
    int nTemp2;
    string sTemp2;
    string sAccountTemp2;
    int x;

    for (x = 1; x <= 10; x++)
    {
        if ((sPlayerAccount == GetLocalString(oModule, "s" + sBoard + "KillsAccount" + IntToString(x))) && (sPlayerName == GetLocalString(oModule, "s" + sBoard + "Kills" + IntToString(x))))
        {
            SetLocalInt(oModule, "n" + sBoard + "Kills" + IntToString(x), 0);
            SetLocalString(oModule, "s" + sBoard + "Kills" + IntToString(x), "");
            SetLocalString(oModule, "s" + sBoard + "KillsAccount" + IntToString(x), "");
        }

        if (sAccountTemp == sPlayerAccount)
        {
            if (nTemp > GetLocalInt(oModule, "n" + sBoard + "Kills" + IntToString(x)))
            {
                nTemp2 = GetLocalInt(oModule, "n" + sBoard + "Kills" + IntToString(x));
                sTemp2 = GetLocalString(oModule, "s" + sBoard + "Kills" + IntToString(x));
                sAccountTemp2 = GetLocalString(oModule, "s" + sBoard + "KillsAccount" + IntToString(x));

                SetLocalInt(oModule, "n" + sBoard + "Kills" + IntToString(x), nTemp);
                SetLocalString(oModule, "s" + sBoard + "Kills" + IntToString(x), sTemp);
                SetLocalString(oModule, "s" + sBoard + "KillsAccount" +  IntToString(x), sAccountTemp);
               // SetCampaignInt("DSOStats", "n" + sBoard + "Kills" + IntToString(x), nTemp);
                SetPersistentInt(oModule, "n" + sBoard + "Kills" + IntToString(x), nTemp,0,"ar_dsostats");

                //SetCampaignString("DSOStats", "s" + sBoard + "Kills" + IntToString(x), sTemp);
                SetPersistentString(oModule,"s" + sBoard + "Kills" + IntToString(x), sTemp,0,"ar_dsostats");
                //SetCampaignString("DSOStats", "s" + sBoard + "KillsAccount" + IntToString(x), sAccountTemp);
                SetPersistentString(oModule,"s" + sBoard + "KillsAccount" + IntToString(x), sAccountTemp,0,"ar_dsostats");

                nTemp = nTemp2;
                sTemp = sTemp2;
                sAccountTemp = sAccountTemp2;
            }
        }
        else
        {
            if (nTemp >= GetLocalInt(oModule, "n" + sBoard + "Kills" + IntToString(x)))
            {
                nTemp2 = GetLocalInt(oModule, "n" + sBoard + "Kills" + IntToString(x));
                sTemp2 = GetLocalString(oModule, "s" + sBoard + "Kills" + IntToString(x));
                sAccountTemp2 = GetLocalString(oModule, "s" + sBoard + "KillsAccount" + IntToString(x));

                SetLocalInt(oModule, "n" + sBoard + "Kills" + IntToString(x), nTemp);
                SetLocalString(oModule, "s" + sBoard + "Kills" + IntToString(x), sTemp);
                SetLocalString(oModule, "s" + sBoard + "KillsAccount" +  IntToString(x), sAccountTemp);
               // SetCampaignInt("DSOStats", "n" + sBoard + "Kills" + IntToString(x), nTemp);
                SetPersistentInt(oModule, "n" + sBoard + "Kills" + IntToString(x), nTemp,0,"ar_dsostats");

                //SetCampaignString("DSOStats", "s" + sBoard + "Kills" + IntToString(x), sTemp);
                SetPersistentString(oModule,"s" + sBoard + "Kills" + IntToString(x), sTemp,0,"ar_dsostats");
                //SetCampaignString("DSOStats", "s" + sBoard + "KillsAccount" + IntToString(x), sAccountTemp);
                SetPersistentString(oModule,"s" + sBoard + "KillsAccount" + IntToString(x), sAccountTemp,0,"ar_dsostats");

                nTemp = nTemp2;
                sTemp = sTemp2;
                sAccountTemp = sAccountTemp2;
            }
        }
    }
}

void ClearAllFactionMembers(object oPlayer)
{
    // * make friendly to Each of the 3 common factions
    AssignCommand(oPlayer, ClearAllActions());
    // * Note: waiting for Sophia to make SetStandardFactionReptuation to clear all personal reputation
    if (GetStandardFactionReputation(STANDARD_FACTION_COMMONER, oPlayer) <= 10)
    {
        SetLocalInt(oPlayer, "NW_G_Playerhasbeenbad", 10); // * Player bad
        SetStandardFactionReputation(STANDARD_FACTION_COMMONER, 50, oPlayer);
    }
    if (GetStandardFactionReputation(STANDARD_FACTION_MERCHANT, oPlayer) <= 10)
    {
        SetLocalInt(oPlayer, "NW_G_Playerhasbeenbad", 10); // * Player bad
        SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, 50, oPlayer);
    }
    if (GetStandardFactionReputation(STANDARD_FACTION_DEFENDER, oPlayer) <= 10)
    {
        SetLocalInt(oPlayer, "NW_G_Playerhasbeenbad", 10); // * Player bad
        SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, 50, oPlayer);
    }
}              */

