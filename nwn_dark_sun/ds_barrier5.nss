void main()
{
object oPC = GetEnteringObject();
object oItemToTake;
oItemToTake = GetItemPossessedBy(oPC, "clockworkamul002");
if (GetIsObjectValid(oItemToTake))
{
FloatingTextStringOnCreature("The Clockwork Amulet glows softly.", oPC, FALSE);
AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetObjectByTag("WPAmuletRoom3"))));
}
}
