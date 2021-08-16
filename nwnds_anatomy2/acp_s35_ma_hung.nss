/////////////////////////////////////////////////
// acp_s35_MA_hung
// Author: Adam Anden
// Creation Date: 28 January 2008
////////////////////////////////////////////////

#include "acp_S3_diffstyle"

//Sets Bear's Claw style

void main()
{
  SetCustomFightingStyle(33);
  SendMessageToPC(oPC, "Bear's Claw...");
}

