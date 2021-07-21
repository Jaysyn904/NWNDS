int StartingConditional()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    if(GetLocalInt(oPC, "DELIVERY_TASK_FLAG") == 1 || GetLocalInt(oPC, "KILL_TASK_FLAG") == 1)
        return TRUE;

    return FALSE;
}
