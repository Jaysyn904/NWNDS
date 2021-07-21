// the following script will allow the PC to sit in a chair
void main()
{
    object oPlayer = GetLastUsedBy();
    object oChair = OBJECT_SELF;
    if (GetIsPC(oPlayer))
    {
        if (GetIsObjectValid(oChair) && !GetIsObjectValid (GetSittingCreature(oChair)))
        {
            AssignCommand(oPlayer, ActionSit(oChair));
        }
    }
}
