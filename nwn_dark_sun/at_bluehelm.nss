//::///////////////////////////////////////////////
//:: FileName at_bluehelm
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/25/02 8:40:55 PM
//:://////////////////////////////////////////////
void main()
{
    // Give the speaker the items
    CreateItemOnObject("helmtemp", GetPCSpeaker(), 1);
    SetLocalInt(GetPCSpeaker(),"nDidROB",1);


    // Modify the player's reputation
    AdjustReputation(GetPCSpeaker(), GetObjectByTag("tyriansoldier"), 100);
    AdjustReputation(GetPCSpeaker(), GetObjectByTag("halflingelite001"), -100);

object oItem;
object oPC = GetPCSpeaker();
object oPlayer = GetFirstPC();
while ( GetIsPC (oPlayer) == TRUE)
{
oItem = GetItemPossessedBy(oPlayer, "helmva");
if(GetIsObjectValid(oItem) != 0)
SetPCDislike(oPC,oPlayer);
oPlayer = GetNextPC();
}


}
