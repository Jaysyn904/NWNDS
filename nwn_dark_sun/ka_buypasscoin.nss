int nInt;
/*   Script generated by
Lilac Soul's NWN Script Generator, v. 1.6
/*   Script generated by
Lilac Soul's NWN Script Generator, v. 1.6

For download info, please visit:
http://www.lilacsoul.revility.com    */

//Put this on action taken in the conversation editor
void main()
{

object oPC = GetPCSpeaker();

if (GetGold(oPC) >= 100)
   {
   AssignCommand(oPC, TakeGoldFromCreature(100, oPC, TRUE));

   CreateItemOnObject("passcoin", oPC);

   }
else
   {
   AssignCommand(GetObjectByTag("Ephanie"), ActionSpeakString("Do not try and cheat me fool! I am wise to such tricks!"));

}
}
