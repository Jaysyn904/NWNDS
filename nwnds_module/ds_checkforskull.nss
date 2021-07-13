//::///////////////////////////////////////////////
//:: FileName ds_checkforskull
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/29/02 4:07:48 PM
//:://////////////////////////////////////////////
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

int StartingConditional()
{
object oPC = GetPCSpeaker();

if (GetNumItems(oPC, "CRFT_GIANTSKULL") < 1) return FALSE;

return TRUE;
}
