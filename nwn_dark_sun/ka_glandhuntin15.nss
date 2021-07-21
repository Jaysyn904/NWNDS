int StartingConditional()
{
object oPC = GetPCSpeaker();

if (GetLocalInt(oPC, "glandhunt") != 15) return FALSE;

return TRUE;
}

