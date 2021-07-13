int StartingConditional()
{
object oPC = GetPCSpeaker();

int nInt;
nInt=GetLocalInt(oPC, "NW_JOURNAL_ENTRYThePrelude");

if (!(nInt >= 1))
   return FALSE;

return TRUE;
}


