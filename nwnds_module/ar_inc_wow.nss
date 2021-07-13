// If you want NPCs to lose the temporary item properties also change this to TRUE
const int DISPEL_NPCS_ALSO = FALSE;

// Used to help check the clerics domains
const int AIR = 1;
const int EARTH = 2;
const int FIRE = 4;
const int WATER = 8;

// Returns TRUE if the cleric should only pull down one (or more) specific elementals
int CheckClericSummon(int nSpellID);

// The effect for the cleric summoning the elementals
effect ClericSummon(int nSpellID);

// The resref of the elemental to summon
string ClericCreature(int nDomains, int nSpellID);

// This will scan the items of the PC entering the module for properties not
// allowed and for duplicate items.  This is called in the OnClientEnter script.
// Change nEnter to TRUE for entering scripts, otherwise this will be called in
// spell scripts with FALSE and it will not check for duplicate items then.
void ScanItems(object oPC, int nEnter = FALSE);

// This checks to see if the item is a crafting duplicate or not.
int CheckForDupe(object oItem);

// This checks the item for properties to strip.
void CheckProperties(object oItem);




// This will scan the items of the PC entering the module for properties not
// allowed and for duplicate items.  This is called in the OnClientEnter script.
// Change nEnter to TRUE for entering scripts, otherwise this will be called in
// spell scripts with FALSE and it will not check for duplicate items then.
void ScanItems(object oPC, int nEnter = FALSE)
{
    if(GetIsDM(oPC) || (!GetIsPC(oPC) && DISPEL_NPCS_ALSO == FALSE)) return;

    object oItem;
    int nNth;

    if(nEnter)
    {

        for(nNth = 0; nNth <= 13; nNth++)
        {
            oItem = GetItemInSlot(nNth, oPC);
            if(CheckForDupe(oItem))
            {
                // This message will be sent to the player
                SendMessageToPC(oPC, "You have been found with a duplicate item.  It will be removed.");
                DestroyObject(oItem, 0.1);
                // This message will be sent to all DMS
                SendMessageToAllDMs(GetName(oPC)+" has been found with a duplicate item, it has been destroyed.");
                // This will log the message
                WriteTimestampedLogEntry(GetName(oPC)+" has been found with a duplicate item, "+GetName(oItem)+", and it was destroyed.");
            }
            else
            {
                CheckProperties(oItem);
            }
        }
        oItem = GetFirstItemInInventory(oPC);
        while(GetIsObjectValid(oItem))
        {
            if(CheckForDupe(oItem))
            {
                // This message will be sent to the player
                SendMessageToPC(oPC, "You have been found with a duplicate item.  It will be removed.");
                DestroyObject(oItem, 0.1);
                // This message will be sent to all DMS
                SendMessageToAllDMs(GetName(oPC)+" has been found with a duplicate item, it has been destroyed.");
                // This will log the message
                WriteTimestampedLogEntry(GetName(oPC)+" has been found with a duplicate item, "+GetName(oItem)+", and it was destroyed.");
            }
            else
            {
                CheckProperties(oItem);
            }
            oItem = GetNextItemInInventory(oPC);
        }
    }
    else
    {
        for(nNth = 0; nNth <= 13; nNth++)
        {
            oItem = GetItemInSlot(nNth, oPC);
            if(GetIsObjectValid(oItem)) CheckProperties(oItem);
        }
        oItem = GetFirstItemInInventory(oPC);
        while(GetIsObjectValid(oItem))
        {
            CheckProperties(oItem);
            oItem = GetNextItemInInventory(oPC);
        }
    }
}

// This checks to see if the item is a crafting duplicate or not.
int CheckForDupe(object oItem)
{
    return GetLocalInt(oItem, "ZEP_CR_TEMPITEM");
}

// This checks the item for properties to strip.
void CheckProperties(object oItem)
{
    itemproperty  ipIP = GetFirstItemProperty(oItem);
    int nDuration;

    while(GetIsItemPropertyValid(ipIP))
    {
        nDuration = GetItemPropertyDurationType(ipIP);

        if(nDuration == DURATION_TYPE_TEMPORARY)
        {
            RemoveItemProperty(oItem, ipIP);
        }
        ipIP = GetNextItemProperty(oItem);
    }
}

string ClericCreature(int nDomains, int nSpellID)
{
    string sReturn;
    int nCount;
    if(nDomains & AIR)
    {
        nCount++;
    }
    if(nDomains & EARTH)
    {
        nCount++;
    }
    if(nDomains & FIRE)
    {
        nCount++;
    }
    if(nDomains & WATER)
    {
        nCount++;
    }

    int nRoll = Random(nCount) + 1;

    switch(nRoll)
    {
        case 1:
        {
            if(nDomains & AIR)
            {
                if(nSpellID == SPELL_SUMMON_CREATURE_VII) sReturn = "NW_S_AIRHUGE";
                else if(nSpellID == SPELL_SUMMON_CREATURE_VIII) sReturn = "NW_S_AIRGREAT";
                else sReturn = "NW_S_AIRELDER";
            }
            else if(nDomains & EARTH)
            {
                if(nSpellID == SPELL_SUMMON_CREATURE_VII) sReturn = "NW_S_EARTHHUGE";
                else if(nSpellID == SPELL_SUMMON_CREATURE_VIII) sReturn = "NW_S_EARTHGREAT";
                else sReturn = "NW_S_EARTHELDER";
            }
            else if(nDomains & FIRE)
            {
                if(nSpellID == SPELL_SUMMON_CREATURE_VII) sReturn = "NW_S_FIREHUGE";
                else if(nSpellID == SPELL_SUMMON_CREATURE_VIII) sReturn = "NW_S_FIREGREAT";
                else sReturn = "NW_S_FIREELDER";
            }
            else
            {
                if(nSpellID == SPELL_SUMMON_CREATURE_VII) sReturn = "NW_S_WATERHUGE";
                else if(nSpellID == SPELL_SUMMON_CREATURE_VIII) sReturn = "NW_S_WATERGREAT";
                else sReturn = "NW_S_WATERELDER";
            }
            break;
        }
        case 2:
        {
            if(nDomains & EARTH)
            {
                if(nSpellID == SPELL_SUMMON_CREATURE_VII) sReturn = "NW_S_EARTHHUGE";
                else if(nSpellID == SPELL_SUMMON_CREATURE_VIII) sReturn = "NW_S_EARTHGREAT";
                else sReturn = "NW_S_EARTHELDER";
            }
            else if(nDomains & FIRE)
            {
                if(nSpellID == SPELL_SUMMON_CREATURE_VII) sReturn = "NW_S_FIREHUGE";
                else if(nSpellID == SPELL_SUMMON_CREATURE_VIII) sReturn = "NW_S_FIREGREAT";
                else sReturn = "NW_S_FIREELDER";
            }
            else
            {
                if(nSpellID == SPELL_SUMMON_CREATURE_VII) sReturn = "NW_S_WATERHUGE";
                else if(nSpellID == SPELL_SUMMON_CREATURE_VIII) sReturn = "NW_S_WATERGREAT";
                else sReturn = "NW_S_WATERELDER";
            }
            break;
        }
        case 3:
        {
            if(nDomains & FIRE)
            {
                if(nSpellID == SPELL_SUMMON_CREATURE_VII) sReturn = "NW_S_FIREHUGE";
                else if(nSpellID == SPELL_SUMMON_CREATURE_VIII) sReturn = "NW_S_FIREGREAT";
                else sReturn = "NW_S_FIREELDER";
            }
            else
            {
                if(nSpellID == SPELL_SUMMON_CREATURE_VII) sReturn = "NW_S_WATERHUGE";
                else if(nSpellID == SPELL_SUMMON_CREATURE_VIII) sReturn = "NW_S_WATERGREAT";
                else sReturn = "NW_S_WATERELDER";
            }
            break;
        }
        case 4:
        {
            if(nSpellID == SPELL_SUMMON_CREATURE_VII) sReturn = "NW_S_WATERHUGE";
            else if(nSpellID == SPELL_SUMMON_CREATURE_VIII) sReturn = "NW_S_WATERGREAT";
            else sReturn = "NW_S_WATERELDER";
        }
        break;
    }
    return sReturn;
}

int CheckClericSummon(int nSpellID)
{
    int nReturn = FALSE;
    if(GetLevelByClass(CLASS_TYPE_CLERIC) > 0 && (nSpellID == SPELL_SUMMON_CREATURE_VII || nSpellID == SPELL_SUMMON_CREATURE_VIII || nSpellID == SPELL_SUMMON_CREATURE_IX) && (GetHasFeat(FEAT_AIR_DOMAIN_POWER) || GetHasFeat(FEAT_EARTH_DOMAIN_POWER) || GetHasFeat(FEAT_FIRE_DOMAIN_POWER) || GetHasFeat(FEAT_WATER_DOMAIN_POWER))) nReturn = TRUE;
    return nReturn;
}

effect ClericSummon(int nSpellID)
{
    int nPowers;
    int nCount;
    string sSummon;

    if(GetHasFeat(FEAT_AIR_DOMAIN_POWER))
    {
        nPowers |= AIR;
    }
    if(GetHasFeat(FEAT_EARTH_DOMAIN_POWER))
    {
        nPowers |= EARTH;
    }
    if(GetHasFeat(FEAT_FIRE_DOMAIN_POWER))
    {
        nPowers |= FIRE;
    }
    if(GetHasFeat(FEAT_WATER_DOMAIN_POWER))
    {
        nPowers |= WATER;
    }

    sSummon = ClericCreature(nPowers, nSpellID);
    effect eSummonedMonster = EffectSummonCreature(sSummon, VFX_FNF_SUMMON_MONSTER_3);
    return eSummonedMonster;
}

//void main () {}










