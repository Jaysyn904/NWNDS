int StartingConditional()
{
object oPC = GetPCSpeaker();

int nInt;
nInt=GetLocalInt(oPC, "NW_JOURNAL_ENTRYThePrelude");

if (!(nInt == 2))
   return FALSE;

if (GetItemPossessedBy(oPC, "QST_METEORITEORE") == OBJECT_INVALID) return FALSE;

return TRUE;
}

