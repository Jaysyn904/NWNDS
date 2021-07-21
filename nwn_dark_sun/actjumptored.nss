void main()
{
TakeGoldFromCreature(500, GetPCSpeaker(), TRUE);
AssignCommand(GetPCSpeaker(),ActionJumpToLocation(GetLocation(GetObjectByTag("WP_RedRiver"))));
}
