void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);
  location lLoc = GetLocation(oTarget);

  AssignCommand(oClicker,JumpToLocation(lLoc));

  GetLocalInt(oClicker, "goldamount");

  if(GetGold(oClicker) > GetLocalInt(oClicker, "goldamount"))
     SetLocalInt(oClicker,"thievesquests",3);
     AddJournalQuestEntry ("thievesquests", 4, oClicker);


}
