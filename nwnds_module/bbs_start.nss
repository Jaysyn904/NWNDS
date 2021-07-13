#include "bbs_include"

void main()
{
  object oPC = GetLastUsedBy();
  if (GetIsPC(oPC)) {
    bbs_initiate(OBJECT_SELF);
    SetLocalInt(oPC,"PageIndex",0);
    bbs_change_page(-1000);
    SetLocalString(oPC,"PostAuthor","");
    ActionStartConversation(oPC, "", TRUE);
  }
}
