//:://////////////////////////////////////////////
//:: Spell selection conversation for the Jade Phoenix Mage's abilities
//:: tob_jpm_spellconv.nss
//:://////////////////////////////////////////////
/** @file
    Spell selection for Jade Phoenix Mage's abilities
    Handles the dynamic convo *and* the quickselects

    @author Stratovaris
    @date   Created  - yyyy.mm.dd
*/
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////

#include "prc_spell_const"
#include "inc_dynconv"
#include "inc_newspellbook"
////#include "prc_alterations"


#include "prc_inc_castlvl"
/* Constant defintions */
const int STAGE_ENTRY = 0;
const int STAGE_SLOT  = 1;
const int STAGE_LVL0  = 10;
const int STAGE_LVL9  = 20;

void PopulateList(object oPC, int nLevel, int iClass, int nChoice)
{
    if(!GetLocalInt(oPC, "DynConv_Waiting"))
        return;

    //SendMessageToPC(oPC, "*Tick* *" + IntToString(iClass) + "*");

    int nClass = GetClassByPosition(iClass);
    if(GetIsArcaneClass(nClass))
    {
        int i = 0, MaxValue = 0, nSpellID;
        if(nClass == CLASS_TYPE_WIZARD
		|| nClass == CLASS_TYPE_DEFILER
        || (nClass == CLASS_TYPE_SORCERER && GetPRCSwitch(PRC_SORC_DISALLOW_NEWSPELLBOOK)))
        {
            string sFile = "cls_spell_sorc";
            object oToken = GetObjectByTag("SpellLvl_9_Level_" + IntToString(nLevel));
            MaxValue = array_get_size(oToken, "Lkup");
            //DoDebug("JPM PopulateList: nClass = "+IntToString(nClass));
            //DoDebug("JPM PopulateList: nLevel = "+IntToString(nLevel));
            //DoDebug("JPM PopulateList: MaxValue = "+IntToString(MaxValue));
            while(i < MaxValue)
            {
                nSpellID = StringToInt(Get2DACache(sFile, "RealSpellID", array_get_int(oToken, "Lkup", i)));
                if(GetHasSpell(nSpellID, oPC))
                {
                    string sName = GetStringByStrRef(StringToInt(Get2DACache("spells", "Name", nSpellID)));
                    AddChoice(sName, nChoice, oPC);
                    SetLocalInt(oPC, "JPM_SPELL_CHOICE_" + IntToString(nChoice), nSpellID);
                    SetLocalInt(oPC, "JPM_REAL_SPELL_CHOICE_" + IntToString(nChoice), -1);
                    nChoice++;
                }
                i++;
            }
        }
        else if(nClass == CLASS_TYPE_BARD && GetPRCSwitch(PRC_BARD_DISALLOW_NEWSPELLBOOK))
        {
            string sFile = "cls_spell_bard";
            object oToken = GetObjectByTag("SpellLvl_1_Level_" + IntToString(nLevel));
            MaxValue = array_get_size(oToken, "Lkup");
            //DoDebug("JPM PopulateList: MaxValue = "+IntToString(MaxValue));
            while(i < MaxValue)
            {
                nSpellID = StringToInt(Get2DACache(sFile, "RealSpellID", array_get_int(oToken, "Lkup", i)));
                if(GetHasSpell(nSpellID, oPC))
                {
                    string sName = GetStringByStrRef(StringToInt(Get2DACache("spells", "Name", nSpellID)));
                    AddChoice(sName, nChoice, oPC);
                    SetLocalInt(oPC, "JPM_SPELL_CHOICE_" + IntToString(nChoice), nSpellID);
                    SetLocalInt(oPC, "JPM_REAL_SPELL_CHOICE_" + IntToString(nChoice), -1);
                    nChoice++;
                }
                i++;
            }
        }
        else
        {
            string sFile = GetFileForClass(nClass);
            string sArray = "NewSpellbookMem_" + IntToString(nClass);
            // if we ever add another arcane caster with prepared spellbook
            // uncomment all following lines
            //int nSpellbookType = GetSpellbookTypeForClass(nClass);
            //if(nSpellbookType == SPELLBOOK_TYPE_SPONTANEOUS)
            {
                int nCount = persistant_array_get_int(oPC, sArray, nLevel);
                //DoDebug("JPM PopulateList: nCount = "+IntToString(nCount));
                if(nCount)
                {
                    MaxValue = persistant_array_get_size(oPC, "Spellbook"+IntToString(nClass));
                    while(i < MaxValue)
                    {
                        int nNewSpellbookID = persistant_array_get_int(oPC, "Spellbook"+IntToString(nClass), i);
                        if(nLevel == StringToInt(Get2DACache(sFile, "Level", nNewSpellbookID))
                        && GetHasFeat(StringToInt(Get2DACache(sFile, "FeatID", nNewSpellbookID)), oPC))
                        {
                            int nRealSpell = StringToInt(Get2DACache(sFile, "SpellID", nNewSpellbookID));
                            string sName = GetStringByStrRef(StringToInt(Get2DACache("spells", "Name", nRealSpell)));
                            AddChoice(sName, nChoice, oPC);
                            SetLocalInt(oPC, "JPM_SPELL_CHOICE_" + IntToString(nChoice), nLevel);
                            SetLocalInt(oPC, "JPM_REAL_SPELL_CHOICE_" + IntToString(nChoice), nRealSpell);
                            SetLocalString(oPC, "JPM_CLASS_ARRAY_" + IntToString(nChoice), sArray);
                            nChoice++;
                        }
                        i++;
                    }
                }
            }
            /*else if(nSpellbookType == SPELLBOOK_TYPE_PREPARED)
            {
                string sArrayIDX = "SpellbookIDX" + IntToString(nLevel) + "_" + IntToString(nClass);
                MaxValue = persistant_array_get_size(oPC, sArrayIDX);
                while(i < MaxValue)
                {
                    int nNewSpellbookID = persistant_array_get_int(oPC, sArrayIDX, i);
                    int nCount = persistant_array_get_int(oPC, sArray, nNewSpellbookID);
                    if(nCount
                    && GetHasFeat(StringToInt(Get2DACache(sFile, "FeatID", nNewSpellbookID)), oPC))
                    {
                        int nRealSpell = StringToInt(Get2DACache(sFile, "RealSpellID", nNewSpellbookID));
                        string sName = GetStringByStrRef(StringToInt(Get2DACache("spells", "Name", nRealSpell)));
                        AddChoice(sName, nChoice, oPC);
                        SetLocalInt(oPC, "JPM_SPELL_CHOICE_" + IntToString(nChoice), nNewSpellbookID);
                        SetLocalInt(oPC, "JPM_REAL_SPELL_CHOICE_" + IntToString(nChoice), nRealSpell);
                        SetLocalString(oPC, "JPM_CLASS_ARRAY_" + IntToString(nChoice), sArray);
                        nChoice++;
                    }
                    i++;
                }
            }*/
        }
    }

    if(iClass == 3)
    {
        SetDefaultTokens();
        DeleteLocalInt(oPC, "DynConv_Waiting");
        FloatingTextStringOnCreature("*Done*", oPC, FALSE);
        return;
    }

    DelayCommand(0.01, PopulateList(oPC, nLevel, iClass + 1, nChoice));
}

void main()
{
    object oPC = GetPCSpeaker();
    int nValue = GetLocalInt(oPC, DYNCONV_VARIABLE);
    int nStage = GetStage(oPC);

    // Check which of the conversation scripts called the scripts
    if(nValue == 0) // All of them set the DynConv_Var to non-zero value, so something is wrong -> abort
        return;

    // Check if this stage is marked as already set up
    // This stops list duplication when scrolling
    //SendMessageToPC(OBJECT_SELF, "prc_jpm_spellconv:" + IntToString(nID) + " nVal:"+ IntToString(nValue));
    /* Get the value of the local variable set by the conversation script calling
     * this script. Values:
     * DYNCONV_ABORTED     Conversation aborted
     * DYNCONV_EXITED      Conversation exited via the exit node
     * DYNCONV_SETUP_STAGE System's reply turn
     * 0                   Error - something else called the script
     * Other               The user made a choice
     */
    // The stage is used to determine the active conversation node.
    // 0 is the entry node.


    if(nValue == DYNCONV_SETUP_STAGE)
    {
        // Check if this stage is marked as already set up
        // This stops list duplication when scrolling
        if(!GetIsStageSetUp(nStage, oPC))
        {
            // variable named nStage determines the current conversation node
            // Function SetHeader to set the text displayed to the PC
            // Function AddChoice to add a response option for the PC. The responses are show in order added
            if(nStage == STAGE_ENTRY)
            {
                SetHeader("Select Spell Level:");
                AddChoice(GetStringByStrRef(690),  1, oPC);//"Level 1"
                AddChoice(GetStringByStrRef(725),  2, oPC);//"Level 2"
                AddChoice(GetStringByStrRef(687),  3, oPC);//"Level 3"
                AddChoice(GetStringByStrRef(684),  4, oPC);//"Level 4"
                AddChoice(GetStringByStrRef(1026), 5, oPC);//"Level 5"
                AddChoice(GetStringByStrRef(1014), 6, oPC);//"Level 6"
                AddChoice(GetStringByStrRef(2214), 7, oPC);//"Level 7"
                AddChoice(GetStringByStrRef(2215), 8, oPC);//"Level 8"
                AddChoice(GetStringByStrRef(2216), 9, oPC);//"Level 9"
                MarkStageSetUp(nStage, oPC); // This prevents the setup being run for this stage again until MarkStageNotSetUp is called for it
                SetDefaultTokens(); // Set the next, previous, exit and wait tokens to default values
            }
            else if (nStage >= STAGE_LVL0 && nStage <= STAGE_LVL9)
            {
                // Set the header
                SetHeader("Select Spell:");
                int nLevel = nStage - STAGE_LVL0;
                SetLocalInt(oPC, "DynConv_Waiting", TRUE);

                PopulateList(oPC, nLevel, 1, 1);

                MarkStageSetUp(nStage, oPC);
            }
            else if (nStage = STAGE_SLOT)
            {
                SetHeader("Select QuickSlot:");
                AddChoice("Slot 1", 1, oPC);
                AddChoice("Slot 2", 2, oPC);
                AddChoice("Slot 3", 3, oPC);
                AddChoice("Slot 4", 4, oPC);
                MarkStageSetUp(nStage, oPC); // This prevents the setup being run for this stage again until MarkStageNotSetUp is called for it
                SetDefaultTokens(); // Set the next, previous, exit and wait tokens to default values
            }
        //add more stages for more nodes with Else If clauses
        }
        // Do token setup
        SetupTokens();
    }
    // End of conversation cleanup
    else if(nValue == DYNCONV_EXITED)
    {
        int nChoice = 1;
        while(GetLocalInt(oPC, "JPM_SPELL_CHOICE_" + IntToString(nChoice)))
        {
            DeleteLocalInt(oPC, "JPM_SPELL_CHOICE_" + IntToString(nChoice));
            DeleteLocalInt(oPC, "JPM_REAL_SPELL_CHOICE_" + IntToString(nChoice));
            DeleteLocalString(oPC, "JPM_CLASS_ARRAY_" + IntToString(nChoice));
            nChoice++;
        }
        DeleteLocalInt(oPC, "JPM_SPELL_ID");
        DeleteLocalInt(oPC, "JPM_REAL_SPELL_ID");
        DeleteLocalString(oPC, "JPM_CLASS_ARRAY_ID");
        DeleteLocalInt(oPC, "JPM_SPELL_LEVEL_CHOICE");
    }
    // Abort conversation cleanup.
    // NOTE: This section is only run when the conversation is aborted
    // while aborting is allowed. When it isn't, the dynconvo infrastructure
    // handles restoring the conversation in a transparent manner
    else if(nValue == DYNCONV_ABORTED)
    {
        int nChoice = 1;
        while (GetLocalInt(oPC, "JPM_SPELL_CHOICE_" + IntToString(nChoice)))
        {
            DeleteLocalInt(oPC, "JPM_SPELL_CHOICE_" + IntToString(nChoice));
            DeleteLocalInt(oPC, "JPM_REAL_SPELL_CHOICE_" + IntToString(nChoice));
            DeleteLocalString(oPC, "JPM_CLASS_ARRAY_" + IntToString(nChoice));
            nChoice++;
        }
        DeleteLocalInt(oPC, "JPM_SPELL_ID");
        DeleteLocalInt(oPC, "JPM_REAL_SPELL_ID");
        DeleteLocalString(oPC, "JPM_CLASS_ARRAY_ID");
        DeleteLocalInt(oPC, "JPM_SPELL_LEVEL_CHOICE");
    }
    // Handle PC responses
    else
    {
        // variable named nChoice is the value of the player's choice as stored when building the choice list
        // variable named nStage determines the current conversation node
        int nChoice = GetChoice(oPC);
        if(nStage == STAGE_ENTRY)
        {
            int nLevel = nChoice;
            SetLocalInt(oPC, "JPM_SPELL_LEVEL_CHOICE", nLevel);
            nStage = STAGE_LVL0 + nLevel;
            // Move to another stage based on response, for example
            //nStage = STAGE_QUUX;
        }
        else if (nStage >= STAGE_LVL0 && nStage <= STAGE_LVL9)
        {
            MarkStageNotSetUp(nStage, oPC);
            int nSpell = GetLocalInt(oPC, "JPM_SPELL_CHOICE_" + IntToString(nChoice));
            int nRealSpell = GetLocalInt(oPC, "JPM_REAL_SPELL_CHOICE_" + IntToString(nChoice));
            string sArray = GetLocalString(oPC, "JPM_CLASS_ARRAY_" + IntToString(nChoice));

            SetLocalInt(oPC, "JPM_SPELL_ID", nSpell);
            SetLocalInt(oPC, "JPM_REAL_SPELL_ID", nRealSpell);
            SetLocalString(oPC, "JPM_CLASS_ARRAY_ID", sArray);

            nStage = STAGE_SLOT;
        }
        else if (nStage = STAGE_SLOT)
        {
            int nSpell = GetLocalInt(oPC, "JPM_SPELL_ID");
            int nRealSpell = GetLocalInt(oPC, "JPM_REAL_SPELL_ID");
            string sArray = GetLocalString(oPC, "JPM_CLASS_ARRAY_ID");
            int nLevel = GetLocalInt(oPC, "JPM_SPELL_LEVEL_CHOICE");

            if(DEBUG) DoDebug("tob_jpm_spellconv: nSpell value = " + IntToString(nSpell));
            SetLocalInt(oPC, "JPM_SPELL_QUICK" + IntToString(nChoice), nSpell);
            SetLocalInt(oPC, "JPM_REAL_SPELL_QUICK" + IntToString(nChoice), nRealSpell);
            SetLocalString(oPC, "JPM_SPELL_QUICK" + IntToString(nChoice), sArray);
            SetLocalInt(oPC, "JPM_SPELL_QUICK" + IntToString(nChoice) + "LVL", nLevel);
            nStage = STAGE_ENTRY;
        }
        // Store the stage value. If it has been changed, this clears out the choices
        SetStage(nStage, oPC);
    }
}