int StartingConditional()
{
  if (GetLocalString(OBJECT_SELF, "#T") != "") {
    return TRUE;
  }
  return FALSE;
}
