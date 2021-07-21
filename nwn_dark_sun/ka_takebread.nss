//Put this on action taken in the conversation editor
void main()
{

object oPC = GetPCSpeaker();

object oItem;
oItem = GetItemPossessedBy(oPC, "QST_LARZBREAD");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

}
