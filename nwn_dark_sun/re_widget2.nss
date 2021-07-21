int StartingConditional()
{
object oPC = GetPCSpeaker();
int iCounter = GetLocalInt(GetModule(), "re_AreaToolIndex");
object oObject = GetLocalObject(GetModule(), "re_oAreaTool" + IntToString(iCounter));
string sToken;
int bReturn;
sToken = sToken + "Tool Type: " + GetLocalString(oObject, "re_ToolType") + "\n"
                + "Name: " + GetName(oObject) + "\n"
                + "Tag: " + GetTag(oObject) + "\n";
if(GetLocalInt(oObject, "re_iBegin") || GetLocalInt(oObject, "re_iEnd"))
    {
    sToken = sToken + "Begin Time: " + IntToString(GetLocalInt(oObject, "re_iBegin")) + "\n"
                    + "End Time:   " + IntToString(GetLocalInt(oObject, "re_iEnd")) + "\n";
    }
if(GetLocalInt(oObject, "re_disable")) sToken = sToken + "State: Disabled";
else sToken = sToken + "State: Enabled";
sToken = sToken + "\n";
SetCustomToken(2112, sToken);
return TRUE;
}
