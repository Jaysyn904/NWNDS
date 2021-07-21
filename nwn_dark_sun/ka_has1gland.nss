int StartingConditional()
{
object oPC = GetPCSpeaker();

if (GetItemPossessedBy(oPC, "Gland1") == OBJECT_INVALID) return FALSE;

return TRUE;
}

