int StartingConditional()
{
object oPC = GetPCSpeaker();

int nInt;
nInt=GetLocalInt(oPC, "NW_JOURNAL_ENTRYThePrelude");

if (!(nInt == 3))
   return FALSE;

if (GetItemPossessedBy(oPC, "QST_ASHENDRBLOOD") == OBJECT_INVALID) return FALSE;

return TRUE;
}

