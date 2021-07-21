int StartingConditional()
{
object oPC = GetPCSpeaker();

int nInt;
nInt=GetLocalInt(oPC, "NW_JOURNAL_ENTRYThePrelude");

if (!(nInt == 5))
   return FALSE;

if (GetItemPossessedBy(oPC, "QST_LG_SAPPHIRE") == OBJECT_INVALID) return FALSE;

return TRUE;
}

