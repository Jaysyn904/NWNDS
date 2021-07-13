void main()
{
int iCounter = GetLocalInt(GetModule(), "re_AreaToolIndex");
object oObject = GetLocalObject(GetModule(), "re_oAreaTool" + IntToString(iCounter));
SetLocalInt(oObject, "re_disable", TRUE);
}
