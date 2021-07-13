void main()
{

object oPC = GetPCSpeaker();

object oItem;
oItem = GetItemPossessedBy(oPC, "esutascharm");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

CreateItemOnObject("clockworkislandt", oPC);

}
