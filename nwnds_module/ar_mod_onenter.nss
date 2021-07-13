//::///////////////////////////////////////////////
//:: Default On Enter for Module
//:: x3_mod_def_enter
//:: Copyright (c) 2008 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script adds the horse menus to the PCs.
*/
//:://////////////////////////////////////////////
//:: Created By: Deva B. Winblood
//:: Created On: Dec 30th, 2007
//:: Last Update: April 21th, 2008
//:://////////////////////////////////////////////

#include "x3_inc_horse"
//#include "wow_polyinclude"
#include "dante_db"
// Wanye begin
#include "ar_inc_wow"
//#include "wow_inc_scouting"
// Wayne end
//#include "ar_db_main"
#include "dmfi_init_inc"
#include "ar_inc_pcspawn"

void ARCleanVars(object oPC);
void ApplyExitPenalty(object oPlayer);
int  DetermineDeath(object oPlayer);
void DetermineExitPenalty(object oPlayer, string sPlayerName);
void GreetArenaChampion(string sPlayerName);
void MessageOfTheDay(object oPlayer, string sPlayerName);
//void SetStats(object oPlayer);
void StripNewChars(object oPlayer);
void GivePCWands(object oPlayer);

//void ArenaKillsUpdate();


/*void ArenaKillsUpdate()
{
    string sFetchString = "SELECT * FROM ar_dsostats WHERE name LIKE'Arena%' ORDER BY val desc";
    SQLExecDirect(sFetchString);
    object oModule = GetModule();
    string sName;
    int x;

    for (x = 1; x <= 10; x++)
    {
        SQLFetch();
        sName = SQLGetData(2);
        object oPC = GetFirstPC();
        DelayCommand(10.0, SendMessageToPC(oPC, sName));
        SetLocalString(oModule, "sArenaKills" + IntToString(x), sName);
    }
}*/

void main()
{
    //Populates the arena board
    //ArenaKillsUpdate();

    object oPC = GetEnteringObject();
    // ARSX_OnClientEnter(oPC); //- Waiting on Nitecap  -DMH
    // Begin BESIE Spawn System
    int bBESIEWidget;
    if(GetIsDM(oPC))
        {
            SetLocalInt(GetModule(), "re_" + GetPCPlayerName(oPC), TRUE);
            object oItem = GetFirstItemInInventory(oPC);
            while(GetIsObjectValid(oItem))
                {
                    if(GetTag(oItem) == "BESIEWidget") bBESIEWidget = TRUE;
                    oItem = GetNextItemInInventory(oPC);
                }
            if(!bBESIEWidget) CreateItemOnObject("besiewidget", oPC);
        }
    else DeleteLocalInt(GetModule(), "re_" + GetName(oPC));
    // End BESIE Spawn System
/*    ExecuteScript("x3_mod_pre_enter",OBJECT_SELF); // Override for other skin systems
    if ((GetIsPC(oPC)||GetIsDM(oPC))&&!GetHasFeat(FEAT_HORSE_MENU,oPC))
    { // add horse menu
        HorseAddHorseMenu(oPC);
        if (GetLocalInt(GetModule(),"X3_ENABLE_MOUNT_DB"))
        { // restore PC horse status from database
            DelayCommand(2.0,HorseReloadFromDatabase(oPC,X3_HORSE_DATABASE));
        } // restore PC horse status from database
    } // add horse menu
    if (GetIsPC(oPC))
    { // more details
        // restore appearance in case you export your character in mounted form, etc.
        if (!GetSkinInt(oPC,"bX3_IS_MOUNTED")) HorseIfNotDefaultAppearanceChange(oPC);
        // pre-cache horse animations for player as attaching a tail to the model
        HorsePreloadAnimations(oPC);
        DelayCommand(3.0,HorseRestoreHenchmenLocations(oPC));
    } // more details     */


    if (GetIsPC(oPC))
    {
        string sPlayerName = GetName(oPC);
        MessageOfTheDay(oPC, sPlayerName);

        if (!GetIsDM(oPC))
        {
            //SetStats(oPC);
            //NC:EDIT
            ARCleanVars(oPC);
            ScanItems(oPC,TRUE);
            if (GetXP(oPC) == 0)
            {
            StripNewChars(oPC);
            }
            else
            {
                GreetArenaChampion(sPlayerName);
                //Kinda hard to read - Determine whether the player is marked
                //for death; if true don't check for the exit penalty
                if (!DetermineDeath(oPC))
                    DetermineExitPenalty(oPC, sPlayerName);
                SetLocalInt(oPC, "nEnter", TRUE);
            }

            AdjustReputation(oPC, GetObjectByTag("kank"), 50);
			//AdjustReputation(oPC, GetObjectByTag("ds_kank001"), 50);

        }
}

// Give language tokens.
if (!GetIsDM(oPC))
{
    if( GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 2 )
        {
            if ( GetItemPossessedBy(oPC, "hlslang_108") == OBJECT_INVALID )  // Druidic
            {
                DelayCommand(1.0, FloatingTextStringOnCreature("Druidic language token acquired.", oPC));
                CreateItemOnObject("hlslang_108", oPC);
            }
        }
    if( GetLevelByClass(CLASS_TYPE_ROGUE, oPC) >= 2 )
        {
            if ( GetItemPossessedBy(oPC, "hlslang_9") == OBJECT_INVALID )  // Thieve's Cant
            {
                DelayCommand(1.0, FloatingTextStringOnCreature("Thieve's Cant token acquired.", oPC));
                CreateItemOnObject("hlslang_9", oPC);
            }
        }
    if( GetRacialType(oPC) == RACIAL_TYPE_TARI )
        {
            DelayCommand(0.5, AdjustReputation(oPC, GetObjectByTag("FACTION_ATHAS_TARI"), 90)); // Adjust faction reputation

            if ( GetItemPossessedBy(oPC, "hlslang_2") == OBJECT_INVALID )
            {
                DelayCommand(1.0, FloatingTextStringOnCreature("Tari language token acquired.", oPC));
                CreateItemOnObject("hlslang_2", oPC);
            }
        }
    if( GetRacialType(oPC) == RACIAL_TYPE_AARAKOCRA )
        {
            if ( GetItemPossessedBy(oPC, "hlslang_106") == OBJECT_INVALID )
            {
                DelayCommand(1.0, FloatingTextStringOnCreature("Aarakocran language token acquired.", oPC));
                CreateItemOnObject("hlslang_106", oPC);
            }
        }
    if( GetRacialType(oPC) == RACIAL_TYPE_DS_ELF )
        {
            DelayCommand(0.5, AdjustReputation(oPC, GetObjectByTag("FACTION_ATHAS_SILVERHAND"), 90)); // Adjust faction reputation

            if ( GetItemPossessedBy(oPC, "hlslang_1") == OBJECT_INVALID )
            {
                DelayCommand(1.0, FloatingTextStringOnCreature("Elven language token acquired.", oPC));
                CreateItemOnObject("hlslang_1", oPC);
            }
        }
    if( GetRacialType(oPC) == RACIAL_TYPE_DS_HALFELF )
        {
            if ( GetItemPossessedBy(oPC, "hlslang_1") == OBJECT_INVALID )
            {
                DelayCommand(1.0, FloatingTextStringOnCreature("Elven language token acquired.", oPC));
                CreateItemOnObject("hlslang_1", oPC);
            }
        }
    if( GetRacialType(oPC) == RACIAL_TYPE_DS_DWARF )
        {
            DelayCommand(0.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_KLED"), 90)); // Adjust faction reputation

            if ( GetItemPossessedBy(oPC, "hlslang_4") == OBJECT_INVALID )
            {
                DelayCommand(1.0, FloatingTextStringOnCreature("Dwarven language token acquired.", oPC));
                CreateItemOnObject("hlslang_4", oPC);
            }
        }
    if( GetRacialType(oPC) == RACIAL_TYPE_DS_HALFLING )
        {
            if ( GetItemPossessedBy(oPC, "hlslang_3") == OBJECT_INVALID )
            {
                DelayCommand(1.0, FloatingTextStringOnCreature("Halfling language token acquired.", oPC));
                CreateItemOnObject("hlslang_3", oPC);
            }
        }
    if( GetRacialType(oPC) == RACIAL_TYPE_GITH )
        {
            SendMessageToPC(GetFirstPC(), "Gith Found");
            DelayCommand(3.5, FloatingTextStringOnCreature("Setting Faction: Gith", oPC));
            DelayCommand(4.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_ANVILCRACKER"), -100));
            DelayCommand(4.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_BELGOI"), -100));
            DelayCommand(5.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_CRIMSON"), -100));
            DelayCommand(6.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_DEFENDER"), -100));
            DelayCommand(6.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_DRAQOMAN"), -100));
            DelayCommand(7.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_GITH"), 90));
            DelayCommand(7.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_ILLITHID"), -100));
            DelayCommand(8.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_IRONCLAW"), -100));
            DelayCommand(8.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_KLED"), -100));
            DelayCommand(9.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_LOWLIFE"), -100));
            DelayCommand(9.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_MINDLESS"), -100));
            DelayCommand(10.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_PIRATE"), -100));
            DelayCommand(10.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_RAIDER"), -100));
            DelayCommand(11.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_SILVERHAND"), -100));
            DelayCommand(11.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_TARI"), -100));
            DelayCommand(12.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_THRAX"), -100));
            DelayCommand(12.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_TYR"), -100));
            DelayCommand(13.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_UNDEAD"), -100));
            DelayCommand(13.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_URIK"), -100));
            DelayCommand(14.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_VEILEDALLIANCE"), -100));
            DelayCommand(14.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_YUANTI"), -100));

            DelayCommand(15.0, SetLocalInt(oPC, "IsGith", 1));
            DelayCommand(15.5, FloatingTextStringOnCreature("Finished Setting Faction Reputation.", oPC));

            if ( GetItemPossessedBy(oPC, "hlslang_13") == OBJECT_INVALID )
            {
                DelayCommand(1.0, FloatingTextStringOnCreature("Gith language token acquired.", oPC));
                CreateItemOnObject("hlslang_13", oPC);
            }
        }
    if( GetRacialType(oPC) == RACIAL_TYPE_AIR_GEN ) // Air Genasi
        {
            SetColor ( oPC, COLOR_CHANNEL_SKIN, 020);

            if ( GetItemPossessedBy(oPC, "hlslang_101") == OBJECT_INVALID )
            {
                DelayCommand(1.0, FloatingTextStringOnCreature("Auran language token acquired.", oPC));
                CreateItemOnObject("hlslang_101", oPC);
            }
        }
    if( GetRacialType(oPC) == RACIAL_TYPE_EARTH_GEN ) //  Earth Genasi
        {
            SetColor ( oPC, COLOR_CHANNEL_SKIN, 118);

            if ( GetItemPossessedBy(oPC, "hlslang_102") == OBJECT_INVALID )
            {
                DelayCommand(1.0, FloatingTextStringOnCreature("Terran language token acquired.", oPC));
                CreateItemOnObject("hlslang_102", oPC);
            }
        }
    if( GetRacialType(oPC) == RACIAL_TYPE_FIRE_GEN ) //  Fire Genasi
        {
            SetColor ( oPC, COLOR_CHANNEL_SKIN, 103);

            if ( GetItemPossessedBy(oPC, "hlslang_104") == OBJECT_INVALID )
            {
                DelayCommand(1.0, FloatingTextStringOnCreature("Ignan language token acquired.", oPC));
                CreateItemOnObject("hlslang_104", oPC);
            }
        }
     if( GetRacialType(oPC) == RACIAL_TYPE_WATER_GEN ) //  Water Genasi
        {
            SetColor ( oPC, COLOR_CHANNEL_SKIN, 141);

            if ( GetItemPossessedBy(oPC, "hlslang_103") == OBJECT_INVALID )
            {
                DelayCommand(1.0, FloatingTextStringOnCreature("Aquan language token acquired.", oPC));
                CreateItemOnObject("hlslang_103", oPC);
            }
        }
    if( GetRacialType(oPC) == RACIAL_TYPE_PTERRAN ) // Pterran
        {
            if ( GetItemPossessedBy(oPC, "hlslang_105") == OBJECT_INVALID )
            {
                DelayCommand(1.0, FloatingTextStringOnCreature("Pterran language token acquired.", oPC));
                CreateItemOnObject("hlslang_105", oPC);
            }
        }
    if( GetRacialType(oPC) == RACIAL_TYPE_ILLITHID ) //  Illithid
        {
            if ( GetItemPossessedBy(oPC, "hlslang_11") == OBJECT_INVALID )
                {
                    DelayCommand(1.0, FloatingTextStringOnCreature("Illithid language token acquired.", oPC));
                    CreateItemOnObject("hlslang_11", oPC);
                }

            SendMessageToPC(GetFirstPC(), "Illithid Found");
            DelayCommand(3.5, FloatingTextStringOnCreature("Setting Faction: Illithid", oPC));
            DelayCommand(4.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_ANVILCRACKER"), -100));
            DelayCommand(4.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_BELGOI"), -100));
            DelayCommand(5.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_CRIMSON"), -100));
            DelayCommand(6.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_DEFENDER"), -100));
            DelayCommand(6.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_DRAQOMAN"), -100));
            DelayCommand(7.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_GITH"), -100));
            DelayCommand(7.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_ILLITHID"), 90));
            DelayCommand(8.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_IRONCLAW"), -100));
            DelayCommand(8.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_KLED"), -100));
            DelayCommand(9.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_LOWLIFE"), -100));
            DelayCommand(9.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_MINDLESS"), -100));
            DelayCommand(10.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_PIRATE"), -100));
            DelayCommand(10.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_RAIDER"), -100));
            DelayCommand(11.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_SILVERHAND"), -100));
            DelayCommand(11.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_TARI"), -100));
            DelayCommand(12.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_THRAX"), -100));
            DelayCommand(12.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_TYR"), -100));
            DelayCommand(13.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_UNDEAD"), -100));
            DelayCommand(13.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_URIK"), -100));
            DelayCommand(14.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_VEILEDALLIANCE"), -100));
            DelayCommand(14.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_YUANTI"), -100));

            DelayCommand(15.0, SetLocalInt(oPC, "IsIllithid", 1));
            DelayCommand(15.5, FloatingTextStringOnCreature("Finished Setting Faction Reputation.", oPC));
        }
    if( GetRacialType(oPC) == RACIAL_TYPE_JERAL  ||
        GetRacialType(oPC) == RACIAL_TYPE_JHOL  ||
        GetRacialType(oPC) == RACIAL_TYPE_JEZ  ||
        GetRacialType(oPC) == RACIAL_TYPE_THRIKREEN  ||
        GetRacialType(oPC) == RACIAL_TYPE_TKEECH  ||
        GetRacialType(oPC) == RACIAL_TYPE_TOKSA  ||
        GetRacialType(oPC) == RACIAL_TYPE_TONDI )
        {
            if ( GetItemPossessedBy(oPC, "hlslang_7") == OBJECT_INVALID )
                {
                    DelayCommand(1.0, FloatingTextStringOnCreature("Kreen language token acquired.", oPC));
                    CreateItemOnObject("hlslang_7", oPC);
                }
        }
    if( GetRacialType(oPC) == RACIAL_TYPE_ABOM_YUAN ||  //  Yuan-Ti Abomination
        GetRacialType(oPC) == RACIAL_TYPE_PURE_YUAN )   //  Yuan-Ti Pureblood
        {

            if ( GetItemPossessedBy(oPC, "hlslang_5") == OBJECT_INVALID )
                {
                    DelayCommand(1.0, FloatingTextStringOnCreature("Yuan-Ti language token acquired.", oPC));
                    CreateItemOnObject("hlslang_5", oPC);
                }

            SendMessageToPC(GetFirstPC(), "Yuan-Ti Found");
            DelayCommand(3.5, FloatingTextStringOnCreature("Setting Faction: Yuan-Ti", oPC));
            DelayCommand(4.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_ANVILCRACKER"), -100));
            DelayCommand(4.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_BELGOI"), -100));
            DelayCommand(5.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_CRIMSON"), -100));
            DelayCommand(6.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_DEFENDER"), -100));
            DelayCommand(6.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_DRAQOMAN"), -100));
            DelayCommand(7.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_GITH"), -100));
            DelayCommand(7.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_ILLITHID"), -100));
            DelayCommand(8.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_IRONCLAW"), -100));
            DelayCommand(8.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_KLED"), -100));
            DelayCommand(9.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_LOWLIFE"), -100));
            DelayCommand(9.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_MINDLESS"), -100));
            DelayCommand(10.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_PIRATE"), -100));
            DelayCommand(10.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_RAIDER"), -100));
            DelayCommand(11.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_SILVERHAND"), -100));
            DelayCommand(11.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_TARI"), -100));
            DelayCommand(12.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_THRAX"), -100));
            DelayCommand(12.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_TYR"), -100));
            DelayCommand(13.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_UNDEAD"), -100));
            DelayCommand(13.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_URIK"), -100));
            DelayCommand(14.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_VEILEDALLIANCE"), -100));
            DelayCommand(14.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_YUANTI"), 90));

            DelayCommand(15.0, SetLocalInt(oPC, "IsYuanTi", 1));
            DelayCommand(15.5, FloatingTextStringOnCreature("Finished Setting Faction Reputation.", oPC));
        }
    if( GetRacialType(oPC) == RACIAL_TYPE_BELGOI )
        {
            if ( GetItemPossessedBy(oPC, "hlslang_110") == OBJECT_INVALID )
                {
                    DelayCommand(1.0, FloatingTextStringOnCreature("Belgoi language token acquired.", oPC));
                    CreateItemOnObject("hlslang_110", oPC);
                }

            SendMessageToPC(GetFirstPC(), "Belgoi Found");
            DelayCommand(3.5, FloatingTextStringOnCreature("Setting Faction: Belgoi", oPC));
            DelayCommand(4.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_ANVILCRACKER"), -100));
            DelayCommand(4.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_BELGOI"), 90));
            DelayCommand(5.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_CRIMSON"), -100));
            DelayCommand(6.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_DEFENDER"), -100));
            DelayCommand(6.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_DRAQOMAN"), -100));
            DelayCommand(7.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_GITH"), -100));
            DelayCommand(7.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_ILLITHID"), -100));
            DelayCommand(8.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_IRONCLAW"), -100));
            DelayCommand(8.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_KLED"), -100));
            DelayCommand(9.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_LOWLIFE"), -100));
            DelayCommand(9.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_MINDLESS"), -100));
            DelayCommand(10.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_PIRATE"), -100));
            DelayCommand(10.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_RAIDER"), -100));
            DelayCommand(11.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_SILVERHAND"), -100));
            DelayCommand(11.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_TARI"), -100));
            DelayCommand(12.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_THRAX"), -100));
            DelayCommand(12.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_TYR"), -100));
            DelayCommand(13.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_UNDEAD"), -100));
            DelayCommand(13.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_URIK"), -100));
            DelayCommand(14.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_VEILEDALLIANCE"), -100));
            DelayCommand(14.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_YUANTI"), -100));

            DelayCommand(15.0, SetLocalInt(oPC, "IsBelgoi", 1));
            DelayCommand(15.5, FloatingTextStringOnCreature("Finished Setting Faction Reputation.", oPC));
        }

    }

    // To be set later.  Need to figure out what feat Hamannu Domain is now
    /*if (!GetIsDM(oPC))
    {
        if (GetHasFeat(5024, oPC))
            {
            DelayCommand(4.0, FloatingTextStringOnCreature("Setting Faction: Urikite", oPC));
            DelayCommand(4.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_TYR"), -100));
            DelayCommand(5.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_VEILEDALLIANCE"), -100));
            DelayCommand(5.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_URIK"), 90));
            DelayCommand(6.0, SetLocalInt(oPC, "IsUrikite", 1));
            DelayCommand(6.5, FloatingTextStringOnCreature("Finished Setting Faction", oPC));
            }
        if (GetStringLowerCase(GetName(oPC)) == "tallik  the blade")
            {
            DelayCommand(4.0, FloatingTextStringOnCreature("Setting Faction: Urikite", oPC));
            DelayCommand(4.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_TYR"), -100));
            DelayCommand(5.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_VEILEDALLIANCE"), -100));
            DelayCommand(5.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_URIK"), 90));
            DelayCommand(6.0, SetLocalInt(oPC, "IsUrikite", 1));
            DelayCommand(6.5, FloatingTextStringOnCreature("Finished Setting Faction", oPC));
            }
        if (GetStringLowerCase(GetName(oPC)) == "evanti")
            {
            DelayCommand(4.0, FloatingTextStringOnCreature("Setting Faction: Urikite", oPC));
            DelayCommand(4.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_TYR"), -100));
            DelayCommand(5.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_VEILEDALLIANCE"), -100));
            DelayCommand(5.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_URIK"), 90));
            DelayCommand(6.0, SetLocalInt(oPC, "IsUrikite", 1));
            DelayCommand(6.5, FloatingTextStringOnCreature("Finished Setting Faction", oPC));
            }
        if (GetStringLowerCase(GetName(oPC)) == "actavia the aggressive")
            {
            DelayCommand(4.0, FloatingTextStringOnCreature("Setting Faction: Urikite", oPC));
            DelayCommand(4.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_TYR"), -100));
            DelayCommand(5.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_VEILEDALLIANCE"), -100));
            DelayCommand(5.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_URIK"), 90));
            DelayCommand(6.0, SetLocalInt(oPC, "IsUrikite", 1));
            DelayCommand(6.5, FloatingTextStringOnCreature("Finished Setting Faction", oPC));
            }
        if (GetStringLowerCase(GetName(oPC)) == "myrkhan")
            {
            DelayCommand(4.0, FloatingTextStringOnCreature("Setting Faction: Urikite", oPC));
            DelayCommand(4.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_TYR"), -100));
            DelayCommand(5.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_VEILEDALLIANCE"), -100));
            DelayCommand(5.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_URIK"), 90));
            DelayCommand(6.0, SetLocalInt(oPC, "IsUrikite", 1));
            DelayCommand(6.5, FloatingTextStringOnCreature("Finished Setting Faction", oPC));
            }
         if (GetStringLowerCase(GetName(oPC)) == "raphale")
            {
            DelayCommand(4.0, FloatingTextStringOnCreature("Setting Faction: Urikite", oPC));
            DelayCommand(4.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_TYR"), -100));
            DelayCommand(5.0, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_VEILEDALLIANCE"), -100));
            DelayCommand(5.5, AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_URIK"), 90));
            DelayCommand(6.0, SetLocalInt(oPC, "IsUrikite", 1));
            DelayCommand(6.5, FloatingTextStringOnCreature("Finished Setting Faction", oPC));
            }
    } */

    SetPlotFlag(oPC, FALSE);

    // initialize DMFI
    dmfiInitialize(oPC);
}

void ApplyExitPenalty(object oPC)
{
    int nXP = GetXP(oPC);
    int nPenalty = 10 * GetHitDice(oPC);
    int nHD = GetHitDice(oPC);
    // * You can not lose a level with this respawning
    int nMin = ((nHD * (nHD - 1)) / 2) * 1000;

    int nNewXP = nXP - nPenalty;
    if ((nNewXP < nMin))
       nNewXP = nMin;
    SetXP(oPC, nNewXP);
    int nGoldToTake =    FloatToInt(0.05 * GetGold(oPC));
    // * a cap of 1000gp taken from you
    if (nGoldToTake > 1000)
    {
        nGoldToTake = 1000;
    }
    AssignCommand(oPC, TakeGoldFromCreature(nGoldToTake, oPC, TRUE));

}

int DetermineDeath(object oPC)
{
    int bDead = FALSE;

    if (GetLocalInt(oPC, "bDeath"))
    {
        bDead = TRUE;
        SetLocalInt(oPC, "bDeath", FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(FALSE, FALSE), oPC, 0.0f);
    }

    return bDead;
}

void DetermineExitPenalty(object oPC, string sPlayerName)
{
    if (GetLocalInt(oPC, "bExitPenalty") == TRUE)
    {
        ApplyExitPenalty(oPC);
        string sRobbedText = sPlayerName + " has been beaten and robbed by bandits!  Next time log out while resting.";
        FloatingTextStringOnCreature(sRobbedText, oPC, FALSE);
    }
    else
        SetLocalInt(oPC, "bExitPenalty", TRUE);
}

void GreetArenaChampion(string sPlayerName)
{
    string sArenaChampion = GetLocalString(GetModule(), "sArenaKills1");

    if (sPlayerName == sArenaChampion)
    {
        object oPC = GetFirstPC();
        while(GetIsObjectValid(oPC))
        {
            string sMsg = "The champion of the arena has arrived in Tyr.  All hail " + sPlayerName + "!";
            SendMessageToPC(oPC, sMsg);
            oPC = GetNextPC();
        }
    }
}

void MessageOfTheDay(object oPC, string sPlayerName)
{
    string sWelcome = "<c�>Welcome to the NWN Dark Sun Demo Server!, </c><c�>";
    sWelcome += sPlayerName;
    sWelcome += "</c><c�>!</c>";
    SendMessageToPC(oPC, sWelcome);

    string sMessageOfTheDay = "<c�>MESSAGES OF THE DAY:</c><c�> New players should talk to the Guard Captain.</c>";
    sMessageOfTheDay += "\n<c��>Report all bugs to: </c><c�>NWN Dark Sun Discord</c><c��>.</c>";
    SendMessageToPC(oPC, sMessageOfTheDay);
}

/*void SetStats(object oPC)
{
    string sVarName = GetCampaignVariableName(oPC);
    SetLocalInt(oPC, "Arena", GetPersistentInt(oPC, "Arena" + sVarName, "ar_dsostats"));
    SetLocalInt(oPC, "Player", GetPersistentInt(oPC, "Player" + sVarName, "ar_dsostats"));
    SetLocalInt(oPC, "Bounty", GetPersistentInt(oPC, "Bounty" + sVarName, "ar_dsostats"));
}*/

void StripNewChars(object oPC)
{

    AssignCommand(oPC, TakeGoldFromCreature(GetGold(oPC), oPC, TRUE));
    // Function Below Removed for PRC compatibility -DMH

    /*object oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);
    if (GetIsObjectValid(oItem))
        DestroyObject(oItem); */

    object oItem = GetFirstItemInInventory(oPC);
    while (GetIsObjectValid(oItem))
    {
        DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
    }
    oItem = CreateItemOnObject("cloth024", oPC);
    AssignCommand(oPC, ActionEquipItem(oItem, INVENTORY_SLOT_CHEST));
    GivePCWands(oPC);
}

void GivePCWands(object oPC)
{
    //to change the wands change the resrefs
    //here
    string sWndPCFollow = "dmfi_pc_follow";//PC Autofollow Widget
    string sWndPCDice = "dmfi_pc_dicebag";//PC Dicebag
    string sWndPCEmote = "dmfi_pc_emote";//PC Emote Wand

    CreateItemOnObject(sWndPCFollow, oPC);
    CreateItemOnObject(sWndPCDice, oPC);
    CreateItemOnObject(sWndPCEmote, oPC);
}

void ARCleanVars(object oPC)
{
    ExecuteScript("ar_inc_clearvar", oPC);
}