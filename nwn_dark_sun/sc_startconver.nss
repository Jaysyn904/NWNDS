void main()
{
object oUser = GetLastUsedBy();
AssignCommand(OBJECT_SELF, ActionStartConversation(oUser));
}
