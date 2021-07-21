//::///////////////////////////////////////////////
//:: FileName ka_aligntest
//:://////////////////////////////////////////////
 #include "fincludes"
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/3/2005 9:39:28 AM
//:://////////////////////////////////////////////

int StartingConditional()
{
object oPC = GetPCSpeaker();

if ((GetLevelByClass(CLASS_TYPE_SORCERER, oPC)!=0)||
    (GetLevelByClass(CLASS_TYPE_BLACKGUARD, oPC)!=0))
return FALSE;

if (GetHasFeat(FEAT_TEMPLAR_DOMAIN_POWER, oPC)) return FALSE;

if (GetAlignmentGoodEvil(oPC) != ALIGNMENT_EVIL) return FALSE;

return TRUE;
}

