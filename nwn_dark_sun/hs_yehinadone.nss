int GetNumItems(object oTarget,string sItem)
{
int nNumItems = 0;
object oItem = GetFirstItemInInventory(oTarget);
while (GetIsObjectValid(oItem) == TRUE)
{
if (GetTag(oItem) == sItem)
{
nNumItems = nNumItems + GetNumStackedItems(oItem);
}
oItem = GetNextItemInInventory(oTarget);
}
return nNumItems;
}

/*   Script generated by
Lilac Soul's NWN Script Generator, v. 2.3

For download info, please visit:
http://nwvault.ign.com/View.php?view=Other.Detail&id=4683&id=625    */

int StartingConditional()
{
object oPC = GetPCSpeaker();

int nInt;
nInt=GetLocalInt(oPC, "NW_JOURNAL_ENTRYTheTemplars");

if (nInt < 11)
   return FALSE;

if (GetNumItems(oPC, "fac_helm_tyrtmp") <= 1) return FALSE;

if (GetNumItems(oPC, "FAC_ITPNCK_TYRTM") <= 1) return FALSE;

if (GetNumItems(oPC, "FAC_KEY_TYRTEMP") <= 1) return FALSE;

return TRUE;
}

