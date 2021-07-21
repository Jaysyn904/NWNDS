void main()
{

object oPC = GetLastOpenedBy();

if (!GetIsPC(oPC)) return;

int DoOnce = GetLocalInt(oPC, GetTag(OBJECT_SELF));

if (DoOnce==TRUE) return;

SetLocalInt(oPC, GetTag(OBJECT_SELF), TRUE);

CreateItemOnObject("nw_it_gem013", OBJECT_SELF);

}
