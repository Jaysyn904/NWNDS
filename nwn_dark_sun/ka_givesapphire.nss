int nInt;
void main()
{

object oPC = GetPCSpeaker();

if (GetGold(oPC) >= 50000)
   {
   AssignCommand(oPC, TakeGoldFromCreature(50000, oPC, TRUE));

   CreateItemOnObject("largefinelycutsa", oPC);

   }
else
   {
   AssignCommand(GetObjectByTag("Korik"), ActionSpeakString("Do not try and cheat me fool! I am wise to such tricks!"));

}
}
