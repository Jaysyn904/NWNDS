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

    // Restrict based on the player's class
    if(GetLevelByClass(CLASS_TYPE_SORCERER, GetPCSpeaker()) >= 1)
        return FALSE;
    if(GetLevelByClass(CLASS_TYPE_BLACKGUARD, GetPCSpeaker()) >= 1)
        return FALSE;

    // Make sure the player has the required feats
    if(GetHasFeat(FEAT_TEMPLAR_DOMAIN_POWER, GetPCSpeaker()))
        return FALSE;

    // Restrict based on the player's alignment
    if(GetAlignmentGoodEvil(GetPCSpeaker()) == ALIGNMENT_EVIL)
        return FALSE;

    return TRUE;
}
