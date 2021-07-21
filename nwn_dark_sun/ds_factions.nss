object oPlayer,oItem;
               void SetupFactions (object oPC)
{
oItem = GetItemPossessedBy(oPC, "FAC_HELM_TYRTMP");
object oItem2 = GetItemPossessedBy(oPC, "FAC_ITPNCK_URIKT");
if(GetIsObjectValid(oItem) != 0 || GetIsObjectValid(oItem2) != 0)
    {
    SendMessageToPC(oPC,GetName(oItem)+" detected.");
//    SendMessageToPC(oPC,"Attempting to set faction with "+GetName(GetObjectByTag("VeiledAlliance"))+" as hostile.");
    AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_VEILEDALLIANCE"), -100);
//    SendMessageToPC(oPC,"Attempting to set faction with "+GetName(GetObjectByTag("Templar"))+" as friendly.");
    AdjustReputation(oPC, GetObjectByTag("NPC_TYRGUARD001"), 100);
    oPlayer = GetFirstPC();
    while ( GetIsPC (oPlayer) == TRUE)
        {
        oItem = GetItemPossessedBy(oPlayer, "FAC_HELM_VEILED");
        if(GetIsObjectValid(oItem) != 0)
            {
//            SendMessageToPC(oPC,GetName(oItem)+" detected on "+GetName(oPlayer));
            SendMessageToPC(oPC,"Attempting to set VA member "+GetName(oPlayer)+" as an enemy.");
            SendMessageToPC(oPlayer,"Templar "+GetName(oPC)+" has just been seen in Tyr.");
            SetPCDislike(oPC,oPlayer);
            }
        oItem = GetItemPossessedBy(oPlayer, "FAC_ITMNCK_TYRVA");
        if(GetIsObjectValid(oItem) != 0)
            {
//            SendMessageToPC(oPC,GetName(oItem)+" detected on "+GetName(oPlayer));
            SendMessageToPC(oPC,"Attempting to set VA member "+GetName(oPlayer)+" as an enemy.");
            SendMessageToPC(oPlayer,"Templar "+GetName(oPC)+" has just been seen in Tyr.");
            SetPCDislike(oPC,oPlayer);
            }
        oItem = GetItemPossessedBy(oPlayer, "FAC_ITMNCK_URKVA");
        if(GetIsObjectValid(oItem) != 0)
            {
//            SendMessageToPC(oPC,GetName(oItem)+" detected on "+GetName(oPlayer));
            SendMessageToPC(oPC,"Attempting to set VA member "+GetName(oPlayer)+" as an enemy.");
            SendMessageToPC(oPlayer,"Templar "+GetName(oPC)+" has just been seen in Tyr.");
            SetPCDislike(oPC,oPlayer);
            }
        oPlayer = GetNextPC();
        }
    }

oItem = GetItemPossessedBy(oPC, "FAC_HELM_VEILED");
oItem2 = GetItemPossessedBy(oPC, "FAC_ITMNCK_TYRVA");
object oItem3 = GetItemPossessedBy(oPC, "FAC_ITMNCK_URKVA");
if(GetIsObjectValid(oItem) != 0 ||
   GetIsObjectValid(oItem2) != 0 ||
   GetIsObjectValid(oItem3) != 0)
    {
    SendMessageToPC(oPC,GetName(oItem)+" detected.");
//        SendMessageToPC(oPC,"Attempting to set faction with "+GetName(GetObjectByTag("VeiledAlliance"))+" as friendly.");
    AdjustReputation(oPC, GetObjectByTag("ATHAS_FACTION_VEILEDALLIANCE"), 100);
//        SendMessageToPC(oPC,"Attempting to set faction with "+GetName(GetObjectByTag("Templar"))+" as hostile.");
    AdjustReputation(oPC, GetObjectByTag("NPC_TYRGUARD001"), -100);
    oPlayer = GetFirstPC();
    while ( GetIsPC (oPlayer) == TRUE)
        {
        oItem = GetItemPossessedBy(oPlayer, "FAC_HELM_TYRTMP");
        if(GetIsObjectValid(oItem) != 0)
            {
//            SendMessageToPC(oPC,GetName(oItem)+" detected on "+GetName(oPlayer));
            SendMessageToPC(oPC,"Attempting to set Templar "+GetName(oPlayer)+" as an enemy.");
            SendMessageToPC(oPlayer,"VA member "+GetName(oPC)+" has just been seen in Tyr.");
            SetPCDislike(oPC,oPlayer);
            }
        oItem = GetItemPossessedBy(oPlayer, "FAC_ITPNCK_URIKT");
        if(GetIsObjectValid(oItem) != 0)
            {
//            SendMessageToPC(oPC,GetName(oItem)+" detected on "+GetName(oPlayer));
            SendMessageToPC(oPC,"Attempting to set Templar "+GetName(oPlayer)+" as an enemy.");
            SendMessageToPC(oPlayer,"VA member "+GetName(oPC)+" has just been seen in Tyr.");
            SetPCDislike(oPC,oPlayer);
            }
        oPlayer = GetNextPC();
        }
    }
}

void main()
{
 object oPC = GetEnteringObject();
 if (!GetIsObjectValid(oPC))oPC = OBJECT_SELF;

if (GetIsPC(oPC))
SetupFactions (oPC);

    SendMessageToPC(oPC,"VA reputation is now "+IntToString(GetReputation(GetObjectByTag("ATHAS_FACTION_VEILEDALLIANCE"), oPC)));
    SendMessageToPC(oPC,"Templar reputation is now "+IntToString(GetReputation(GetObjectByTag("NPC_TYRGUARD001"), oPC)));
// Make sure faction with non-combatant is ok
AdjustReputation(oPC, GetObjectByTag("DS_KANK001"), 100);
}
