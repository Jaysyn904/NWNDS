int StartingConditional()
{
object oPC = GetPCSpeaker();
object oHelm = GetItemInSlot(INVENTORY_SLOT_HEAD, oPC);
if (GetSubString(GetTag(oHelm),1,4) == "helm")
return FALSE;
return TRUE;
}
