/*   Script generated by
Lilac Soul's NWN Script Generator, v. 1.6

For download info, please visit:
http://www.lilacsoul.revility.com    */

int StartingConditional()
{
object oPC = GetPCSpeaker();

int nInt;
nInt=GetLocalInt(oPC, "NW_JOURNAL_ENTRYClockwork");

if (!(nInt == 11))
   return FALSE;

if (GetItemPossessedBy(oPC, "MapofClockworkIsle") == OBJECT_INVALID) return FALSE;

return TRUE;
}

