int StartingConditional()
{
if (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "VeiledAllianceAmulet")))
    return TRUE;
    return FALSE;
}
