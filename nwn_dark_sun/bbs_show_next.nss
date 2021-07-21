#include "aps_include"
int StartingConditional()
{
  object oBBS = GetLocalObject(GetModule(), "BBS_" + GetTag(OBJECT_SELF));
  int PageSize = GetLocalInt(oBBS, "PageSize");
  int PageIndex = GetLocalInt(GetPCSpeaker(), "PageIndex");
  int TotalItems;
  string sSQL = "SELECT * FROM bbs_stats WHERE Tag='"+SQLEncodeSpecialChars(GetTag(oBBS))+"'";
  SQLExecDirect(sSQL);
  if(SQLFetch())
    TotalItems = StringToInt(SQLGetData(2));
  else
    TotalItems = 0;
  if (TotalItems > (PageIndex + 1) * PageSize) {
    return TRUE;
  }
  return FALSE;
}
