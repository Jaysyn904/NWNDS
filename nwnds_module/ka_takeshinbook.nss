//Put this on action taken in the conversation editor
void main()
{

object oPC = GetPCSpeaker();

object oItem;
oItem = GetItemPossessedBy(oPC, "QST_ITBK_LASTSEA");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

}
