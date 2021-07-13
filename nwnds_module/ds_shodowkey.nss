void main()
{
object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

object oItemToTake;
oItemToTake = GetItemPossessedBy(oPC, "ShadowKey");
if(GetIsObjectValid(oItemToTake) != 0) {
FloatingTextStringOnCreature("The Key glows softly.", oPC, FALSE);
AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetObjectByTag("WP_Shadow"))));
}
}
