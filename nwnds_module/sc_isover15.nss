//::///////////////////////////////////////////////
//:: FileName sc_isover15
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/25/02 8:21:03 PM
//:://////////////////////////////////////////////
int StartingConditional()
{
object oPC = GetPCSpeaker();
object oItemToTake = GetItemPossessedBy(oPC, "RedFactionHelm");

    // Add the randomness
    if((GetHitDice(oPC) <= 9) || (GetIsObjectValid(oItemToTake) != 0))
        return FALSE;
    if (GetLocalInt(GetPCSpeaker(),"nDidROB"))
        return FALSE;
    return TRUE;
}
