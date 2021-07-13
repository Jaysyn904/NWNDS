//::///////////////////////////////////////////////
//:: Default: Commoner Calls Guards
//:: ds_callguards
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastDisturbed();
    ExecuteScript("prc_npc_disturb", OBJECT_SELF);
    if(GetIsDM(oPC) || GetIsDMPossessed(oPC) || !GetIsPC(oPC))
        {
        string sMsg ="Thank you master, may I have another?";
        SpeakString(sMsg, TALKVOLUME_WHISPER);
        return;
        }

SpeakString("Guards!  Help!  Thief!", TALKVOLUME_TALK);
DelayCommand(2.0,AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetObjectByTag("WP_Jail")))));
DelayCommand(6.0,FloatingTextStringOnCreature(GetName(oPC)+" has been arrested for theft.",oPC,FALSE));

}
