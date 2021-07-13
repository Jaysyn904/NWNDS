int StartingConditional()
{
object oPC = GetPCSpeaker();

if (GetItemPossessedBy(oPC, "Metal_WPrelude") == OBJECT_INVALID) return FALSE;

if (!(GetHitDice(oPC) >=  30)) return FALSE;

return TRUE;
}
