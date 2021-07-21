void main()
{
TakeGoldFromCreature(250, GetPCSpeaker(), TRUE);
AssignCommand(GetPCSpeaker(),ActionJumpToLocation(GetLocation(GetObjectByTag("WP_CrimsonEnter"))));
}

