/*   Script generated by
Lilac Soul's NWN Script Generator, v. 1.6

For download info, please visit:
http://www.lilacsoul.revility.com    */

//Put this on action taken in the conversation editor
void main()
{

object oPC = GetPCSpeaker();

if (GetGold(oPC) >= 700)
   {
   AssignCommand(oPC, TakeGoldFromCreature(700, oPC, TRUE));

   CreateItemOnObject("ar_it_contain002", oPC);

   }
else
   {
   AssignCommand(GetObjectByTag("Teren"), ActionSpeakString("Do not try and cheat me fool! I am wise to such tricks!"));

}
}
