int StartingConditional()
{
  if (GetItemPossessedBy(GetPCSpeaker(), "bbs_notice") != OBJECT_INVALID) {
    return TRUE;
  }
  return FALSE;
}
