void main()
{
  string sTalk = GetLocalString(OBJECT_SELF, "Stack");
  if (sTalk != "") {
    if (GetStringLength(sTalk) > 30) {sTalk = GetStringLeft(sTalk, 30);}
    SetLocalString(OBJECT_SELF, "#T", sTalk);
    SetLocalString(OBJECT_SELF, "Stack", "");
  }
}
