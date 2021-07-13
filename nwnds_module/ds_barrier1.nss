void main()
{
object oPC = GetEnteringObject();
object oItemToTake;
oItemToTake = GetItemPossessedBy(oPC, "clockworkamulet");
if (GetIsObjectValid(oItemToTake))
{
FloatingTextStringOnCreature("The Clockwork Amulet glows softly.", oPC, FALSE);
AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_Barrier1"))));
}
}
