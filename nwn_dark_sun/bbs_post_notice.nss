#include "bbs_include"
void main()
{
  object oPC = GetPCSpeaker();
  object oNotice = GetItemPossessedBy(oPC, "bbs_notice");
  if (GetIsObjectValid(oNotice)) {
    string nPoster = GetName(oPC) + " (" + GetPCPlayerName(oPC) + ")";
    string nTitle = GetLocalString(oNotice,"#T");
    string nMessage = GetLocalString(oNotice,"#M");
    ActionTakeItem(oNotice, oPC);
    bbs_add_notice(OBJECT_SELF, nPoster, nTitle, nMessage, "");
    bbs_change_page(-1000);
  }
}
