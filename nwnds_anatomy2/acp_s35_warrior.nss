/////////////////////////////////////////////////
// ACP_S35_warrior
// Author: Adam Anden
// Creation Date: 09 March 2007
////////////////////////////////////////////////

#include "acp_S3_diffstyle"

//Sets classic warrior style

void main()
{
  SetCustomFightingStyle(21);
  SendMessageToPC(oPC, "Warrior...");
}
