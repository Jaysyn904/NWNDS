#include "nw_i0_tool"

void main()
{
    object oUser = GetLastUsedBy();
        if (GetHitDice(oUser) <= 2)
            {
                RewardPartyXP(3000, oUser, FALSE);
            }

        else if (GetHitDice(oUser) >= 3)
        AssignCommand(OBJECT_SELF, ActionStartConversation(oUser));
}
