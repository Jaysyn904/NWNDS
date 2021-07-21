int StartingConditional()
{
  if (GetLocalString(OBJECT_SELF, "#M") != "") {
    return TRUE;
  }
  return FALSE;
}
