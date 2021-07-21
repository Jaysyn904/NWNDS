int StartingConditional()
{
object oPC = GetPCSpeaker();

if (GetItemPossessedBy(oPC, "coourik") == OBJECT_INVALID) return FALSE;

return TRUE;
}
