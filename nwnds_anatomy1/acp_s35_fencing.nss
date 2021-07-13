/////////////////////////////////////////////////
// ACP_S35_fencing
// Author: Adam Anden
// Creation Date: 09 March 2007
////////////////////////////////////////////////

#include "acp_S3_diffstyle"

//Sets fencing style

void main()
{
  SetCustomFightingStyle(18);
  SendMessageToPC(oPC, "Fencing Style");
}
