/*   Script generated by
Lilac Soul's NWN Script Generator, v. 1.6

For download info, please visit:
http://www.lilacsoul.revility.com    */

int StartingConditional()
{
object oPC = GetPCSpeaker();

if ((GetLevelByClass(CLASS_TYPE_ROGUE, oPC)==0))
return FALSE;

return TRUE;
}

