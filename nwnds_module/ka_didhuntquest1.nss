int StartingConditional()
{
object oPC = GetPCSpeaker();

int nInt;
nInt=GetLocalInt(oPC, "NW_JOURNAL_ENTRYhuntandgather1");

if (nInt < 2)
   return FALSE;

return TRUE;
}

