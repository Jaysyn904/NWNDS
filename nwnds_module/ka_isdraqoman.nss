//::///////////////////////////////////////////////
//:: FileName ka_isdraqoman.nss
/*
    
    Detects is the PC is a Draqoman by class & the 
    presence of a Draqoman Amulet.
    
*/    
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Kiriani Agriviar
//:: Created On: 
//:://////////////////////////////////////////////

int StartingConditional()
{
object oPC = GetPCSpeaker();

if ((GetLevelByClass(CLASS_TYPE_BARD, oPC)==0)&&
    (GetLevelByClass(CLASS_TYPE_ASSASSIN, oPC)==0))
return FALSE;

if (GetAlignmentGoodEvil(oPC) == ALIGNMENT_GOOD) return FALSE;

if (GetItemPossessedBy(oPC, "fac_itpnck_draqo") == OBJECT_INVALID) return FALSE;

return TRUE;
}