 #include "nw_i0_tool"
//::///////////////////////////////////////////////
//:: FileName Ka_SeleneRwd.nss
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/27/02 11:33:01 AM
//:://////////////////////////////////////////////
void main()
{

object oPC = GetPCSpeaker();

RewardPartyXP(300, oPC, FALSE);

RewardPartyGP(300, oPC, FALSE);

CreateItemOnObject("FAC_ITPNCK_DRAQO", oPC);

CreateItemOnObject("FAC_KEY_DRAQOMAN", oPC);

}
