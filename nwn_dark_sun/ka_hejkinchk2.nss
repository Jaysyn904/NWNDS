/*   Script generated by
Lilac Soul's NWN Script Generator, v. 1.6

For download info, please visit:
http://www.lilacsoul.revility.com    */

int StartingConditional()
{
object oPC = GetPCSpeaker();

int nInt;
nInt=GetLocalInt(oPC, "NW_JOURNAL_ENTRYHejkinRaiders");

if (!(nInt == 2))
   return FALSE;
if (GetItemPossessedBy(oPC, "stoleniron") == OBJECT_INVALID) return FALSE;

return TRUE;
}
