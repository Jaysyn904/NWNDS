void main()
{
int iCounter = GetLocalInt(GetModule(), "re_AreaToolIndex") - 1;
SetLocalInt(GetModule(), "re_AreaToolIndex", iCounter);
}
