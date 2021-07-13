//void main(){}
//BULLETIN BOARD SYSTEM VERSION 1.1

//This is an include file. Upon building your module you will get
//a compile error in this file. That is normal and does not
//affect the operation of the bulletin board.
#include "aps_include"

void bbs_do_board_stats();
void bbs_initiate(object oBBS);
int bbs_can_show(int WhichEntry);
void bbs_change_page(int PageChange);
void bbs_select_entry(int WhichEntry);
void bbs_add_notice(object oBBS, string sPoster, string sTitle, string sMessage, string sDate, string sBBStag = "");
int bbs_drop_lowest(string sBBStag, int LowestItem);

//Loads into tokens the stats for a board
void bbs_do_board_stats() {
  object oBBS = GetLocalObject(GetModule(), "BBS_" + GetTag(OBJECT_SELF));
  int PageSize = GetLocalInt(oBBS, "PageSize");
  int TotalItems = 0;
  string sSQL = "SELECT * FROM bbs_stats WHERE Tag='"+SQLEncodeSpecialChars(GetTag(oBBS))+"'";
  SQLExecDirect(sSQL);
  if(SQLFirstRow()==SQL_SUCCESS)
    TotalItems = StringToInt(SQLGetData(2));
  int PageIndex = GetLocalInt(GetPCSpeaker(), "PageIndex") + 1;
  SetCustomToken(3671, IntToString(TotalItems));
  if (TotalItems == 0) {PageIndex = 0;}
  SetCustomToken(3672, IntToString(PageIndex));
  SetCustomToken(3673, IntToString((TotalItems + PageSize - 1) / PageSize));
}

//Initiates a bulletin board's settings if neccessary
void bbs_initiate(object oBBS) {
  string sBBS = "BBS_" + GetTag(oBBS);
  object myBBS = GetLocalObject(GetModule(), sBBS);
  if (!GetIsObjectValid(myBBS)) {
    SetLocalObject(GetModule(), sBBS, oBBS);
    myBBS = oBBS;
    //MaxItems is the maximum number of messages
    SetLocalInt(myBBS, "MaxItems", 50);
    //PageSize is the number of entries per page, between 1 and 10
    SetLocalInt(myBBS, "PageSize", 5);
  }
}

//Determines whether a dialogue option is visible in conversation
int bbs_can_show(int WhichEntry) {
  object oBBS = GetLocalObject(GetModule(), "BBS_" + GetTag(OBJECT_SELF));
  int PageSize = GetLocalInt(oBBS, "PageSize");
  int nSpot = GetLocalInt(GetPCSpeaker(), "PageIndex") * PageSize + WhichEntry;
  int TotalItems = 0;
  if(WhichEntry>PageSize)
    return FALSE;
  string sSQL = "SELECT * FROM bbs_stats WHERE Tag='"+SQLEncodeSpecialChars(GetTag(oBBS))+"'";
  SQLExecDirect(sSQL);
  if(SQLFirstRow()==SQL_SUCCESS)
    TotalItems = StringToInt(SQLGetData(2));
  if(nSpot <= TotalItems && WhichEntry <= PageSize) {return TRUE;}
  return FALSE;
}

//Moves the page by the required PageFlip:
//0 to reload page, -1 for previous page, 1 for next page
void bbs_change_page(int PageFlip) {
  object oBBS = GetLocalObject(GetModule(), "BBS_" + GetTag(OBJECT_SELF));
  int PageSize = GetLocalInt(oBBS, "PageSize");
  int MaxItems = GetLocalInt(oBBS, "MaxItems");
  int TotalItems,LatestItem,LowestItem;
  string sBBStag = SQLEncodeSpecialChars(GetTag(oBBS));
  string sSQL = "SELECT * FROM bbs_stats WHERE Tag='"+sBBStag+"'";
  SQLExecDirect(sSQL);
  if(SQLFetch()){
    TotalItems = StringToInt(SQLGetData(2));
    LatestItem = StringToInt(SQLGetData(3));
    LowestItem = StringToInt(SQLGetData(4));
    }
  int PageIndex = GetLocalInt(GetPCSpeaker(), "PageIndex") + 1 * PageFlip;
  if (PageIndex < 0) {PageIndex = 0;}
  SetLocalInt(GetPCSpeaker(), "PageIndex", PageIndex);
  SetLocalString(GetPCSpeaker(),"PostAuthor","");
  int i;
  for(i = 3680; i<=3700;i++)
    SetCustomToken(i,"");
  string sInfo;
  int Page = PageIndex*PageSize;
  int iOffset = 0;
  int iLimitStart = PageIndex*PageSize;
  int iLimitEnd = ((PageIndex+1)*PageSize);
  sSQL = "SELECT * FROM bbs WHERE Tag='"+sBBStag+"' ORDER BY ID DESC LIMIT "+IntToString(iLimitStart)+","+IntToString(iLimitEnd);
  SQLExecDirect(sSQL);
  while(SQLFetch()!=SQL_ERROR){
        sInfo = SQLDecodeSpecialChars(SQLGetData(5));
        SetCustomToken((3680 + iOffset), sInfo);
        sInfo = SQLDecodeSpecialChars(SQLGetData(3));
        SetCustomToken((3690 + iOffset), sInfo);
    iOffset++;
    }
  SetCustomToken((3690 + (iOffset-1)),(sInfo+"\n\n"));
  bbs_do_board_stats();
  SetCustomToken(3674, "");
  SetCustomToken(3675, "");
  SetCustomToken(3676, "");
  SetCustomToken(3677, "");
  SetCustomToken(3678, "");
}

//Displays the selected post
void bbs_select_entry(int WhichEntry) {
  object oBBS = GetLocalObject(GetModule(), "BBS_" + GetTag(OBJECT_SELF));
  string sBBStag = SQLEncodeSpecialChars(GetTag(oBBS));
  int PageSize = GetLocalInt(oBBS, "PageSize");
  int MaxItems = GetLocalInt(oBBS, "MaxItems");
  int LatestItem = 0;
  string sSQL = "SELECT * FROM bbs_stats WHERE Tag='"+sBBStag+"'";
  SQLExecDirect(sSQL);
  if(SQLFirstRow()==SQL_SUCCESS)
    LatestItem = StringToInt(SQLGetData(3));
  int PageIndex = GetLocalInt(GetPCSpeaker(), "PageIndex");
  string sPoster,sTitle,sDate,sMessage,sID;
  int iLimit = PageIndex * PageSize + WhichEntry;
  int iOffset = 1;
  sSQL = "SELECT * FROM bbs WHERE Tag='"+sBBStag+"' ORDER BY ID DESC LIMIT "+IntToString(iLimit);
  SQLExecDirect(sSQL);
  while(SQLFetch()!=SQL_ERROR){
    if(iOffset == iLimit){
        sID = SQLGetData(2);
        sPoster = SQLDecodeSpecialChars(SQLGetData(3));
        sDate = SQLDecodeSpecialChars(SQLGetData(4));
        sTitle = SQLDecodeSpecialChars(SQLGetData(5));
        sMessage = SQLDecodeSpecialChars(SQLGetData(6));
        }
    iOffset++;
    }
  SetLocalString(GetPCSpeaker(),"PostAuthor",sPoster);
  SetLocalInt(GetPCSpeaker(),"CurrentEntry",StringToInt(sID));
  bbs_do_board_stats();
  SetCustomToken(3674, "\n\n"+sTitle+"\nBy:  ");
  SetCustomToken(3675, sPoster);
  SetCustomToken(3676, "     On: ");
  SetCustomToken(3677, sDate);
  SetCustomToken(3678, "\n"+sMessage);
}

//Adds a post to the bulletin board. This can be called at any time
//so you can insert your own notices. If you don't specify a sDate,
//it will use the current game time. The proper format for sDate is
//something like "6/30/1373 11:58".
void bbs_add_notice(object oBBS, string sPoster, string sTitle, string sMessage, string sDate, string sBBStag = "")
{
  if (sBBStag != "") {oBBS = GetObjectByTag(sBBStag);}
  bbs_initiate(oBBS);
  oBBS = GetLocalObject(GetModule(), "BBS_" + GetTag(oBBS));
  sBBStag = SQLEncodeSpecialChars(GetTag(oBBS));
  if (sDate == "") {
    sDate = IntToString(GetTimeMinute());
    if (GetStringLength(sDate) == 1) {sDate = "0" + sDate;}
    sDate = IntToString(GetCalendarMonth()) + "/" + IntToString(GetCalendarDay()) + "/" + IntToString(GetCalendarYear()) + " " + IntToString(GetTimeHour()) + ":" + sDate;
  }
  int MaxItems = GetLocalInt(oBBS,"MaxItems");
  int TotalItems,LatestItem,LowestItem;
  sBBStag = SQLEncodeSpecialChars(sBBStag);
  sPoster = SQLEncodeSpecialChars(sPoster);
  sTitle = SQLEncodeSpecialChars(sTitle);
  sDate = SQLEncodeSpecialChars(sDate);
  sMessage = SQLEncodeSpecialChars(sMessage);
  string sSQL;
  sSQL = "SELECT * FROM bbs_stats WHERE Tag='" + sBBStag + "'";
  SQLExecDirect(sSQL);
  if(SQLFetch()==SQL_SUCCESS){
    TotalItems = (StringToInt(SQLGetData(2))+1);
    LatestItem = (StringToInt(SQLGetData(3))+1);
    LowestItem = StringToInt(SQLGetData(4));
  if(TotalItems>MaxItems){
    LowestItem = bbs_drop_lowest(sBBStag,LowestItem);
    TotalItems--;
    }
  //Update the Board Stats row
  sSQL = "UPDATE bbs_stats SET Total="+IntToString(TotalItems)+", Latest="+IntToString(LatestItem)+", Lowest="+IntToString(LowestItem)+" WHERE Tag='" +sBBStag+"'";
  SQLExecDirect(sSQL);
    }
  else {
    TotalItems = 1;
    LatestItem = 1;
    LowestItem = 1;
  if(LowestItem == 0){LowestItem=LatestItem;}
  //Create the Boards Stats row
  sSQL = "INSERT INTO bbs_stats (Tag,Total,Latest,Lowest) VALUES ('"+sBBStag+"',"+IntToString(TotalItems)+","+IntToString(LatestItem)+","+IntToString(LowestItem)+")";
  SQLExecDirect(sSQL);
    }
  sSQL = "INSERT INTO bbs (Tag,ID,Poster,Date,Title,Message) VALUES "+
    "('"+sBBStag+"',"+IntToString(LatestItem)+",'"+sPoster+
    "','"+sDate+"','"+sTitle+"','"+sMessage+"')";
  SQLExecDirect(sSQL);

}

int bbs_drop_lowest(string sBBStag,int LowestItem)
{
string sSQL;
int Lowest;
sSQL = "DELETE FROM bbs WHERE Tag='"+sBBStag+"' AND ID="+IntToString(LowestItem);
SQLExecDirect(sSQL);
sSQL = "SELECT * FROM bbs WHERE Tag='"+sBBStag+"' ORDER BY ID LIMIT 1";
SQLExecDirect(sSQL);
if(SQLFirstRow()==SQL_SUCCESS)
    Lowest = StringToInt(SQLGetData(2));
else
    Lowest = 0;
return Lowest;
}

void bbs_delete_entry() {
  int CurrentEntry = GetLocalInt(GetPCSpeaker(), "CurrentEntry");
  object oBBS = GetLocalObject(GetModule(), "BBS_"+GetTag(OBJECT_SELF));
  string sSQL;
  string sBBStag = SQLEncodeSpecialChars(GetTag(oBBS));
  int TotalItems = 0;
  int LatestItem = 0;
  int LowestItem = 0 ;
  sSQL = "SELECT * FROM bbs_stats WHERE Tag='" + sBBStag + "'";
  SQLExecDirect(sSQL);
  if(SQLFetch()==SQL_SUCCESS){
    TotalItems = StringToInt(SQLGetData(2));
    LatestItem = StringToInt(SQLGetData(3));
    LowestItem = StringToInt(SQLGetData(4));
    }
  sSQL = "DELETE FROM bbs WHERE Tag='"+sBBStag+"' AND ID="+IntToString(CurrentEntry);
  SQLExecDirect(sSQL);
  if(CurrentEntry==LowestItem){
  sSQL = "SELECT * FROM bbs WHERE Tag='"+sBBStag+"' ORDER BY ID LIMIT 1";
  SQLExecDirect(sSQL);
  if(SQLFetch()==SQL_SUCCESS)
    LowestItem = StringToInt(SQLGetData(2));
  else
    LowestItem = 0;
  }
  if(CurrentEntry==LatestItem){
  sSQL = "SELECT * FROM bbs WHERE Tag='"+sBBStag+"' ORDER BY ID DESC LIMIT 1";
  SQLExecDirect(sSQL);
  if(SQLFetch()==SQL_SUCCESS)
    LatestItem = StringToInt(SQLGetData(2));
  else
    LatestItem = 0;
  }
  TotalItems--;
  sSQL = "UPDATE bbs_stats SET Total="+IntToString(TotalItems)+", Latest="+IntToString(LatestItem)+", Lowest="+IntToString(LowestItem)+" WHERE Tag='"+sBBStag+"'";
  SQLExecDirect(sSQL);
  bbs_change_page(TotalItems * -1);
}
