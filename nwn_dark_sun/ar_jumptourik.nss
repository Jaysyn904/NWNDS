void main()
{
TakeGoldFromCreature(150, GetPCSpeaker(), TRUE);
AssignCommand(GetPCSpeaker(),ActionJumpToLocation(GetLocation(GetObjectByTag("WP_URIK"))));
}

