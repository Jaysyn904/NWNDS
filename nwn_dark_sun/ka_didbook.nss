int StartingConditional()
{
object oPC = GetPCSpeaker();

int nInt;
nInt=GetLocalInt(oPC, "NW_JOURNAL_ENTRYSageAdvice");

if (!(nInt >= 1))
   return FALSE;

return TRUE;
}

