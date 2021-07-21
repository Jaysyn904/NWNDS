void main()
{

object oPC = GetPCSpeaker();

object oItem;
oItem = GetItemPossessedBy(oPC, "QST_METEORITEORE");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

}

