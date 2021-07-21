void main()
{
object oPC = GetPCSpeaker();
object oHelm = GetItemInSlot(INVENTORY_SLOT_HEAD, oPC);
string sGuild = GetSubString(GetTag(oHelm),5,4);
SpeakString(sGuild,TALKVOLUME_TALK);
location loc = GetLocation(OBJECT_SELF);
CreateObject(OBJECT_TYPE_PLACEABLE, "banner"+sGuild, loc, TRUE);
DestroyObject(OBJECT_SELF, 0.0);
}
