void main()
{

object oPC = GetPCSpeaker();

object oItem;
oItem = GetItemPossessedBy(oPC, "Gland1");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

int nInt;
nInt = GetLocalInt(oPC, "glandhunt");

nInt += 1;

SetLocalInt(oPC, "glandhunt", nInt);

}
