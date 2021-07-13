int StartingConditional()
{
object oPC = GetPCSpeaker();

int nInt;
nInt=GetLocalInt(oPC, "NW_JOURNAL_ENTRYThePrelude");

if (!(nInt >= 3))
   return FALSE;

return TRUE;
}
