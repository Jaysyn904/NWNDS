//::///////////////////////////////////////////////
//:: Script for nwnx_funcs plugin
//:: prc_nwnx_funcs.nss
//:://////////////////////////////////////////////
//:: This script is executed only if PRC code detects
//:: nwnx_funcs plugin.
//::
//:: It will apply permanent stat modifications
//:: for PRC classes.
//:://////////////////////////////////////////////
//:: Created By: xwarren
//:: Created On: 12/05/2010
//:://////////////////////////////////////////////

#include "prc_inc_template"
#include "inc_nwnx_funcs"

void main()
{
    object oPC = OBJECT_SELF;
    int nBonus, nClassLvl, iTest, nDiff;

    //Warchief
    nClassLvl = GetLevelByClass(CLASS_TYPE_WARCHIEF, oPC);
    iTest = GetPersistantLocalInt(oPC, "NWNX_WarchiefCha");
    if(nClassLvl || iTest)
    {
        if     (nClassLvl > 1 && nClassLvl < 6) nBonus = 2;
        else if(nClassLvl > 5 && nClassLvl < 10) nBonus = 4;
        else if(nClassLvl > 9) nBonus = 6;

        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_WarchiefCha", nBonus);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_CHARISMA, nDiff);
        }
    }

    //Mighty Contender of Kord
    nClassLvl = GetLevelByClass(CLASS_TYPE_MIGHTY_CONTENDER_KORD, oPC);
    iTest = GetPersistantLocalInt(oPC, "NWNX_MightyContenderStr");
    if(nClassLvl || iTest)
    {
        nBonus = 0;
        if (nClassLvl >= 9) nBonus = 2;
        else if (nClassLvl >= 5) nBonus = 1;
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_MightyContenderStr", nBonus);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_STRENGTH, nDiff);
        }
    }

    //Heartwarder
    nClassLvl = GetLevelByClass(CLASS_TYPE_HEARTWARDER, oPC);
    iTest = GetPersistantLocalInt(oPC, "NWNX_HeartWardCha");
    if(nClassLvl || iTest)
    {
        nBonus = (nClassLvl + 1) / 2;
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_HeartWardCha", nBonus);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_CHARISMA, nDiff);
        }
    }
    /*iTest = GetPersistantLocalInt(oPC, "NWNX_HeartWardSkill");
    if(nClassLvl || iTest)
    {
        nBonus = GetHasFeat(FEAT_HEART_PASSION, oPC) ? 2 : 0;
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_HeartWardSkill", nBonus);
            PRC_Funcs_ModSkill(oPC, SKILL_ANIMAL_EMPATHY, nDiff);
            PRC_Funcs_ModSkill(oPC, SKILL_PERFORM, nDiff);
            PRC_Funcs_ModSkill(oPC, SKILL_PERSUADE, nDiff);
            PRC_Funcs_ModSkill(oPC, SKILL_TAUNT, nDiff);
            PRC_Funcs_ModSkill(oPC, SKILL_USE_MAGIC_DEVICE, nDiff);
            PRC_Funcs_ModSkill(oPC, SKILL_BLUFF, nDiff);
            PRC_Funcs_ModSkill(oPC, SKILL_INTIMIDATE, nDiff);
        }
    }*/

    //Acolyte of the Skin
    nClassLvl = GetLevelByClass(CLASS_TYPE_ACOLYTE, oPC);
    iTest = GetPersistantLocalInt(oPC, "NWNX_AcolyteDex");
    if(nClassLvl || iTest)
    {
        nBonus = GetHasFeat(FEAT_WEAR_FIEND, oPC) * 2;
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_AcolyteDex", nBonus);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_DEXTERITY, nDiff);
        }
    }
    iTest = GetPersistantLocalInt(oPC, "NWNX_AcolyteInt");
    if(nClassLvl || iTest)
    {
        nBonus = (GetHasFeat(FEAT_EPIC_INT_1, oPC)
                + GetHasFeat(FEAT_EPIC_INT_2, oPC)) * 2;
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_AcolyteInt", nBonus);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_INTELLIGENCE, nDiff);
        }
    }
    iTest = GetPersistantLocalInt(oPC, "NWNX_AcolyteCon");
    if(nClassLvl || iTest)
    {
        nBonus = (GetHasFeat(FEAT_SKIN_ADAPTION, oPC)
                + GetHasFeat(FEAT_EPIC_CON_1, oPC)
                + GetHasFeat(FEAT_EPIC_CON_2, oPC)
                + GetHasFeat(FEAT_EPIC_CON_3, oPC)) * 2;
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_AcolyteCon", nBonus);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_CONSTITUTION, nDiff);
        }
    }

    //Alienist
    nClassLvl = GetLevelByClass(CLASS_TYPE_ALIENIST, oPC);
    iTest = GetPersistantLocalInt(oPC, "NWNX_AlienistWis");
    if(nClassLvl || iTest)
    {
        nBonus = GetHasFeat(FEAT_ALIEN_BLESSING, oPC) ? -2 : 0;
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_AlienistWis", nBonus);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_WISDOM, nDiff);
        }
    }

    //Diamond Dragon
    nClassLvl = GetLevelByClass(CLASS_TYPE_DIAMOND_DRAGON, oPC);
    iTest = GetPersistantLocalInt(oPC, "NWNX_DiaDragStr");
    if(nClassLvl || iTest)
    {
        nBonus = GetHasFeat(FEAT_DRAGON_AUGMENT_STR_1, oPC)
               + GetHasFeat(FEAT_DRAGON_AUGMENT_STR_2, oPC)
               + GetHasFeat(FEAT_DRAGON_AUGMENT_STR_3, oPC);
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_DiaDragStr", nBonus);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_STRENGTH, nDiff);
        }
    }
    iTest = GetPersistantLocalInt(oPC, "NWNX_DiaDragDex");
    if(nClassLvl || iTest)
    {
        nBonus = GetHasFeat(FEAT_DRAGON_AUGMENT_DEX_1, oPC)
               + GetHasFeat(FEAT_DRAGON_AUGMENT_DEX_2, oPC)
               + GetHasFeat(FEAT_DRAGON_AUGMENT_DEX_3, oPC);
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_DiaDragDex", nBonus);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_DEXTERITY, nDiff);
        }
    }
    iTest = GetPersistantLocalInt(oPC, "NWNX_DiaDragCon");
    if(nClassLvl || iTest)
    {
        nBonus = GetHasFeat(FEAT_DRAGON_AUGMENT_CON_1, oPC)
               + GetHasFeat(FEAT_DRAGON_AUGMENT_CON_2, oPC)
               + GetHasFeat(FEAT_DRAGON_AUGMENT_CON_3, oPC);
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_DiaDragCon", nBonus);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_CONSTITUTION, nDiff);
        }
    }

    //Disciple of Baalzebul
    nClassLvl = GetLevelByClass(CLASS_TYPE_DISC_BAALZEBUL, oPC);
    iTest = GetPersistantLocalInt(oPC, "NWNX_KingofLies");
    if(nClassLvl || iTest)
    {
        nBonus = GetHasFeat(FEAT_KING_LIES, oPC) ? 4 : 0;
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_KingofLies", nBonus);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_CHARISMA, nDiff);
        }
    }

    //Oozemaster
    nClassLvl = GetLevelByClass(CLASS_TYPE_OOZEMASTER, oPC);
    iTest = GetPersistantLocalInt(oPC, "NWNX_OozemasterCha");
    if(nClassLvl || iTest)
    {
        nBonus = (nClassLvl / 2) * -1;
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_OozemasterCha", nBonus);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_CHARISMA, nDiff);
        }
    }

    //Swift Wing
    iTest = GetPersistantLocalInt(oPC, "NWNX_DragonicSurgeStr");
    nBonus = GetHasFeat(FEAT_DRACONIC_SURGE_STR, oPC);
    if(nBonus || iTest)
    {
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_DragonicSurgeStr", nBonus);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_STRENGTH, nDiff);
        }
    }
    iTest = GetPersistantLocalInt(oPC, "NWNX_DragonicSurgeDex");
    nBonus = GetHasFeat(FEAT_DRACONIC_SURGE_DEX, oPC);
    if(nBonus || iTest)
    {
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_DragonicSurgeDex", nBonus);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_DEXTERITY, nDiff);
        }
    }
    iTest = GetPersistantLocalInt(oPC, "NWNX_DragonicSurgeCon");
    nBonus = GetHasFeat(FEAT_DRACONIC_SURGE_CON, oPC);
    if(nBonus || iTest)
    {
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_DragonicSurgeCon", nBonus);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_CONSTITUTION, nDiff);
        }
    }
    iTest = GetPersistantLocalInt(oPC, "NWNX_DragonicSurgeInt");
    nBonus = GetHasFeat(FEAT_DRACONIC_SURGE_INT, oPC);
    if(nBonus || iTest)
    {
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_DragonicSurgeInt", nBonus);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_INTELLIGENCE, nDiff);
        }
    }
    iTest = GetPersistantLocalInt(oPC, "NWNX_DragonicSurgeWis");
    nBonus = GetHasFeat(FEAT_DRACONIC_SURGE_WIS, oPC);
    if(nBonus || iTest)
    {
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_DragonicSurgeWis", nBonus);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_WISDOM, nDiff);
        }
    }
    iTest = GetPersistantLocalInt(oPC, "NWNX_DragonicSurgeCha");
    nBonus = GetHasFeat(FEAT_DRACONIC_SURGE_CHA, oPC);
    if(nBonus || iTest)
    {
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_DragonicSurgeCha", nBonus);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_CHARISMA, nDiff);
        }
    }

    //Dragon Devotee
    nClassLvl = GetLevelByClass(CLASS_TYPE_DRAGON_DEVOTEE, oPC);
    int nDragDisc = GetLevelByClass(CLASS_TYPE_DRAGON_DISCIPLE, oPC);
    int nHalfDrag = GetHasTemplate(TEMPLATE_HALF_DRAGON);
    iTest = GetPersistantLocalInt(oPC, "NWNX_DraDevCha");
    if(nClassLvl || iTest)
    {
        nBonus = nDragDisc < 10 && !nHalfDrag ? 2 : 0;
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_DraDevCha", nBonus);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_CHARISMA, nDiff);
        }
    }
    iTest = GetPersistantLocalInt(oPC, "NWNX_DraDevCon");
    if(nClassLvl || iTest)
    {
        nBonus = nClassLvl > 2 && nDragDisc < 7 && !nHalfDrag ? 2 : 0;
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_DraDevCon", nBonus);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_CONSTITUTION, nDiff);
        }
    }
    iTest = GetPersistantLocalInt(oPC, "NWNX_DraDevStr");
    if(nClassLvl || iTest)
    {
        nBonus = nClassLvl > 4 && nDragDisc < 2 && !nHalfDrag ? 2 : 0;
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_DraDevStr", nBonus);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_STRENGTH, nDiff);
        }
    }

    //Baelnorn
    nClassLvl = GetLevelByClass(CLASS_TYPE_BAELNORN, oPC);
    iTest = GetPersistantLocalInt(oPC, "NWNX_BaelnornCha");
    if(nClassLvl || iTest)
    {
        nBonus = nClassLvl >= 4 ? 2 : 0;
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_BaelnornCha", nBonus);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_CHARISMA, nDiff);
        }
    }
    iTest = GetPersistantLocalInt(oPC, "NWNX_BaelnornWis");
    if(nClassLvl || iTest)
    {
        nBonus = nClassLvl >= 3 ? 2 : 0;
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_BaelnornWis", nBonus);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_WISDOM, nDiff);
        }
    }
    iTest = GetPersistantLocalInt(oPC, "NWNX_BaelnornInt");
    if(nClassLvl || iTest)
    {
        nBonus = nClassLvl >= 1 ? 2 : 0;
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_BaelnornInt", nBonus);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_INTELLIGENCE, nDiff);
        }
    }
    /*iTest = GetPersistantLocalInt(oPC, "NWNX_BaelnornSkill");
    if(nClassLvl || iTest)
    {
        nBonus = nClassLvl * 2;
        nDiff = nBonus - iTest;
        if(nDiff != 0)
        {
            SetPersistantLocalInt(oPC, "NWNX_BaelnornSkill", nBonus);
            PRC_Funcs_ModSkill(oPC, SKILL_SPOT, nDiff);
            PRC_Funcs_ModSkill(oPC, SKILL_HIDE, nDiff);
            PRC_Funcs_ModSkill(oPC, SKILL_LISTEN, nDiff);
            PRC_Funcs_ModSkill(oPC, SKILL_MOVE_SILENTLY, nDiff);
            PRC_Funcs_ModSkill(oPC, SKILL_SEARCH, nDiff);
            PRC_Funcs_ModSkill(oPC, SKILL_PERSUADE, nDiff);
        }
    }*/
    if(GetPersistantLocalInt(oPC, "EpicSpell_TransVital"))
    {
        if(!GetPersistantLocalInt(oPC, "NWNX_TransVital"))
        {
            SetPersistantLocalInt(oPC, "NWNX_TransVital", 1);
            PRC_Funcs_ModAbilityScore(oPC, ABILITY_CONSTITUTION, 5);
        }
    }
    if(GetAlignmentGoodEvil(oPC) == ALIGNMENT_EVIL)
    {
        if(GetHasFeat(FEAT_VILE_DEFORM_OBESE, oPC) && !GetHasFeat(FEAT_VILE_DEFORM_GAUNT, oPC))
        {
            if(!GetPersistantLocalInt(oPC, "NWNX_DeformObese"))
            {
                SetPersistantLocalInt(oPC, "NWNX_DeformObese", 1);
                PRC_Funcs_ModAbilityScore(oPC, ABILITY_CONSTITUTION, 2);
                PRC_Funcs_ModAbilityScore(oPC, ABILITY_DEXTERITY, -2);
            }
        }
        if(GetHasFeat(FEAT_VILE_DEFORM_GAUNT, oPC) && !GetHasFeat(FEAT_VILE_DEFORM_OBESE, oPC))
        {
            if(!GetPersistantLocalInt(oPC, "NWNX_DeformGaunt"))
            {
                SetPersistantLocalInt(oPC, "NWNX_DeformGaunt", 1);
                PRC_Funcs_ModAbilityScore(oPC, ABILITY_DEXTERITY, 2);
                PRC_Funcs_ModAbilityScore(oPC, ABILITY_CONSTITUTION, -2);
            }
        }
    }

    //Mystics with Sun domain get Turn Undead feat
    /*if(GetLevelByClass(CLASS_TYPE_MYSTIC, oPC) && GetHasFeat(FEAT_BONUS_DOMAIN_SUN, oPC))
    {
        if(!PRC_Funcs_GetFeatKnown(oPC, FEAT_TURN_UNDEAD))
            PRC_Funcs_AddFeat(oPC, FEAT_TURN_UNDEAD);
    }*/
    
    //Inherent Bonuses to abilities
    if(GetPersistantLocalInt(oPC, "PRC_InherentBonus"))
    {
        int i;
        string sAbi;
        for(i = 0; i < 6; i++)
        {
            sAbi = IntToString(i);
            nBonus = GetPersistantLocalInt(oPC, "PRC_InherentBonus_"+sAbi);
            iTest = GetPersistantLocalInt(oPC, "NWNX_InherentBonus_"+sAbi);
            nDiff = nBonus - iTest;
            if(nDiff != 0)
            {
                SetPersistantLocalInt(oPC, "NWNX_InherentBonus_"+sAbi, nBonus);
                PRC_Funcs_ModAbilityScore(oPC, i, nDiff);
            }
        }
    }

    //PRC PnP Spell Schools
    if(GetPRCSwitch(PRC_PNP_SPELL_SCHOOLS)
    && GetLevelByClass(CLASS_TYPE_WIZARD, oPC) || GetLevelByClass(CLASS_TYPE_DEFILER, oPC)) // NWN Dark Sun class
    {
        if(GetHasFeat(2274, oPC)
        || GetHasFeat(2276, oPC)
        || GetHasFeat(2277, oPC)
        || GetHasFeat(2278, oPC)
        || GetHasFeat(2279, oPC)
        || GetHasFeat(2280, oPC)
        || GetHasFeat(2281, oPC))
        {
            //set school to PnP school
            PRC_Funcs_SetWizardSpecialization(oPC, 9);
        }
        else if(GetHasFeat(2273, oPC))
        {
            //set school to generalist
            PRC_Funcs_SetWizardSpecialization(oPC, 0);
        }
    }
}