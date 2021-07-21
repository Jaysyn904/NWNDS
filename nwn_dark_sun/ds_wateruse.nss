/* ds_wateruse
this goes in every area that you consume water in
*/

//:: adjust for the endurance feat id.
// const int FEAT_SURVIVAL = 1148;  <--- Using Trackless Step instead.


//#include "sha_subr_methds"

void main()
{
int nToTake = 1;                // Number of canteens to take.
string sTag = "AR_IT_WATER";    // Tag of Water items.
object oArea =  GetArea(OBJECT_SELF);
object oPC = GetFirstPC();

while (GetIsPC(oPC) == TRUE && GetHasFeat(201, oPC) == FALSE) // Trackless Step

{
if (GetArea(oPC) == oArea){
int nThirst = GetLocalInt(oPC,"nThirst");
if (nThirst < 500)
    {
    nThirst++;
    int nRandom = d10();
    switch(nRandom)
        {
        case 1:
        nThirst++;
        nThirst++;
        break;
        case 2:
        nThirst++;
        break;
        }
    SetLocalInt(oPC, "nThirst", nThirst);
    } else {
    SendMessageToPC(oPC,"You are thirsty.");
    SetLocalInt(oPC, "nThirst", 0);
    object oItemToTake = GetItemPossessedBy(oPC, "AR_IT_WATER");
    if(GetIsObjectValid(oItemToTake) == TRUE)
        {
        DestroyObject(oItemToTake);
        } else {
        AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectCurse(0, 0, 2, 0, 0, 0)), oPC));
        }
    }
} // if area
oPC = GetNextPC();
} // while
}


