///////////////////////////////////
// Carcerian's BattleCry Script  //
//      "Evil Dead" Edition      //
///////////////////////////////////

#include "NW_I0_GENERIC"

const int BattleCryChance = 15;
const int CombatCryChance = 20;
const int DeathCryChance = 20;
const int CustomUndeadChance = 50;

const string COLOR_RED = "<cþ  >";
const string COLOR_DARK = "<cSSS>";
const string COLOR_GREEN = "<c þ >";
const string COLOR_WHITE = "<cþþþ>";
const string COLOR_VIOLET = "<c¥ ¥>";
const string COLOR_YELLOW = "<cþþ >";

int HasSpoken()
{
    if (GetLocalInt(OBJECT_SELF,"HASSPOKEN")) return 1;
    SetLocalInt(OBJECT_SELF,"HASSPOKEN",1);
    DelayCommand(IntToFloat(d10(4)),SetLocalInt(OBJECT_SELF,"HASSPOKEN",0));
    return 0;
}

void DoUndeadChatter()
{
    string sMyTag = GetTag(OBJECT_SELF);
    if ((FindSubString(sMyTag,"SKEL")>-1)||(FindSubString(sMyTag,"MOHRG")>-1))
    {
        switch (d3()) // Skeletons
        {
            case 1 : ActionSpeakString(COLOR_WHITE+"I got a bone to pick with you!",TALKVOLUME_TALK); break;
            case 2 : ActionSpeakString(COLOR_WHITE+"Forward, you worthless bags of bones!",TALKVOLUME_TALK); break;
            case 3 : ActionSpeakString(COLOR_WHITE+"CHARGE!",TALKVOLUME_TALK); break;
         }
    }
    else if (FindSubString(sMyTag,"ZOMB")>-1)
    {
        if (Random(2)) ActionSpeakString(COLOR_GREEN+"Brains!",TALKVOLUME_TALK);
        else ActionSpeakString(COLOR_GREEN+"BRAINS!",TALKVOLUME_TALK);
        // "More brains!"
    }
    else if ((FindSubString(sMyTag,"GHOUL")>-1)||(FindSubString(sMyTag,"GHAST")>-1)
           ||(FindSubString(sMyTag,"WIGHT")>-1))
    {
        switch (d4()) // Flesh Eaters
        {
            case 1 : ActionSpeakString(COLOR_GREEN+"I'll feast on your entrails!",TALKVOLUME_TALK); break;
            case 2 : ActionSpeakString(COLOR_GREEN+"FOOD!",TALKVOLUME_TALK); break;
            case 3 : ActionSpeakString(COLOR_GREEN+"Live ones!!",TALKVOLUME_TALK); break;
            case 4 : ActionSpeakString(COLOR_GREEN+"FLESSSSHHHH!!!",TALKVOLUME_TALK); break;
         }
     }
    else if ((FindSubString(sMyTag,"WRAITH")>-1)||(FindSubString(sMyTag,"ALLIP")>-1)
    ||(FindSubString(sMyTag,"Bodak")>-1)||(FindSubString(sMyTag,"SHADOW")>-1)
    ||(FindSubString(sMyTag,"SHFIEND")>-1)||(FindSubString(sMyTag,"SPECTRE")>-1))
    {
        switch (d4())  // Soul Eaters
        {
            case 1 : ActionSpeakString(COLOR_VIOLET+"I'll swallow your soul!",TALKVOLUME_TALK); break;
            case 2 : ActionSpeakString(COLOR_VIOLET+"Your soul will be mine!",TALKVOLUME_TALK); break;
            case 3 : ActionSpeakString(COLOR_VIOLET+"Mine!!!!",TALKVOLUME_TALK); break;
            case 4 : ActionSpeakString(COLOR_VIOLET+"The darkness calls for you...",TALKVOLUME_TALK); break;
         }
     }
    else switch (d6()) // Generic Undead
    {
        case 1 : ActionSpeakString(COLOR_RED+"I'll swallow your soul!",TALKVOLUME_TALK); break;
        case 2 : ActionSpeakString(COLOR_RED+"Blood and souls!",TALKVOLUME_TALK); break;
        case 3 : ActionSpeakString(COLOR_RED+"Joinnnn usssssssss!",TALKVOLUME_TALK); break;
        case 4 : ActionSpeakString(COLOR_RED+"For the Master!",TALKVOLUME_TALK); break;
        case 5 : ActionSpeakString(COLOR_RED+"For the Master!",TALKVOLUME_TALK); break;
        case 6 : ActionSpeakString(COLOR_RED+"One by one we will take you!",TALKVOLUME_TALK); break;
     }
}

// For use on perception
void DoBattleCry()
{    //if undead spotted "i see dead people!" "Dead ahead!"
    if (d100()<=BattleCryChance)
    {
        if (HasSpoken()) return;
        if ((GetRacialType(OBJECT_SELF) == RACIAL_TYPE_UNDEAD)&&(d100()<=CustomUndeadChance))
        {
            DoUndeadChatter();
        }
        else switch (d10())
        {
            case 1: PlayVoiceChat(VOICE_CHAT_ATTACK); break;
            case 2: PlayVoiceChat(VOICE_CHAT_BATTLECRY1); break;
            case 3: PlayVoiceChat(VOICE_CHAT_BATTLECRY2); break;
            case 4: PlayVoiceChat(VOICE_CHAT_BATTLECRY3); break;
            case 5: PlayVoiceChat(VOICE_CHAT_THREATEN); break;
            case 6: PlayVoiceChat(VOICE_CHAT_TAUNT); break;
            case 7: PlayVoiceChat(VOICE_CHAT_ENEMIES); break;
            case 8: PlayVoiceChat(VOICE_CHAT_CHEER); break;
            case 9: PlayVoiceChat(VOICE_CHAT_FOLLOWME); break;
            case 10: PlayVoiceChat(VOICE_CHAT_LOOKHERE); break;
        }
    }
}

//For End of Combat Round
void DoCombatCry()
{
    if (GetHasEffect(EFFECT_TYPE_FRIGHTENED))
    {
        if (d100()<=CombatCryChance)
        {
            if (HasSpoken()) return;
            if ((GetRacialType(OBJECT_SELF) == RACIAL_TYPE_UNDEAD)&&(d100()<=CustomUndeadChance))
            switch (d6()) //Turned undead :)
            {
                case 1 : ActionSpeakString(COLOR_YELLOW+"It Burns! It Burns!",TALKVOLUME_TALK); break;
                case 2 : ActionSpeakString(COLOR_YELLOW+"Cursed Light!",TALKVOLUME_TALK); break;
                case 3 : ActionSpeakString(COLOR_YELLOW+"Your faith is weak, I can feel your fear...",TALKVOLUME_TALK); break;
                case 4 : ActionSpeakString(COLOR_YELLOW+"AAAIIIEEE!!!",TALKVOLUME_TALK); break;
                case 5 : ActionSpeakString(COLOR_YELLOW+"NOOO!!!",TALKVOLUME_TALK); break;
                case 6 : ActionSpeakString(COLOR_YELLOW+"It Burns!",TALKVOLUME_TALK); break;
            }
            else switch (d6())
            {
                case 1: PlayVoiceChat(VOICE_CHAT_FLEE); break;
                case 2: PlayVoiceChat(VOICE_CHAT_HELP); break;
                case 3: PlayVoiceChat(VOICE_CHAT_GUARDME); break;
                case 4: PlayVoiceChat(VOICE_CHAT_CUSS); break;
                case 5: PlayVoiceChat(VOICE_CHAT_BADIDEA); break;
                case 6: PlayVoiceChat(VOICE_CHAT_NEARDEATH); break;
            }
        }
    }
    else
    {
       if (d100()<=CombatCryChance)
       {
        if (HasSpoken()) return;
        if ((GetRacialType(OBJECT_SELF) == RACIAL_TYPE_UNDEAD)&&(d100()<=CustomUndeadChance))
        switch (d6())
        {
            DoUndeadChatter();
        }
        else switch (d6())
        {
            case 1: PlayVoiceChat(VOICE_CHAT_BATTLECRY1); break;
            case 2: PlayVoiceChat(VOICE_CHAT_BATTLECRY2); break;
            case 3: PlayVoiceChat(VOICE_CHAT_BATTLECRY3); break;
            case 4: PlayVoiceChat(VOICE_CHAT_LAUGH); break;
            case 5: PlayVoiceChat(VOICE_CHAT_TAUNT); break;
            case 6: PlayVoiceChat(VOICE_CHAT_THREATEN); break;
        }
        }
    }
}

//For Creature Death
void DoDeathCry()
{
    if (d100()<=DeathCryChance)
    {
        if (HasSpoken()) return;
        if ((GetRacialType(OBJECT_SELF) == RACIAL_TYPE_UNDEAD)&&(d100()<=CustomUndeadChance))
        switch (d6())
        {
            case 1 : ActionSpeakString(COLOR_RED+"Dead by dawn! Dead by dawn!",TALKVOLUME_TALK); break;
            case 2 : ActionSpeakString(COLOR_RED+"Death is only the beginning!",TALKVOLUME_TALK); break;
            case 3 : ActionSpeakString(COLOR_RED+"Darkness take me...",TALKVOLUME_TALK); break;
            case 4 : ActionSpeakString(COLOR_RED+"Free at last...",TALKVOLUME_TALK); break;
            case 5 : ActionSpeakString(COLOR_RED+"Time to die...",TALKVOLUME_TALK); break;
            case 6 : ActionSpeakString(COLOR_RED+"Thank you...",TALKVOLUME_TALK); break;
        }     // "No more tears..."
        else switch (d6())
        {
             case 1: PlayVoiceChat(VOICE_CHAT_CUSS); break;
             case 2: PlayVoiceChat(VOICE_CHAT_DEATH); break;
             case 3: PlayVoiceChat(VOICE_CHAT_NEARDEATH); break;
             case 4: PlayVoiceChat(VOICE_CHAT_GOODBYE); break;
             case 5: PlayVoiceChat(VOICE_CHAT_LAUGH); break;
             case 6: PlayVoiceChat(VOICE_CHAT_HEALME); break;
         }
    }
}
//void main (){}
