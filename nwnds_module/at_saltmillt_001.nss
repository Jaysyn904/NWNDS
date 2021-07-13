//::///////////////////////////////////////////////
//:: Name: AT_SaltMill_001
//:: Copyright (c) 2012 Athas Reborn
//:://////////////////////////////////////////////
/*
    Detects if the PC has an Elven Rapier in
    their inventory.
*/
//:://////////////////////////////////////////////
//:: Created By: DM Heatstroke
//:: Created On: June 18 2012
//:://////////////////////////////////////////////

void main()
{
    object oClicker = GetClickingObject();
    object oTarget = GetTransitionTarget(OBJECT_SELF);
    location lLoc = GetLocation(oTarget);

    object oRapier = GetItemPossessedBy(oClicker,"AR_WSWRP_ELVEN");

    if(GetIsObjectValid(oRapier) != 0)
        {
            SetLocalInt(oClicker,"thievesquests",4);
            SetLocalInt(oClicker,"pickpocket",1);
            AddJournalQuestEntry ("thievesquests", 6, oClicker);
        }

    AssignCommand(oClicker,JumpToLocation(lLoc));

}
