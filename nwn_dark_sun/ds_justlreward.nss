#include "nw_i0_plotwizard"
void main()
{
    object oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "QST_LASKCHFHEAD");
    DestroyObject(oItemToTake);
    CreateItemOnObject("QST_ITNCK_JUSTL", GetPCSpeaker());
    PWSetMinLocalIntPartyPCSpeaker("p001state_Justl", 3);
    PWSetMinLocalIntPartyPCSpeaker("p001state", 3);
    PWGiveExperienceParty(GetPCSpeaker(), 2000);
}
