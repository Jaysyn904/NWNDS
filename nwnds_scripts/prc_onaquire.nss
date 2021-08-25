//::///////////////////////////////////////////////
//:: OnAcquireItem eventscript
//:: prc_onaquire
//:://////////////////////////////////////////////
#include "prc_alterations"
#include "prc_craft_inc"
//#include "psi_inc_manifest"

void AntiMagicFieldCheck(object oItem, object oCreature)
{
    int nIP = array_get_size(oItem, "PRC_NPF_ItemList");
    if(GetHasSpellEffect(SPELL_ANTIMAGIC_FIELD, oCreature)
    || GetHasSpellEffect(POWER_NULL_PSIONICS_FIELD, oCreature))
    {
        if(nIP)
            // itemproperty list already exists - do nothing
            return;

        //remove ips
        string sIP;
        int nIpCount;
        persistant_array_create(oCreature, "PRC_NPF_ItemList"); //stores object strings
        itemproperty ip = GetFirstItemProperty(oItem);
        while(GetIsItemPropertyValid(ip))
        {
            if(GetItemPropertyDurationType(ip) == DURATION_TYPE_PERMANENT)
            {   //only store the permanent ones as underscore delimited strings
                sIP = IntToString(GetItemPropertyType(ip)) + "_" +
                      IntToString(GetItemPropertySubType(ip)) + "_" +
                      IntToString(GetItemPropertyCostTableValue(ip)) + "_" +
                      IntToString(GetItemPropertyParam1Value(ip));
                if(DEBUG) DoDebug("StoreItemprops: " + GetName(oCreature) + ", " + ObjectToString(oItem) + ", " + sIP);
                array_set_string(oCreature, "PRC_NPF_ItemList", nIpCount++, sIP);
            }
            RemoveItemProperty(oItem, ip);
            ip = GetNextItemProperty(oItem);
        }
    }
    else
    {
        if(!nIP)
            // itemproperty list not found!
            return;

        //restore ips
        struct ipstruct iptemp;
        itemproperty ip;
        string sIP;
        int i;
        
        for(i = 0; i < nIP; i++)
        {
            sIP = array_get_string(oItem, "PRC_NPF_ItemList", i);
            iptemp = GetIpStructFromString(sIP);
            ip = ConstructIP(iptemp.type, iptemp.subtype, iptemp.costtablevalue, iptemp.param1value);
            IPSafeAddItemProperty(oItem, ip, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING);
            if(DEBUG) DoDebug("RetoreItemprops: " + GetName(GetItemPossessor(oItem)) + ", " + ObjectToString(oItem) + ", " + sIP);
        }
        array_delete(oItem, "PRC_NPF_ItemList");
    }
}

void UpdateIPs(object oItem)
{
    // Has lookup finished yet?
    if(GetXP(GetObjectByTag("Bioware2DACache")) & 0x01)
    {
        int bAddRestrictions = FALSE;
        int nSpellID;

        //Set the AMS version of last update
        SetLocalString(oItem, "sb_ver", AMS_VERSION);

        //remove all class restrictions and mark the spell
        itemproperty ipTest = GetFirstItemProperty(oItem);
        while(GetIsItemPropertyValid(ipTest))
        {
            if(GetItemPropertyType(ipTest) == ITEM_PROPERTY_USE_LIMITATION_CLASS)
            {
                //the scroll/wand had a use limitation
                RemoveItemProperty(oItem, ipTest);
                bAddRestrictions = TRUE;
            }
            else if(GetItemPropertyType(ipTest) == ITEM_PROPERTY_CAST_SPELL)
            {
                nSpellID = StringToInt(Get2DACache("iprp_spells", "SpellIndex", GetItemPropertySubType(ipTest)));
            }
            ipTest = GetNextItemProperty(oItem);
        }
        if(bAddRestrictions)
        {
            int i, nClass, bAdd;
            for(i = 0; i < 36; i++)
            {
                bAdd = FALSE;
                switch(i)
                {
                    case  0: nClass = CLASS_TYPE_BARD; break;
                    case  1: nClass = CLASS_TYPE_CLERIC; break;
                    case  2: nClass = CLASS_TYPE_DRUID; break;
                    case  3: nClass = CLASS_TYPE_PALADIN; break;
                    case  4: nClass = CLASS_TYPE_RANGER; break;
                    case  5: nClass = CLASS_TYPE_SORCERER; break;
                    case  6: nClass = CLASS_TYPE_WIZARD; break;
                    case  7: nClass = CLASS_TYPE_HARPER; break;
                    case  8: nClass = CLASS_TYPE_ASSASSIN; break;
                    case  9: nClass = CLASS_TYPE_BLACKGUARD; break;
                    case 10: nClass = CLASS_TYPE_OCULAR; break;
                    case 11: nClass = CLASS_TYPE_HEXBLADE; break;
                    case 12: nClass = CLASS_TYPE_DUSKBLADE; break;
                    case 13: nClass = CLASS_TYPE_HEALER; break;
                    case 14: nClass = CLASS_TYPE_BEGUILER; break;
                    case 15: nClass = CLASS_TYPE_KNIGHT_CHALICE; break;
                    case 16: nClass = CLASS_TYPE_VIGILANT; break;
                    case 17: nClass = CLASS_TYPE_VASSAL; break;
                    case 18: nClass = CLASS_TYPE_SUBLIME_CHORD; break;
                    case 19: nClass = CLASS_TYPE_ANTI_PALADIN; break;
                    case 20: nClass = CLASS_TYPE_SOLDIER_OF_LIGHT; break;
                    case 21: nClass = CLASS_TYPE_SHADOWLORD; break;
                    case 22: nClass = CLASS_TYPE_JUSTICEWW; break;
                    case 23: nClass = CLASS_TYPE_KNIGHT_MIDDLECIRCLE; break;
                    case 24: nClass = CLASS_TYPE_DREAD_NECROMANCER; break;
                    case 25: nClass = CLASS_TYPE_MYSTIC; break;
                    case 26: nClass = CLASS_TYPE_ARCHIVIST; break;
                    case 27: nClass = CLASS_TYPE_WITCH; break;
                    case 28: nClass = CLASS_TYPE_SHAMAN; break;
                    case 29: nClass = CLASS_TYPE_SLAYER_OF_DOMIEL; break;
                    case 30: nClass = CLASS_TYPE_SUEL_ARCHANAMACH; break;
                    case 31: nClass = CLASS_TYPE_FAVOURED_SOUL; break;
                    case 32: nClass = CLASS_TYPE_SHUGENJA; break;
                    case 33: nClass = CLASS_TYPE_SOHEI; break;
                    case 34: nClass = CLASS_TYPE_WARMAGE; break;
                    case 35: nClass = CLASS_TYPE_TEMPLAR; break;
					case 36: nClass = CLASS_TYPE_DEFILER; break;
                }

                if(nClass == CLASS_TYPE_DRUID)
                    bAdd = Get2DACache("Spells", "Druid", nSpellID) == "" ? FALSE : TRUE;
                else if(nClass == CLASS_TYPE_PALADIN)
                    bAdd = Get2DACache("Spells", "Paladin", nSpellID) == "" ? FALSE : TRUE;
                else if(nClass == CLASS_TYPE_RANGER)
                    bAdd = Get2DACache("Spells", "Ranger", nSpellID) == "" ? FALSE : TRUE;
                else if(nClass == CLASS_TYPE_WIZARD || nClass == CLASS_TYPE_SORCERER || nClass == CLASS_TYPE_DEFILER)
                    bAdd = RealSpellToSpellbookID(CLASS_TYPE_SORCERER, nSpellID) == -1 ? FALSE : TRUE;
                else if(nClass == CLASS_TYPE_CLERIC)
                    bAdd = RealSpellToSpellbookID(CLASS_TYPE_MYSTIC, nSpellID) == -1 ? FALSE : TRUE;
                else
                    bAdd = RealSpellToSpellbookID(nClass, nSpellID) == -1 ? FALSE : TRUE;

                if(bAdd)
                    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyLimitUseByClass(nClass), oItem);
            }
        }
    }
    else // Nope, try again later
    {
        DelayCommand(0.2f, UpdateIPs(oItem));
    }
}

void main()
{
    // Find out the relevant objects
    object oCreature = GetModuleItemAcquiredBy();
    object oItem     = GetModuleItemAcquired();
    string sTag = GetTag(oItem);

    // Do not run for some of the PRC special items
    if(sTag == "PRC_MANIFTOKEN"
    || sTag == "HideToken"
    || GetResRef(oItem) == "base_prc_skin")
        return;

    //if(DEBUG) DoDebug("Running OnAcquireItem, creature = '" + GetName(oCreature) + "' is PC: " + DebugBool2String(GetIsPC(oCreature)) + "; Item = '" + GetName(oItem) + "' - '" + GetTag(oItem) + "'");

    AntiMagicFieldCheck(oItem, oCreature);

    int nItemType = GetBaseItemType(oItem);

    //fix for all-beige 1.67 -> 1.68 cloaks
    //gives them a random color
    if(nItemType == BASE_ITEM_CLOAK)
    {
        if(!GetPRCSwitch(PRC_DYNAMIC_CLOAK_AUTOCOLOUR_DISABLE) && !GetLocalInt(oItem, "CloakDone"))
        {
            //&& GetItemAppearance(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0) == 1
            if(GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_CLOTH1) == 0
            && GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_CLOTH2) == 0
            && GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER1) == 0
            && GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER2) == 0
            && GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL1) == 0
            && GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL2) == 0)
            {
                //pre-1.68 boring bland cloak, colorise it :)
                //move it to temporary storage first
                object oChest = GetObjectByTag("HEARTOFCHAOS");
                DestroyObject(oItem);
                oItem = CopyItem(oItem, oChest, TRUE);
                //set appearance
                //doesnt work yet should do for 1.69
                //DestroyObject(oItem);
                //oItem = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, Random(14)+1, TRUE);
                //set colors
                DestroyObject(oItem);
                oItem = CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_CLOTH1, Random(176), TRUE);
                DestroyObject(oItem);
                oItem = CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_CLOTH2, Random(176), TRUE);
                DestroyObject(oItem);
                oItem = CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER1, Random(176), TRUE);
                DestroyObject(oItem);
                oItem = CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER2, Random(176), TRUE);
                DestroyObject(oItem);
                oItem = CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL1, Random(176), TRUE);
                DestroyObject(oItem);
                oItem = CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL2, Random(176), TRUE);
                //move it back
                DestroyObject(oItem);
                oItem = CopyItem(oItem, oCreature, TRUE);
                //mark it as set just to be sure
                SetLocalInt(oItem, "CloakDone", TRUE);
            }
        }
    }

    // This is a resource hog. To work around, we assume that it's not going to cause noticeable issues if
    // racial restrictions are only ever expanded when a PC is involved
    if(GetIsPC(oCreature) || GetIsPC(GetMaster(oCreature)) || GetPRCSwitch(PRC_NPC_FORCE_RACE_ACQUIRE))
        ExecuteScript("race_ev_aquire", OBJECT_SELF);

    // Creatures not related to PCs skip this block, contents are irrelevant for them
    if(GetIsPC(oCreature) || GetIsPC(GetMaster(oCreature)))
    {
        if(GetPRCSwitch(PRC_AUTO_IDENTIFY_ON_ACQUIRE))
        {
            if(!GetIdentified(oItem))
            {
                int nLore = GetSkillRank(SKILL_LORE, oCreature);
                int nMax = StringToInt(Get2DACache("SkillVsItemCost", "DeviceCostMax", nLore));
                if(nMax == 0)
                    nMax = 120000000;
                // Check for the value of the item first.
                SetIdentified(oItem, TRUE);
                int nGP = GetGoldPieceValue(oItem);
                // If oPC has enough Lore skill to ID the item, then do so.
                if(nMax >= nGP)
                {
                    string sName = GetName(oItem);
                    if(sName != "")
                        SendMessageToPC(oCreature, GetStringByStrRef(16826224) + " " + sName + " " + GetStringByStrRef(16826225));
                }
                else
                    SetIdentified(oItem, FALSE);
            }
        }

        if(nItemType == BASE_ITEM_MAGICWAND
        || nItemType == BASE_ITEM_ENCHANTED_WAND
        || nItemType == BASE_ITEM_SCROLL
        || nItemType == BASE_ITEM_SPELLSCROLL
        || nItemType == BASE_ITEM_ENCHANTED_SCROLL)
        {
            if(!GetPRCSwitch(PRC_SCROLL_AUTOUPDATE_RESTR_DISABLE)
            && GetLocalString(oItem, "sb_ver") != AMS_VERSION //different Alternate Magic System versions - update IPs
            && !GetLocalInt(oItem, "ip_lock")) //IPs of wand/scroll were locked in toolset or by script
            {
                DelayCommand(1.0f, UpdateIPs(oItem));//delayed to reduce lag and prevent TMIs
            }
        }

        //rest kits
        if(GetPRCSwitch(PRC_SUPPLY_BASED_REST))
            ExecuteScript("sbr_onaquire", OBJECT_SELF);

        //PRC Companion
        //DOA visible dyepot items
        /*if(GetPRCSwitch(MARKER_PRC_COMPANION))
        {
            if(GetBaseItemType(oItem) == BASE_ITEM_MISCSMALL)
            {
                //x2_it_dyec23
                string sTag = GetTag(oItem);
                if(GetStringLeft(sTag, 9) == "x2_it_dye")
                {
                    //get the color
                    //taken from x2_s3_dyearmour
                    // GZ@2006/03/26: Added new color palette support. Note: Will only work
                    //                if craig updates the in engine functions as well.
                    int nColor     =  0;
                    // See if we find a valid int between 0 and 127 in the last three letters
                    // of the tag, use it as color
                    int nTest      =  StringToInt(GetStringRight(sTag,3));
                    if (nTest > 0 &&
                        nTest < 175 )//magic number, bad!
                        nColor = nTest;
                    else //otherwise, use last two letters, as per legacy HotU
                        nColor = StringToInt(GetStringRight(sTag,2));

                    //use limbo for crafting in
                    object oLimbo = GetObjectByTag("HEARTOFCHAOS");
                    //create the new one with the same tag as the old
                    object oDye = CreateItemOnObject("prccompdye", oLimbo, 1, sTag);
                    //ensure old one is cleaned up
                    DestroyObject(oItem);
                    //if its a metalic dye, modify it to use model 2
                    if(GetStringRight(GetStringLeft(sTag, 10), 1) == "m")
                    {
                        DestroyObject(oDye);
                        oDye = CopyItemAndModify(oDye, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, 2);
                        //metal dye color
                        DestroyObject(oDye);
                        oDye = CopyItemAndModify(oDye, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL1, nColor);
                    }
                    else
                    {
                        //standard dye
                        DestroyObject(oDye);
                        //cloth and leather use same palettee
                        oDye = CopyItemAndModify(oDye, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER1, nColor);
                    }
                    //copy the itemprops to cast the dye "spell"
                    itemproperty ipTest = GetFirstItemProperty(oItem);
                    while(GetIsItemPropertyValid(ipTest))
                    {
                        AddItemProperty(DURATION_TYPE_PERMANENT, ipTest, oDye);
                        ipTest = GetNextItemProperty(oItem);
                    }
                    //move it back to the player
                    CopyItem(oDye, oCreature);
                    DestroyObject(oDye);
                }
            }
        }*/
    }// end if - PC or associate of PC

    // Execute scripts hooked to this event for the creature and item triggering it
    ExecuteAllScriptsHookedToEvent(oCreature, EVENT_ONACQUIREITEM);
    ExecuteAllScriptsHookedToEvent(oItem, EVENT_ITEM_ONACQUIREITEM);

    // Tag-based scripting hook for PRC items
    SetUserDefinedItemEventNumber(X2_ITEM_EVENT_ACQUIRE);
    ExecuteScript("is_"+sTag, OBJECT_SELF);
}