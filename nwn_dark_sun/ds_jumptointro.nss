void main()
{
    object oPlayer = GetEnteringObject();
    if (GetIsPC(oPlayer))
    {
        if (GetHitDice(oPlayer) ==3)
        {
            if (!GetIsDM(oPlayer))
            {
             AssignCommand(oPlayer, ActionJumpToObject(GetWaypointByTag("cut01way_enter")));
            }
        }
    }
}
