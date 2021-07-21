void main()
{
  object oClicker = GetClickingObject();

  if (!GetIsPC(oClicker))
      DestroyObject(oClicker);

  object oTarget = GetTransitionTarget(OBJECT_SELF);
  location lLoc = GetLocation(oTarget);



  AssignCommand(oClicker,JumpToLocation(lLoc));
}
