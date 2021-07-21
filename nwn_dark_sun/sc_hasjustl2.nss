int StartingConditional()
{
object oPC = GetPCSpeaker();

if (GetItemPossessedBy(oPC, "QST_ITNCK_JUSTL") == OBJECT_INVALID) return FALSE;

return TRUE;
}
