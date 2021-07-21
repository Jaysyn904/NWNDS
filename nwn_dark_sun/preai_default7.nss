//:://////////////////////////////////////////////////
//:: NW_C2_DEFAULT7
/*
  Default OnDeath event handler for NPCs.

  Adjusts killer's alignment if appropriate and
  alerts allies to our death.
 */
//:://////////////////////////////////////////////////
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/22/2002
//:://////////////////////////////////////////////////
#include "x0_i0_spawncond"
#include "ar_db_main"

void ClearSlot(int iSlotID);
void PartyGold(object oPC);

void main()
{
    // added to index the creature death
    object oKiller = GetLastKiller();
    object oDead = OBJECT_SELF;
    SetLocalInt(oKiller,"ARSX_LAST_CR_KILL",ARSX_LogKill(OBJECT_SELF,oKiller));
    //end indexing

    if ((d100() > 99) && (GetAbilityScore(OBJECT_SELF, ABILITY_INTELLIGENCE) > 10))
    {
        string sMsg;
        switch (d20())
        {
            case 1:     sMsg = "I see dead people..."; break;
            case 2:     sMsg = "For the first time in my life I feel...cold..."; break;
            case 3:     sMsg = "Water..."; break;
            case 4:     sMsg = "Dont let them bury me. I'm not dead!"; break;
            case 5:     sMsg = "I surrender!"; break;
            case 6:     sMsg = "No, it cant be!"; break;
            case 7:     sMsg = "Tell my children I love them..."; break;
            case 8:     sMsg = "I curse your soul!"; break;
            case 9:     sMsg = "I shall return!"; break;
            case 10:    sMsg = "Oh tell me God, must I damn my brother to love you?"; break;
            case 11:    sMsg = "I've had worse."; break;
            case 12:    sMsg = "But... I am invincible!"; break;
            case 13:    sMsg = "It's so dark."; break;
            case 14:    sMsg = "Help."; break;
            case 15:    sMsg = "Mommy."; break;
            case 16:    sMsg = "Avenge me!"; break;
            case 17:    {
                            sMsg = "My ghost will haunt you!";
                            CreateObject(OBJECT_TYPE_CREATURE, "shfiend001", GetLocation(OBJECT_SELF));
                        }
                        break;
            case 18:    sMsg = "Doh!"; break;
            case 19:    sMsg = "Wait, I lagged!"; break;
            case 20:    sMsg = "Medic!"; break;
        }
        SpeakString(sMsg, TALKVOLUME_TALK);
    }

    int iSlotID;
    for (iSlotID = 0; iSlotID < NUM_INVENTORY_SLOTS; iSlotID++)
    {
        ClearSlot(iSlotID);
    }
    // Destroy all inventory items
    object oItem = GetFirstItemInInventory();
    while (GetIsObjectValid(oItem))
    {
        if(!GetDroppableFlag(oItem))
            DestroyObject(oItem);
        oItem = GetNextItemInInventory();
    }

    //Get the object that killed the monster
    object oPC = GetLastKiller();
    //Get the master of the object, if it was a pet
    if(GetIsPC(GetMaster(oPC)))
        oPC = GetMaster(oPC);

    //Determine how much gold and experience is awarded.
    PartyGold(oPC);

    //Check to see if this was a kill task monster
    if((GetTag(OBJECT_SELF) == GetLocalString(oPC, "KILL_TASK_TARGET")) && (GetLocalInt(oPC, "KILL_TASK_FLAG") == 1))
    {
        //Set the kill task variable to complete
        SetLocalInt(oPC, "KILL_TASK_FLAG", 2);
        //Set the journal to complete
        AddJournalQuestEntry("kt_journal_01", 99, oPC);
    }

    int nClass = GetLevelByClass(CLASS_TYPE_COMMONER);
    int nAlign = GetAlignmentGoodEvil(OBJECT_SELF);

    // If we're a good/neutral commoner,
    // adjust the killer's alignment evil
    if(nClass > 0 && (nAlign == ALIGNMENT_GOOD || nAlign == ALIGNMENT_NEUTRAL))
    {
        object oKiller = GetLastKiller();
        AdjustAlignment(oKiller, ALIGNMENT_EVIL, 5);
    }

    // Call to allies to let them know we're dead
    SpeakString("NW_I_AM_DEAD", TALKVOLUME_SILENT_TALK);

    //Shout Attack my target, only works with the On Spawn In setup
    SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);

    // NOTE: the OnDeath user-defined event does not
    // trigger reliably and should probably be removed
    if(GetSpawnInCondition(NW_FLAG_DEATH_EVENT))
    {
         SignalEvent(OBJECT_SELF, EventUserDefined(1007));
    }
}

void ClearSlot(int iSlotID)
{
    object oItem = GetItemInSlot(iSlotID);
    if(GetIsObjectValid(oItem))
    {
        if(!GetDroppableFlag(oItem))
            DestroyObject(oItem);
    }
}

void PartyGold(object oPC)
{
    //Get the area the kill was made in
    object oArea = GetArea(OBJECT_SELF);
    //Initialize the amount of players in a party
    int nMembers = 0;
    //Determine how many members of the party are in that area
    object oPartyMember = GetFirstFactionMember(oPC);
    if(GetIsObjectValid(oPartyMember))
    {
        while(GetIsObjectValid(oPartyMember))
        {
            if((GetArea(oPartyMember) == oArea) && (GetIsPC(oPartyMember)))
                nMembers++;
            oPartyMember = GetNextFactionMember(oPC);
        }

        //Get the hit dice of the monster
        int nMRating = GetHitDice(OBJECT_SELF);
        //Get the hit dice of the killer
        int nPRating = GetHitDice(oPC);
        if(nPRating == 0)
        {
            nMRating = 0;
            nPRating = 1;
        }

        //Get an amount of gold in relation to the challenge rating of the monster
        int nGold = d4(nMRating);
        //These monster types don't have gold
        if(GetRacialType(OBJECT_SELF) ==  RACIAL_TYPE_ANIMAL ||
           GetRacialType(OBJECT_SELF) ==  RACIAL_TYPE_BEAST ||
           GetRacialType(OBJECT_SELF) ==  RACIAL_TYPE_CONSTRUCT ||
           GetRacialType(OBJECT_SELF) ==  RACIAL_TYPE_ELEMENTAL ||
           GetRacialType(OBJECT_SELF) ==  RACIAL_TYPE_ABERRATION ||
           GetRacialType(OBJECT_SELF) ==  RACIAL_TYPE_MAGICAL_BEAST ||
           GetRacialType(OBJECT_SELF) ==  RACIAL_TYPE_OUTSIDER ||
           GetRacialType(OBJECT_SELF) ==  RACIAL_TYPE_UNDEAD ||
           GetRacialType(OBJECT_SELF) ==  RACIAL_TYPE_VERMIN)
        {
            nGold = 0;
        }
        else
        {
            //Split the gold among the party members in the area
            nGold /= nMembers;
        }

        //Initialize a default amount of experience
        int nXP = (100 + (nMRating * 5));
        if((nMRating - nPRating) < -6)
        {
            nXP = 0;
        }

        //Modify the experience
        nXP = ((nXP * nMRating) / nPRating);

        //Start exp loop
        oPartyMember = GetFirstFactionMember(oPC);
        if(GetIsObjectValid(oPartyMember))
        {
            //Initialize a variable for the loop to determine the party members challenge rating
            int nPartyRating;
            int nXPTemp = 0;
            //Loop baby
            while (GetIsObjectValid(oPartyMember))
            {
                if((GetArea(oPartyMember) == oArea) && (GetIsPC(oPartyMember)))
                {
                    if(nGold > 0)
                        GiveGoldToCreature(oPartyMember, nGold);

                    nPartyRating = GetHitDice(oPartyMember);
                    if(nPRating >= nPartyRating)
                    {
                        if((nPRating - nPartyRating) > 6)
                            nXPTemp = 0;
                        else
                            nXPTemp = ((nXP * nPartyRating) / nPRating);
                    }
                    else
                    {
                        if((nPartyRating - nPRating) > 6)
                            nXPTemp = 0;
                        else
                        {
                            if(nPartyRating == 0)
                            {
                                nPartyRating = 0;
                                nXP = 0;
                            }
                            nXPTemp = ((nXP * nPRating) / nPartyRating);
                        }
                    }
                    if((nMRating - nPartyRating) < -6)
                    {
                        nXPTemp = 0;
                    }
                    if(nXPTemp > 0)
                        GiveXPToCreature(oPartyMember, nXPTemp);
                }
                oPartyMember = GetNextFactionMember(oPC);
            }
        }
    }
}
