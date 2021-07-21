void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);
  location lLoc = GetLocation(oTarget);

if(GetLocalInt(oClicker,"pickpocket") == 2)
    AssignCommand(oClicker,ActionJumpToLocation(GetLocation(GetObjectByTag("DST_Geary02"))));

  AssignCommand(oClicker,JumpToLocation(lLoc));
}


//  (GetLocation(GetObjectByTag("WP_CWTOFIELDS")))
  //       SetLocalInt(GetPCSpeaker(), "pickpocket",1);
