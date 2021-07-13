//::///////////////////////////////////////////////
//:: FileName ds_givefish
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/29/02 4:25:04 PM
//:://////////////////////////////////////////////
void main()
{
    // Give the speaker the items
    CreateItemOnObject("QST_DRIEDFISH", GetPCSpeaker(), 1);

    // Set the variables
    SetLocalInt(GetPCSpeaker(), "nFirstTimeTalked", 3);

    SetLocalInt(GetPCSpeaker(), "nTriciQuest", 1);

}
