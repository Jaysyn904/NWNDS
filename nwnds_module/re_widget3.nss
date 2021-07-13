int StartingConditional()
{
object oPC = GetPCSpeaker();
object oArea = GetArea(oPC);
object oObject = GetFirstObjectInArea(oArea);
int iCounter;
while(GetIsObjectValid(oObject))
    {
    if(GetLocalInt(oObject, "re_BESIE"))
        {
        iCounter = iCounter + 1;
        SetLocalObject(GetModule(), "re_oAreaTool" + IntToString(iCounter), oObject);
        }
    oObject = GetNextObjectInArea(oArea);
    }
SetLocalInt(GetModule(), "re_iAreaTool", iCounter);
SetLocalInt(GetModule(), "re_AreaToolIndex", 1);
return iCounter;
}
