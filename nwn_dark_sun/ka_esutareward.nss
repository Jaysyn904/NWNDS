#include "nw_i0_tool"
/*   Script generated by
Lilac Soul's NWN Script Generator, v. 1.6

For download info, please visit:
http://www.lilacsoul.revility.com    */

//Put this on action taken in the conversation editor
void main()
{

object oPC = GetPCSpeaker();

RewardPartyGP(1000, oPC, FALSE);

CreateItemOnObject("skydancercharm", oPC);

}
