//Put this on action taken in the conversation editor
void main()
{

object oPC = GetPCSpeaker();

object oItem;
oItem = GetItemPossessedBy(oPC, "CaravanSupplies");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

}
