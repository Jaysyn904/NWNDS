void main()
{
object oPC = GetPCSpeaker();
DelayCommand(2.0,AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetObjectByTag("WP_Jail")))));
DelayCommand(6.0,FloatingTextStringOnCreature(GetName(oPC)+" has been arrested for eating an illegal substance.",oPC,FALSE));
DelayCommand(7.0,SetStandardFactionReputation(STANDARD_FACTION_COMMONER, 50, oPC));
}
