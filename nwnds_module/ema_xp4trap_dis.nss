/*----------------------------------------------------------------------

New Name:   ema_xp4trap_dis
Date:       19-OCT-2003 - created
Date:       20-oct-2003 - reworked comments
Re-creator: Drakkenkin

Notes:
This Script was made from the scripts Telzar08Trap_XP_award and
     Velar03trap_disarm_xp. The Scripts were made by Telzar and Velar
     respectively.

I re-worked this script because I like most of one of the script but
     I like the detection if the PC is in or out of combat of the
     other script. So I combined the two.

----------------------------------------------------------------------*/


// Variables
object oPC=GetLastDisarmed();
int iXPaward = 0;
int iXPawarddc = 0;

void main()
{
    if (GetIsInCombat(oPC))
    {
	iXPawarddc = (GetTrapDisarmDC(OBJECT_SELF) *10);
	    // Multiplies the Trap Disarm DC by 10

	iXPaward = (iXPawarddc -((GetHitDice(oPC)-1)*10));
	    // Subtracts 10xp for every (level - 1) of pc form award.
            //(this way 1st level Pcs get full xp).
    }
    else
    {

	iXPawarddc = (GetTrapDisarmDC(OBJECT_SELF) *5);
	    // Multiplies the Trap Disarm DC by 5

	iXPaward = (iXPawarddc -((GetHitDice(oPC)-1)*5));
	    // Subtracts 5xp for every (level - 1) of pc form award.
    }
	SendMessageToPC( (oPC ),"Trap disarmed");
	    // Sends message to the PC stating - trap was disarmed.

	if (iXPaward >= 1)
	    // checks to make sure that the xp award is at least 1.
    {
	GiveXPToCreature(oPC, iXPaward);
	    // If the XP reward is at least 1 then give the PC a reward.
    }
	else
	    // If the XP award is less then 1.
    {
	GiveXPToCreature(oPC, 1);
	   // give 1 xp.
    }
}
