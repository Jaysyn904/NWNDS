//::///////////////////////////////////////////////
//:: FileName ds_take10kxp
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 3/3/2004 10:21:48 PM
//:://////////////////////////////////////////////
void main()
{

    // Remove some xp from the player
        object oPC = GetPCSpeaker();
        int nLevel = GetHitDice(oPC); //Get level
        int nXP = GetXP(oPC); //Save XP so we can restore it afterwards
        int nDelevelXP = (nLevel-1) * (nLevel - 2) * 500; //Work out how much XP will delevel the PC
        SetXP(oPC, nDelevelXP);
}
