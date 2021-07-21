//::///////////////////////////////////////////////
//:: NWN Dark Sun Mount Include file
//:: nwnds_mount_inc
//:: Copyright (c) 2021 NWN Dark SUn
//:://////////////////////////////////////////////
/*
    Handles various mount functions.
*/
//:://////////////////////////////////////////////
//:: Created By: Jaysyn
//:: Created On: July 17, 2021
//:://////////////////////////////////////////////

#include "prc_racial_const"

void SetMountVars(object oPC)
{
    if (GetRacialType(oPC) == RACIAL_TYPE_DS_DWARF) 
        {
            SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2044);
            SendMessageToPC(oPC,"Setting Custom Mount Variables"); 
        }

    if (GetRacialType(oPC) == RACIAL_TYPE_DS_ELF)
        {
            SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2045);
            SendMessageToPC(oPC,"Setting Custom Mount Variables");      
        }

    if (GetRacialType(oPC) == RACIAL_TYPE_MUL)
        {
            SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2049);
            SendMessageToPC(oPC,"Setting Custom Mount Variables");
        }

    if (GetRacialType(oPC) == RACIAL_TYPE_DS_HALFLING) { DelayCommand(1.0, SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2047)); }
    if (GetRacialType(oPC) == RACIAL_TYPE_DS_HALFELF) { DelayCommand(1.0, SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2048)); }
    if (GetRacialType(oPC) == RACIAL_TYPE_DS_HALFGIANT) { DelayCommand(1.0, SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2040)); }
    if (GetRacialType(oPC) == RACIAL_TYPE_VILLICHI) { DelayCommand(1.0, SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2046)); }
    if (GetRacialType(oPC) == RACIAL_TYPE_DS_HALFELF) { DelayCommand(1.0, SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2048)); }
    if (GetRacialType(oPC) == RACIAL_TYPE_MAGMA_GEN) { DelayCommand(1.0, SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2048)); }
    if (GetRacialType(oPC) == RACIAL_TYPE_RAIN_GEN) { DelayCommand(1.0, SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2044)); }
    if (GetRacialType(oPC) == RACIAL_TYPE_SILT_GEN) { DelayCommand(1.0, SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2046)); }
    if (GetRacialType(oPC) == RACIAL_TYPE_SUN_GEN) { DelayCommand(1.0, SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2046)); }
    if (GetRacialType(oPC) == RACIAL_TYPE_PTERRAN) { DelayCommand(1.0, SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2050)); }
    if (GetRacialType(oPC) == RACIAL_TYPE_TAREK) { DelayCommand(1.0, SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2053)); }
    if (GetRacialType(oPC) == RACIAL_TYPE_AARAKOCRA) { DelayCommand(1.0, SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2052)); }
    if (GetRacialType(oPC) == RACIAL_TYPE_AIR_GEN) { DelayCommand(1.0, SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2046)); }
    if (GetRacialType(oPC) == RACIAL_TYPE_EARTH_GEN) { DelayCommand(1.0, SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2046)); }
    if (GetRacialType(oPC) == RACIAL_TYPE_FIRE_GEN) { DelayCommand(1.0, SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2046)); }
    if (GetRacialType(oPC) == RACIAL_TYPE_WATER_GEN) { DelayCommand(1.0, SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2046)); }
    if (GetRacialType(oPC) == RACIAL_TYPE_PURE_YUAN) { DelayCommand(1.0, SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2051)); }
    if (GetRacialType(oPC) == RACIAL_TYPE_ILLITHID) { DelayCommand(1.0, SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2042)); }
    if (GetRacialType(oPC) == RACIAL_TYPE_GITHYANKI) { DelayCommand(1.0, SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2043)); }
    if (GetRacialType(oPC) == RACIAL_TYPE_GITHZERAI) { DelayCommand(1.0, SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 6)); }
    if (GetRacialType(oPC) == RACIAL_TYPE_GITH) { DelayCommand(1.0, SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2041)); }
    if (GetRacialType(oPC) == RACIAL_TYPE_BELGOI) { DelayCommand(1.0, SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2046)); }
    if (GetRacialType(oPC) == RACIAL_TYPE_HUMAN) { DelayCommand(1.0, SetLocalInt(oPC, "X3_CUSTOM_RACE_APPEARANCE", 2046)); }
}

//void main (){}