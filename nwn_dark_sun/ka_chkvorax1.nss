/*   Script generated by
Lilac Soul's NWN Script Generator, v. 1.6

For download info, please visit:
http://www.lilacsoul.revility.com    */

int StartingConditional()
{
object oPC = GetPCSpeaker();

if (!(GetLocalInt(oPC, "yehinaapproves") == 1)) return FALSE;

int nInt;
nInt=GetLocalInt(oPC, "NW_JOURNAL_ENTRYTheTemplars");

if (!(nInt == 5))
   return FALSE;

return TRUE;
}

