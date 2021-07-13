// Check for Nadie's Earth Relic

int StartingConditional()
{
object oPC = GetPCSpeaker();

if (GetItemPossessedBy(oPC, "QST_EARTHRELIC") == OBJECT_INVALID) return FALSE;

return TRUE;
}
