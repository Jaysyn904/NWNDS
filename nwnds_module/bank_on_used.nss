#include "bank_inc"
void main()
{
    object oLastPC = GetLastUsedBy();
    if (GetIsPC(oLastPC))
    {
        string sUsingPC = GetLocalString(OBJECT_SELF, "PCUsingChest");
        string sCurPC = GetKey(oLastPC, 1);
        if (TestStringAgainstPattern(sUsingPC, sCurPC) == FALSE )
        {

            if ( sUsingPC != "" )
            {
                AssignCommand(oLastPC, ActionMoveAwayFromObject(OBJECT_SELF, TRUE, 5.0));
                SendMessageToPC(oLastPC, "This Bank Vault is in use.  Please wait your turn.");
            }
        }
    }
}
