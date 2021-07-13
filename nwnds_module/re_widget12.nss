int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oArea = GetArea(oPC);
    int iResult;
    object oObject = GetFirstObjectInArea(oArea);
    while(GetIsObjectValid(oObject))
        {
        if(GetLocalInt(oObject, "re_bRandomEncounter")) iResult = TRUE;
        oObject = GetNextObjectInArea(oArea);
        }
    return iResult;
}
