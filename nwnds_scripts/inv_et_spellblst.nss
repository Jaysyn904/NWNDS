//:://////////////////////////////////////////////
//:: inv_et_spellblst.nss
//:://////////////////////////////////////////////
/** @file
    Spell selection for eldritch theurge's spellblast ability
    Handles the dynamic convo *and* the quickselects
*/
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////

#include "inv_invoc_const"
#include "inc_dynconv"
#include "inv_inc_invfunc"

/* Constant defintions */
const int STAGE_ENTRY = 0;
const int STAGE_SLOT  = 1;

/* Aid functions */

void PopulateList(object oPC, int nClass)
{
    string sFile = "et_spellblast";
    int MaxValue = StringToInt(Get2DACache(sFile, "Label", 0));

    int i = 1, nSpellID, nChoice = 1;
    if(nClass == CLASS_TYPE_WIZARD
	|| nClass == CLASS_TYPE_DEFILER
    || (nClass == CLASS_TYPE_SORCERER && GetPRCSwitch(PRC_SORC_DISALLOW_NEWSPELLBOOK))
    || (nClass == CLASS_TYPE_BARD && GetPRCSwitch(PRC_BARD_DISALLOW_NEWSPELLBOOK)))
    {
        while(i < MaxValue)
        {
            nSpellID = StringToInt(Get2DACache(sFile, "SpellID", i));
            if(GetHasSpell(nSpellID, oPC))
            {
                string sName = GetStringByStrRef(StringToInt(Get2DACache("spells", "Name", nSpellID)));
                AddChoice(sName, nChoice, oPC);
                SetLocalInt(oPC, "ET_SPELL_CHOICE_" + IntToString(nChoice), nSpellID);
                SetLocalInt(oPC, "ET_REAL_SPELL_CHOICE_" + IntToString(nChoice), -1);
                nChoice++;
            }
            i++;
        }
    }
    else
    {
        string sClassFile = GetSpellbookTypeForClass(nClass) == SPELLBOOK_TYPE_PREPARED ? "":
                            GetFileForClass(nClass);
        string sArray = "NewSpellbookMem_" + IntToString(nClass);
        int nSpellbookID, nLevel, nCount;
        while(i < MaxValue)
        {
            nSpellID = StringToInt(Get2DACache(sFile, "SpellID", i));
            nSpellbookID = RealSpellToSpellbookID(nClass, nSpellID);
DoDebug(Get2DACache(sFile, "Label", i)+" = "+IntToString(nSpellbookID));
            if(nSpellbookID != -1)
            {
            /*  // if we ever add another arcane caster with prepared spellbook
                // uncomment all following lines
                if(sClassFile == "")
                {
                    nCount = persistant_array_get_int(oPC, sArray, nSpellbookID);
                    if(nCount)
                    {
                        string sName = GetStringByStrRef(StringToInt(Get2DACache("spells", "Name", nSpellID)));
                        AddChoice(sName, nChoice, oPC);
                        SetLocalInt(oPC, "ET_SPELL_CHOICE_" + IntToString(nChoice), nSpellbookID);
                        SetLocalInt(oPC, "ET_REAL_SPELL_CHOICE_" + IntToString(nChoice), nSpellID);
                        SetLocalString(oPC, "ET_CLASS_ARRAY_" + IntToString(nChoice), sArray);
                        nChoice++;
                    }
                }
                else*/
                {
                    if(GetHasFeat(StringToInt(Get2DACache(sClassFile, "FeatID", nSpellbookID)), oPC))
                    {
                        nLevel = StringToInt(Get2DACache(sClassFile, "Level", nSpellbookID));
                        nCount = persistant_array_get_int(oPC, sArray, nLevel);
                        if(nCount)
                        {
                            string sName = GetStringByStrRef(StringToInt(Get2DACache("spells", "Name", nSpellID)));
                            AddChoice(sName, nChoice, oPC);
                            SetLocalInt(oPC, "ET_SPELL_CHOICE_" + IntToString(nChoice), nLevel);
                            SetLocalInt(oPC, "ET_REAL_SPELL_CHOICE_" + IntToString(nChoice), nSpellID);
                            SetLocalString(oPC, "ET_CLASS_ARRAY_" + IntToString(nChoice), sArray);
                            nChoice++;
                        }
                    }
                }
            }
            i++;
        }
    }

    SetDefaultTokens();
    DeleteLocalInt(oPC, "DynConv_Waiting");
    FloatingTextStringOnCreature("*Done*", oPC, FALSE);
}

void main()
{
    object oPC = OBJECT_SELF;
    int nID = GetSpellId();
    int nValue = GetLocalInt(GetPCSpeaker(), DYNCONV_VARIABLE);

    //SendMessageToPC(oPC, "inv_et_spellblst:" + IntToString(nID) + " nVal:"+ IntToString(nValue));
    if (nValue != 0) {
        // do conversation
        oPC = GetPCSpeaker();
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
        int nStage = GetStage(oPC);

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
                    // Set the header
                    SetHeader("Select Spell:");
                    SetLocalInt(oPC, "DynConv_Waiting", TRUE);

                    PopulateList(oPC, GetETArcaneClass(oPC));

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
        // Abort conversation cleanup.
        // NOTE: This section is only run when the conversation is aborted
        // while aborting is allowed. When it isn't, the dynconvo infrastructure
        // handles restoring the conversation in a transparent manner
        else if(nValue == DYNCONV_ABORTED
              || nValue == DYNCONV_EXITED)
        {
            int nChoice = 1;
            while(GetLocalInt(oPC, "ET_SPELL_CHOICE_" + IntToString(nChoice)))
            {
                DeleteLocalInt(oPC, "ET_SPELL_CHOICE_" + IntToString(nChoice));
                DeleteLocalInt(oPC, "ET_REAL_SPELL_CHOICE_" + IntToString(nChoice));
                DeleteLocalString(oPC, "ET_CLASS_ARRAY_" + IntToString(nChoice));
                nChoice++;
            }
            DeleteLocalInt(oPC, "ET_SPELL_ID");
            DeleteLocalInt(oPC, "ET_REAL_SPELL_ID");
            DeleteLocalString(oPC, "ET_CLASS_ARRAY_ID");
            DeleteLocalInt(oPC, "ET_SPELL_LEVEL_CHOICE");
        }
        // Handle PC responses
        else
        {
            // variable named nChoice is the value of the player's choice as stored when building the choice list
            // variable named nStage determines the current conversation node
            int nChoice = GetChoice(oPC);
            if(nStage == STAGE_ENTRY)
            {
                MarkStageNotSetUp(nStage, oPC);
                int nSpell = GetLocalInt(oPC, "ET_SPELL_CHOICE_" + IntToString(nChoice));
                int nRealSpell = GetLocalInt(oPC, "ET_REAL_SPELL_CHOICE_" + IntToString(nChoice));
                string sArray = GetLocalString(oPC, "ET_CLASS_ARRAY_" + IntToString(nChoice));

                SetLocalInt(oPC, "ET_SPELL_ID", nSpell);
                SetLocalInt(oPC, "ET_REAL_SPELL_ID", nRealSpell);
                SetLocalString(oPC, "ET_CLASS_ARRAY_ID", sArray);

                nStage = STAGE_SLOT;
            }
            else if (nStage = STAGE_SLOT)
            {
                MarkStageNotSetUp(nStage, oPC);
                int nSpell = GetLocalInt(oPC, "ET_SPELL_ID");
                int nRealSpell = GetLocalInt(oPC, "ET_REAL_SPELL_ID");
                string sArray = GetLocalString(oPC, "ET_CLASS_ARRAY_ID");
                int nLevel = GetLocalInt(oPC, "ET_SPELL_LEVEL_CHOICE");
                SetLocalInt(oPC, "ET_SPELL_QUICK" + IntToString(nChoice), nSpell);
                SetLocalInt(oPC, "ET_REAL_SPELL_QUICK" + IntToString(nChoice), nRealSpell);
                SetLocalString(oPC, "ET_SPELL_QUICK" + IntToString(nChoice), sArray);
                SetLocalInt(oPC, "ET_SPELL_QUICK" + IntToString(nChoice) + "LVL", nLevel);

                nStage = STAGE_ENTRY;
            }
            // Store the stage value. If it has been changed, this clears out the choices
            SetStage(nStage, oPC);
        }
    }
    else if(nID == INVOKE_SB_SPELL_SELECT_CONVO)
    {
        DelayCommand(0.5, StartDynamicConversation("inv_et_spellblst", oPC, DYNCONV_EXIT_ALLOWED_SHOW_CHOICE, TRUE, FALSE, oPC));
    }
    else
    {
        string sSlotNo;
        switch(nID)
        {
            case INVOKE_SB_SPELL_SELECT_QUICK1: sSlotNo = "1"; break;
            case INVOKE_SB_SPELL_SELECT_QUICK2: sSlotNo = "2"; break;
            case INVOKE_SB_SPELL_SELECT_QUICK3: sSlotNo = "3"; break;
            case INVOKE_SB_SPELL_SELECT_QUICK4: sSlotNo = "4"; break;
        }

        if(sSlotNo == "")
            return;

        int nSpell = GetLocalInt(oPC, "ET_SPELL_QUICK"+sSlotNo);
        int nLevel = GetLocalInt(oPC, "ET_SPELL_QUICK"+sSlotNo+"LVL");
        int nRealSpell = GetLocalInt(oPC, "ET_REAL_SPELL_QUICK"+sSlotNo);
        if(nRealSpell == -1) nRealSpell = nSpell;
        string sArray = GetLocalString(oPC, "ET_SPELL_QUICK"+sSlotNo);
        SetLocalInt(oPC, "ET_SPELL_CURRENT", (nSpell+1));
        SetLocalInt(oPC, "ET_SPELL_CURRENT_LVL", nLevel);
        SetLocalInt(oPC, "ET_REAL_SPELL_CURRENT", nRealSpell);
        SetLocalString(oPC, "ET_SPELL_CURRENT", sArray);
        int nUses = sArray == "" ? GetHasSpell(nSpell, oPC) : persistant_array_get_int(oPC, sArray, nSpell);
        FloatingTextStringOnCreature("*Spellblast: " + GetStringByStrRef(StringToInt(Get2DACache("spells", "Name", nRealSpell))) + "*", oPC, FALSE);
        FloatingTextStringOnCreature("*You have " + IntToString(nUses) + " uses left*", oPC, FALSE);
    }
}
