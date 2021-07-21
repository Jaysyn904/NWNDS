int StartingConditional()
{
object oPC = GetPCSpeaker();

if (GetItemPossessedBy(oPC, "QST_ASHENDRBLOOD") == OBJECT_INVALID) return FALSE;

return TRUE;
}

