void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);
  location lLoc = GetLocation(oTarget);

  AssignCommand(oClicker,JumpToLocation(lLoc));

  object oBracelet = GetItemPossessedBy(oClicker,"QST_GEARYSBRACE");
  if(GetIsObjectValid(oBracelet) != 0)
     {
        SetLocalInt(oClicker,"thievesquests",2);
        SetLocalInt(oClicker,"pickpocket",1);
        AddJournalQuestEntry ("thievesquests", 2, oClicker);
     }
}
