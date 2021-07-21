#include "nw_i0_tool"
void main()
{

object oPC = GetPCSpeaker();

CreateItemOnObject("forgedpreludeo", oPC);

RewardPartyXP(3000, oPC, TRUE);

}
