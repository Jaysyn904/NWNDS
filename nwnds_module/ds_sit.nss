void main()
{
    object oPlayer = GetLastUsedBy();
    object oChair = OBJECT_SELF;
    AssignCommand(oPlayer, ActionSit(oChair));
}
