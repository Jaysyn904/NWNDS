//::///////////////////////////////////////////////
//:: FileName at_001
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/27/02 4:45:17 PM
//:://////////////////////////////////////////////
void main()
{
    // Give the speaker the items
    CreateItemOnObject("QST_OFFICIALDOCS", GetPCSpeaker(), 1);

    SetLocalInt(GetPCSpeaker(), "nIbodQuest", 1);

}
