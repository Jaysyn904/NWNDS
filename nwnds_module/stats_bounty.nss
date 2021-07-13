#include "aps_include"
#include "dante_db"

void main()
{
    string sText= "----------------\n";
    int bBounty = FALSE;

    object oPlayer = GetFirstPC();
    while(GetIsObjectValid(oPlayer))
    {
        if(!GetIsDM(oPlayer) && !GetIsDMPossessed(oPlayer))
        {
			string sVarPlayer = GetCampaignVariableName(oPlayer);
            int nBounty = GetPersistentInt(oPlayer, "Bounty" + sVarPlayer, "ar_dsostats");
            if (nBounty > 0)
            {
                sText += GetName(oPlayer) + " - ";
                sText += IntToString(nBounty) + " ceramics\n";
                if (!bBounty)
                {
                    bBounty = TRUE;
                }
            }
        }
        oPlayer = GetNextPC();
    }
    if (bBounty)
    {
        SpeakString(sText);
    }
    else
    {
        SpeakString("--------\nThere are no current bounties.\n");
    }
}