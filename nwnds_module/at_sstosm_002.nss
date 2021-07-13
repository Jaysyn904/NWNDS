void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);
  location lLoc = GetLocation(oTarget);


if(GetLocalInt(oClicker,"pickpocket") == 3)
   AssignCommand(oClicker,ActionJumpToLocation(GetLocation(GetObjectByTag("SaltMill2"))));

  AssignCommand(oClicker,JumpToLocation(lLoc));
}
