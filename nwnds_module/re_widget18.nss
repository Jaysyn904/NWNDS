void main()
{
object oPC = GetPCSpeaker();
object oArea = GetArea(oPC);
object oObject = GetFirstObjectInArea(oArea);
while(GetIsObjectValid(oObject))
    {
    if(GetLocalInt(oObject, "re_bRandomEncounter") && !IsInConversation(oObject)) DestroyObject(oObject);
    oObject = GetNextObjectInArea(oArea);
    }
}
