/*   Script generated by
Lilac Soul's NWN Script Generator, v. 1.6

For download info, please visit:
http://www.lilacsoul.revility.com    */

int StartingConditional()
{
object oPC = GetPCSpeaker();

int nInt;
nInt=GetLocalInt(oPC, "NW_JOURNAL_ENTRYLostSouls");

if (!(nInt == 4))
   return FALSE;
if (GetItemPossessedBy(oPC, "QST_MYSTSOUL") == OBJECT_INVALID) return FALSE;

return TRUE;
}

