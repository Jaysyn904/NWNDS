void main()
{
 // Keep merchants and other armor stands from going hostile
 object oPC = GetLastAttacker();
 SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, 50, oPC);

 // Don't fade
 SetIsDestroyable(FALSE,FALSE,TRUE);
}
