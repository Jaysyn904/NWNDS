/////////////////////////////////////////////////
// ACP_S3_diffstyle
// Author: Ariel Kaiser
// Modified by: Adam Anden
// Creation Date: 13 May 2005
// Modified Date: 28 January 2008
////////////////////////////////////////////////
/*
  In combination with the right feat.2da and spells.2da entries, this script
  allows a player (or possessed NPC with the right feat, I guess) to change
  their fighting style and trade it for different animations. Part of the ACP pack.
*/

object oPC = GetPCSpeaker(); //this script is always called by one person.

void ResetFightingStyle() //Resets the character phenotype to 0
{
    //If we are at phenotype 15-20 we want to reset it to neutral.
    if (GetPhenoType(oPC) == 15 || GetPhenoType(oPC) == 16 || GetPhenoType(oPC) == 17 || GetPhenoType(oPC) == 18 || GetPhenoType(oPC) == 19 || GetPhenoType(oPC) == 20 || GetPhenoType(oPC) == 30 || GetPhenoType(oPC) == 31 || GetPhenoType(oPC) == 32|| GetPhenoType(oPC) == 33)
    {
        SetPhenoType(0, oPC);
    }

    //else, warn that the player doesn't have a phenotype which can be reset right now
    else
    {
        SendMessageToPC(oPC, "This may not work for you...");
        SetPhenoType(0, oPC);
    }

}

void SetCustomFightingStyle(int iStyle) //Sets character phenotype to 15,16,17 or 18
{
    //Maybe we're already using this fighting style? Just warn the player.
    if (GetPhenoType(oPC) == iStyle)
        SendMessageToPC(oPC, "You're already using this fighting style!");

    //If we are at phenotype 0 or one of the styles themselves, we go ahead
    //and set the creature's phenotype accordingly! (safe thanks to previous 'if')
    else if (GetPhenoType(oPC) == 0 || GetPhenoType(oPC) == 15 || GetPhenoType(oPC) == 16 || GetPhenoType(oPC) == 17 || GetPhenoType(oPC) == 18 || GetPhenoType(oPC) == 19 || GetPhenoType(oPC) == 20 || GetPhenoType(oPC) == 30 || GetPhenoType(oPC) == 31 || GetPhenoType(oPC) == 32 || GetPhenoType(oPC) == 33)
    {
        SetPhenoType(iStyle, oPC);
    }

    //At phenotype 2? Tell the player they're too fat!
    else if (GetPhenoType(oPC) == 2)
        SendMessageToPC(oPC, "You're too fat to use a different fighting style!");

    //...we didn't fulfil the above conditions? Warn the player.
    else
    {
        SendMessageToPC(oPC, "Your phenotype is non-standard / this may not work...");
        SetPhenoType(iStyle, oPC);
    }

}
