//::///////////////////////////////////////////////
//:: Name re_or.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
This script is intended to be executed by
"re_onrest".  It should not be executed alone
*/
//:://////////////////////////////////////////////
//:: Created By: Ray Miller
//:: Created On: 1-6-03
//:://////////////////////////////////////////////
#include "re_rndenc"
void main()
{
object oPC = OBJECT_SELF;
if(GetLocalInt(oPC, "re_resting"))
    {
    object oArea = GetArea(oPC);
    int iMinDistance = 1;
    int iMaxDistance = 5;
    struct RndEncProperties strProps = GetRndEncProperties(oArea);
    if(!strProps.bInitialized) strProps = GetRndEncProperties(GetModule());
    if(!strProps.bInitialized)
        {
        SetRndEncProperties(GetModule());
        strProps = GetRndEncProperties(GetModule());
        }
    //If a friendly creature is awake and within 20 meters, then increase
    //the distance at which the encounter can spawn.
    int iCounter1 = 1;
    object oPlayer = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, iCounter1);
    while(GetIsObjectValid(oPlayer) && GetDistanceToObject(oPlayer) <= 20.0)
        {
        iCounter1++;
        if(GetIsFriend(oPlayer, oPC))
            {
            iMinDistance = 6;
            iMaxDistance = 12;
            }
        oPlayer = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, iCounter1);
        }
    //The purpose of the following local int is to cause the spawns
    //to be facing the PC who generated the encounter.
    SetLocalInt(oPC, "re_Facing", TRUE);

    object oEncounter = RandomEncounter(IntToFloat(strProps.iChanceOnRest), oPC, strProps.sCreatureTable, 0, 0, iMinDistance, iMaxDistance, 360, 0, 0, 0, strProps.iDifficulty);
    /*if(GetIsObjectValid(oEncounter))
        {
        //DeleteLocalInt(oPC, "re_resting");
        effect eEffect = GetFirstEffect(oPC);
        while(GetIsEffectValid(eEffect))
            {
            if(GetEffectType(eEffect) == EFFECT_TYPE_BLINDNESS && GetEffectCreator(eEffect) == GetModule()) RemoveEffect(oPC, eEffect);
            eEffect = GetNextEffect(oPC);
            }
        }*/
    }
}
