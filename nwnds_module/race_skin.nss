// race_skin 
// Handle skin and other mods for races.
// This file is where various content users can customize races.

#include "prc_inc_natweap"
#include "inc_dynconv"
//#include "inc_nwnx_funcs"
#include "moi_inc_moifunc"

void main()
{
    object oPC = OBJECT_SELF;
    object oSkin = GetPCSkin(oPC);
    int bFuncs = GetPRCSwitch(PRC_NWNX_FUNCS);
    itemproperty ipIP;
    
    SetCompositeBonus(oSkin, "DieDieDie_Taunt", 50, ITEM_PROPERTY_DECREASED_SKILL_MODIFIER, SKILL_TAUNT);
    SetCompositeBonus(oSkin, "DieDieDie_Parry", 50, ITEM_PROPERTY_DECREASED_SKILL_MODIFIER, SKILL_PARRY);
    int nTumble = GetSkillRank(SKILL_TUMBLE, oPC, TRUE);
    int nSpellCraft = GetSkillRank(SKILL_SPELLCRAFT, oPC);
    if (nTumble >= 5)
    {
        int nPen = nTumble/5;
        SetCompositeBonus(oSkin, "TumbleCheat", nPen, ITEM_PROPERTY_DECREASED_AC, IP_CONST_ACMODIFIERTYPE_DODGE);
    }
     if (nSpellCraft >= 5)
    {   
        int nPen = nSpellCraft/5;
        SetCompositeBonus(oSkin, "SpellcraftCheat_F", nPen, ITEM_PROPERTY_DECREASED_SAVING_THROWS, IP_CONST_SAVEBASETYPE_FORTITUDE);
        SetCompositeBonus(oSkin, "SpellcraftCheat_W", nPen, ITEM_PROPERTY_DECREASED_SAVING_THROWS, IP_CONST_SAVEBASETYPE_WILL);
        SetCompositeBonus(oSkin, "SpellcraftCheat_R", nPen, ITEM_PROPERTY_DECREASED_SAVING_THROWS, IP_CONST_SAVEBASETYPE_REFLEX);
        //ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectSavingThrowDecrease(SAVING_THROW_ALL, nPen, SAVING_THROW_TYPE_SPELL)), oPC);
    }    

    //immunity to cold
    if(GetHasFeat(FEAT_IMM_COLD))
    {
        ipIP =ItemPropertyDamageImmunity(IP_CONST_DAMAGETYPE_COLD,IP_CONST_DAMAGEIMMUNITY_100_PERCENT);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }

    //immunity to acid
    if(GetHasFeat(FEAT_IMMUNE_ACID))
    {
        ipIP =ItemPropertyDamageImmunity(IP_CONST_DAMAGETYPE_ACID,IP_CONST_DAMAGEIMMUNITY_100_PERCENT);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }

    //immunity to electricity
    if(GetHasFeat(FEAT_IMMUNE_ELECTRICITY))
    {
        ipIP =ItemPropertyDamageImmunity(IP_CONST_DAMAGETYPE_ELECTRICAL,IP_CONST_DAMAGEIMMUNITY_100_PERCENT);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }

    //immunity to phantasms
    //only immunity to wierd and phatasmal killer
    if(GetHasFeat(FEAT_IMM_PHANT))
    {
        ipIP = ItemPropertySpellImmunitySpecific(SPELL_WEIRD);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
        ipIP = ItemPropertySpellImmunitySpecific(SPELL_PHANTASMAL_KILLER);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }

    //immunity to detection. NEEDS TESTING!!!
//tested and doesnt work (means you cant cast these on yourself)
//removed untill a solution is found
    if(GetHasFeat(FEAT_NONDETECTION))
    {
/*
        ipIP = ItemPropertySpellImmunitySpecific(SPELL_SEE_INVISIBILITY);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
        ipIP = ItemPropertySpellImmunitySpecific(SPELL_TRUE_SEEING);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
        ipIP = ItemPropertySpellImmunitySpecific(SPELL_DARKVISION);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
*/
    }

    //immunity to artificial poisons
    //replaced with immunity to all poisons
    if(GetHasFeat(FEAT_IMM_APOI))
    {
        ipIP =ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_POISON);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }

    //immunity to disease
    if(GetHasFeat(FEAT_IMMUNE_DISEASE))
    {
        ipIP =ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_DISEASE);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }

    //improved fortification - immunity to critical hits
    if(GetHasFeat(FEAT_IMPROVED_FORTIFICATION))
    {
        ipIP =ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_CRITICAL_HITS);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
        ipIP =ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_BACKSTAB);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);        
    }

    //Plant racial type immunities - sleep, paralysis, poison, mind-affecting, criticals
    if(GetHasFeat(FEAT_PLANT_IMM))
    {
        //effect eSleepImmune = ExtraordinaryEffect(EffectImmunity(IMMUNITY_TYPE_SLEEP));
        //AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSleepImmune, oPC));

        ipIP =ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_PARALYSIS);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);

        ipIP =ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_POISON);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);

        ipIP =ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_MINDSPELLS);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);

        ipIP =ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_CRITICAL_HITS);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }

    //Living Construct type immunities - sleep, paralysis, poison, disease, energy drain
    if(GetHasFeat(FEAT_LIVING_CONSTRUCT))
    {
        //effect eSleepImmune = ExtraordinaryEffect(EffectImmunity(IMMUNITY_TYPE_SLEEP));
        //AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSleepImmune, oPC));

        ipIP =ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_PARALYSIS);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);

        ipIP =ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_POISON);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);

        ipIP =ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_DISEASE);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);

        ipIP =ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_LEVEL_ABIL_DRAIN);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }

    //natural armor 1-10
    // Note: This bonus will be Dodge bonus no matter what IP_CONST you specify.
    int nAC;
    if(GetHasFeat(FEAT_NATARM_19))      nAC = 19;
    else if(GetHasFeat(FEAT_NATARM_18)) nAC = 18;
    else if(GetHasFeat(FEAT_NATARM_17)) nAC = 17;
    else if(GetHasFeat(FEAT_NATARM_16)) nAC = 16;
    else if(GetHasFeat(FEAT_NATARM_15)) nAC = 15;
    else if(GetHasFeat(FEAT_NATARM_14)) nAC = 14;
    else if(GetHasFeat(FEAT_NATARM_13)) nAC = 13;
    else if(GetHasFeat(FEAT_NATARM_12)) nAC = 12;
    else if(GetHasFeat(FEAT_NATARM_11)) nAC = 11;
    else if(GetHasFeat(FEAT_NATARM_10)) nAC = 10;
    else if(GetHasFeat(FEAT_NATARM_9))  nAC = 9;
    else if(GetHasFeat(FEAT_NATARM_8))  nAC = 8;
    else if(GetHasFeat(FEAT_NATARM_7))  nAC = 7;
    else if(GetHasFeat(FEAT_NATARM_6))  nAC = 6;
    else if(GetHasFeat(FEAT_NATARM_5))  nAC = 5;
    else if(GetHasFeat(FEAT_NATARM_4))  nAC = 4;
    else if(GetHasFeat(FEAT_NATARM_3))  nAC = 3;
    else if(GetHasFeat(FEAT_NATARM_2))  nAC = 2;
    else if(GetHasFeat(FEAT_NATARM_1))  nAC = 1;

    if(nAC) SetCompositeBonus(oSkin, "RacialNaturalArmor", nAC, ITEM_PROPERTY_AC_BONUS);


    //immunity to breathing-targetted spells
    if(GetHasFeat(FEAT_BREATHLESS))
    {
        ipIP = ItemPropertySpellImmunitySpecific(SPELL_DROWN);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
        ipIP = ItemPropertySpellImmunitySpecific(SPELL_MASS_DROWN);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
        ipIP = ItemPropertySpellImmunitySpecific(SPELL_CLOUDKILL);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
        ipIP = ItemPropertySpellImmunitySpecific(SPELL_ACID_FOG);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
        ipIP = ItemPropertySpellImmunitySpecific(SPELL_STINKING_CLOUD);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }

    //immunity to charm
    if(GetHasFeat(FEAT_IMMUNE_CHARM) || GetRacialType(OBJECT_SELF) == RACIAL_TYPE_DOPPELGANGER)
    {
        ipIP = ItemPropertySpellImmunitySpecific(SPELL_CHARM_PERSON);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
        ipIP = ItemPropertySpellImmunitySpecific(SPELL_CHARM_MONSTER);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);        
        ipIP = ItemPropertySpellImmunitySpecific(SPELL_CHARM_PERSON_OR_ANIMAL);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);        
    }

    //immunity to confusion
    if(GetHasFeat(FEAT_IMMUNE_CONFUSION))
    {
        ipIP = ItemPropertySpellImmunitySpecific(SPELL_CONFUSION);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }

    //immunity to drowning
    //water gensasi and aquatic elves can breath water, so can some Spirit Folk
    if(GetHasFeat(FEAT_WATER_BREATHING) || GetHasFeat(FEAT_BONUS_RIVER) || GetHasFeat(FEAT_BONUS_SEA))
    {
        ipIP = ItemPropertySpellImmunitySpecific(SPELL_DROWN);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
        ipIP = ItemPropertySpellImmunitySpecific(SPELL_MASS_DROWN  );
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }

    //Bamboo Spirit Folk Bonuses
    if(GetHasFeat(FEAT_BONUS_BAMBOO))
    {
        ipIP = ItemPropertyBonusFeat(IP_CONST_FEAT_TRACKLESS_STEP);
        if(bFuncs && !PRC_Funcs_GetFeatKnown(oPC, FEAT_TRACKLESS_STEP))
            PRC_Funcs_AddFeat(oPC, FEAT_TRACKLESS_STEP);
        else
            IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
        SetCompositeBonus(oSkin, "Bamboo_Spirit_Lore", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_LORE);
    }
    //Mountain Spirit Folk Bonuses
    if(GetHasFeat(FEAT_BONUS_MOUNTAIN))
    {
        SetCompositeBonus(oSkin, "SpiritFolk_Climb", 8, ITEM_PROPERTY_SKILL_BONUS, SKILL_CLIMB);
        SetCompositeBonus(oSkin, "SpiritFolk_Balance", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_BALANCE);
        SetCompositeBonus(oSkin, "SpiritFolk_Jump", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_JUMP);
        SetCompositeBonus(oSkin, "SpiritFolk_Tumble", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_TUMBLE);
    }    
    
    //Azer Heat Damage +1 (armed and unarmed)
    if (GetHasFeat(FEAT_AZER_HEAT, oPC))
    {
         if (GetLocalInt(oPC, "ONEQUIP") == 1)
         {
             object oItem = GetItemLastUnequipped();
             SetCompositeDamageBonusT(oItem, "AzerFlameDamage", 0, IP_CONST_DAMAGETYPE_FIRE);
         }
         else
         {
             ExecuteScript("race_azer_flame", oPC);
         }
    }
/* Bioware reads size based on appearance
    //-1AC, -1 ATT, -4hide
    if(GetHasFeat(FEAT_LARGE))
    {
        SetCompositeBonus(oSkin, "RacialSize_AC", 1, ITEM_PROPERTY_DECREASED_AC);
        SetCompositeBonus(oSkin, "RacialSize_Attack", 1, ITEM_PROPERTY_DECREASED_ATTACK_MODIFIER);
        SetCompositeBonus(oSkin, "RacialSize_SkillHide", 4, ITEM_PROPERTY_DECREASED_SKILL_MODIFIER, SKILL_HIDE);
    }

    //-2AC, -2 ATT, -8hide
    else if(GetHasFeat(FEAT_HUGE))
    {
        SetCompositeBonus(oSkin, "RacialSize_AC", 2, ITEM_PROPERTY_DECREASED_AC);
        SetCompositeBonus(oSkin, "RacialSize_Attack", 2, ITEM_PROPERTY_DECREASED_ATTACK_MODIFIER);
        SetCompositeBonus(oSkin, "RacialSize_SkillHide", 8, ITEM_PROPERTY_DECREASED_SKILL_MODIFIER, SKILL_HIDE);
    }

    //+2AC, +2 ATT, +8hide
    else if(GetHasFeat(FEAT_TINY))
    {
        SetCompositeBonus(oSkin, "RacialSize_AC", 2, ITEM_PROPERTY_AC_BONUS);
        SetCompositeBonus(oSkin, "RacialSize_Attack", 2, ITEM_PROPERTY_ATTACK_BONUS);
        SetCompositeBonus(oSkin, "RacialSize_SkillHide", 8, ITEM_PROPERTY_SKILL_BONUS, SKILL_HIDE);
    }
*/
    //regeneration 5PH/round
    if(GetHasFeat(FEAT_REGEN5))
    {
        SetCompositeBonus(oSkin, "RacialRegeneration_5", 5, ITEM_PROPERTY_REGENERATION);
    }

    if(GetHasFeat(FEAT_UNEARTHLY_GRACE))
    {
        int nGrace = GetAbilityModifier(ABILITY_CHARISMA, oPC);
        SetCompositeBonus(oSkin, "UnearthlyGraceAC", nGrace, ITEM_PROPERTY_AC_BONUS);
        SetCompositeBonus(oSkin, "UnearthlyGraceSave", nGrace, ITEM_PROPERTY_SAVING_THROW_BONUS, SAVING_THROW_ALL);
    }
    if(GetRacialType(oPC) == RACIAL_TYPE_TAREK) // NWN Dark Sun
    {
        SetCompositeBonus(oSkin, "Tarek_Intim", 4, ITEM_PROPERTY_SKILL_BONUS, SKILL_INTIMIDATE);
        SetCompositeBonus(oSkin, "Tarek_Persuade",  -2, ITEM_PROPERTY_SKILL_BONUS, SKILL_PERSUADE);
        SetCompositeBonus(oSkin, "Tarek_Perform",  -2, ITEM_PROPERTY_SKILL_BONUS, SKILL_PERFORM);
        SetCompositeBonus(oSkin, "Tarek_Hide", -4, ITEM_PROPERTY_SKILL_BONUS, SKILL_HIDE);
    }
    if(GetRacialType(oPC) == RACIAL_TYPE_AARAKOCRA) // NWN Dark Sun
    {
        SetCompositeBonus(oSkin, "Aarakocra_Spot", 6, ITEM_PROPERTY_SKILL_BONUS, SKILL_SPOT);
    }
    if(GetRacialType(oPC) == RACIAL_TYPE_TARI) // NWN Dark Sun
    {
        SetCompositeBonus(oSkin, "Tari_Listen", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_LISTEN);
        SetCompositeBonus(oSkin, "Tari_Search",  2, ITEM_PROPERTY_SKILL_BONUS, SKILL_SEARCH);
        SetCompositeBonus(oSkin, "Tari_Spot",  2, ITEM_PROPERTY_SKILL_BONUS, SKILL_SPOT);
        SetCompositeBonus(oSkin, "Tari_Reflex", 2, ITEM_PROPERTY_SAVING_THROW_BONUS, SAVING_THROW_REFLEX);        
    }  
    if(GetRacialType(oPC) == RACIAL_TYPE_GITH) // NWN Dark Sun
    {
        SetCompositeBonus(oSkin, "Gith_Jump", 10, ITEM_PROPERTY_SKILL_BONUS, SKILL_JUMP);
        SetCompositeBonus(oSkin, "Gith_Hide", 4, ITEM_PROPERTY_SKILL_BONUS, SKILL_HIDE);
        SetCompositeBonus(oSkin, "Gith_MvSil", 4, ITEM_PROPERTY_SKILL_BONUS, SKILL_MOVE_SILENTLY);
    }     
    if(GetRacialType(oPC) == RACIAL_TYPE_KRINTH)
    {
        SetCompositeBonus(oSkin, "KrinthSave", 1, ITEM_PROPERTY_SAVING_THROW_BONUS, SAVING_THROW_ALL);
    }   
    if(GetRacialType(oPC) == RACIAL_TYPE_HADOZEE)
    {
        SetCompositeBonus(oSkin, "Hadozee_Climb", 4, ITEM_PROPERTY_SKILL_BONUS, SKILL_CLIMB);
        SetCompositeBonus(oSkin, "Hadozee_Balance", 4, ITEM_PROPERTY_SKILL_BONUS, SKILL_BALANCE);
    }   
    if(GetRacialType(oPC) == RACIAL_TYPE_BHUKA)
    {
        SetCompositeBonus(oSkin, "Bhuka_Lore", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_LORE);
    }  
    if(GetRacialType(oPC) == RACIAL_TYPE_SKARN)
    {
        SetCompositeBonus(oSkin, "Skarn_Climb", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_CLIMB);
        SetCompositeBonus(oSkin, "Skarn_Intim", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_INTIMIDATE);
    }    
    if(GetRacialType(oPC) == RACIAL_TYPE_FERAL_GARGUN)
    {
        ipIP =ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_COLD, IP_CONST_DAMAGERESIST_5);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }  
    if(GetRacialType(oPC) == RACIAL_TYPE_CHITINE)
    {
        SetCompositeBonus(oSkin, "Chitine_Climb", 8, ITEM_PROPERTY_SKILL_BONUS, SKILL_CLIMB);
    }  
    if(GetRacialType(oPC) == RACIAL_TYPE_TAER)
    {
        SetCompositeBonus(oSkin, "Taer_Climb", 8, ITEM_PROPERTY_SKILL_BONUS, SKILL_CLIMB);
    }     
	if(GetRacialType(oPC) == RACIAL_TYPE_RILKAN)
	{
		int nLore = 1 + GetShapedMeldsCount(oPC)/2;
		SetCompositeBonus(oSkin, "Rilkan_Racial_Knowledge", nLore, ITEM_PROPERTY_SKILL_BONUS, SKILL_LORE);
	}
    if(GetRacialType(oPC) == RACIAL_TYPE_NEANDERTHAL)
    {
        SetCompositeBonus(oSkin, "Neander_L", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_LISTEN);
        SetCompositeBonus(oSkin, "Neander_S", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_SPOT);
    }
    if(GetRacialType(oPC) == RACIAL_TYPE_ULDRA)
    {
        ipIP =ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_COLD, IP_CONST_DAMAGERESIST_5);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
        SetCompositeBonus(oSkin, "Uldra_Lore", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_LORE);
    }     
    if(GetRacialType(oPC) == RACIAL_TYPE_EXTAMINAAR)
    {
        SetCompositeBonus(oSkin, "Extaminaar_C", 4, ITEM_PROPERTY_SKILL_BONUS, SKILL_CLIMB);
        SetCompositeBonus(oSkin, "Extaminaar_T", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_TUMBLE);
    }     
    if(GetRacialType(oPC) == RACIAL_TYPE_SKULK)
    {
        object oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);
        int nArmorType = GetBaseAC(oItem);
        //if not light armor, then remove racial bonuses
        if(GetBaseAC(oItem) > 4)	    
        {
        	SetCompositeBonus(oSkin, "Skulk_H", 0, ITEM_PROPERTY_SKILL_BONUS, SKILL_HIDE);
        	SetCompositeBonus(oSkin, "Skulk_M", 0, ITEM_PROPERTY_SKILL_BONUS, SKILL_MOVE_SILENTLY);        
        }
        else
        {
        	SetCompositeBonus(oSkin, "Skulk_H", 15, ITEM_PROPERTY_SKILL_BONUS, SKILL_HIDE);
        	SetCompositeBonus(oSkin, "Skulk_M", 8, ITEM_PROPERTY_SKILL_BONUS, SKILL_MOVE_SILENTLY);
        }	
    }  
    if(GetRacialType(oPC) == RACIAL_TYPE_DOPPELGANGER)
    {
        SetCompositeBonus(oSkin, "Doppel_B", 10, ITEM_PROPERTY_SKILL_BONUS, SKILL_BLUFF);
        SetCompositeBonus(oSkin, "Doppel_SM", 8, ITEM_PROPERTY_SKILL_BONUS, SKILL_SENSE_MOTIVE);
        SetCompositeBonus(oSkin, "Doppel_I",  2, ITEM_PROPERTY_SKILL_BONUS, SKILL_INTIMIDATE);
        SetCompositeBonus(oSkin, "Doppel_P",  2, ITEM_PROPERTY_SKILL_BONUS, SKILL_PERSUADE);
    }     
    if(GetRacialType(oPC) == RACIAL_TYPE_MONGRELFOLK)
    {
        SetCompositeBonus(oSkin, "Mongrel_A", 1, ITEM_PROPERTY_SKILL_BONUS, SKILL_APPRAISE);
        SetCompositeBonus(oSkin, "Mongrel_C", 1, ITEM_PROPERTY_SKILL_BONUS, SKILL_CLIMB);
        SetCompositeBonus(oSkin, "Mongrel_J", 1, ITEM_PROPERTY_SKILL_BONUS, SKILL_JUMP);
        SetCompositeBonus(oSkin, "Mongrel_L", 1, ITEM_PROPERTY_SKILL_BONUS, SKILL_LISTEN);
        SetCompositeBonus(oSkin, "Mongrel_MS",1, ITEM_PROPERTY_SKILL_BONUS, SKILL_MOVE_SILENTLY);
        SetCompositeBonus(oSkin, "Mongrel_SR",1, ITEM_PROPERTY_SKILL_BONUS, SKILL_SEARCH);
        SetCompositeBonus(oSkin, "Mongrel_SP",1, ITEM_PROPERTY_SKILL_BONUS, SKILL_SPOT);
        SetCompositeBonus(oSkin, "Mongrel_H", 4, ITEM_PROPERTY_SKILL_BONUS, SKILL_HIDE);
        SetCompositeBonus(oSkin, "Mongrel_P", 4, ITEM_PROPERTY_SKILL_BONUS, SKILL_PICK_POCKET);
        SetCompositeBonus(oSkin, "Mongrel_U", 4, ITEM_PROPERTY_SKILL_BONUS, SKILL_USE_MAGIC_DEVICE);
    }     
	    
	
    //fire resistance 5
    if(GetHasFeat(FEAT_RESIST_FIRE5))
    {
        ipIP =ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_FIRE, IP_CONST_DAMAGERESIST_5);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }
    if(GetRacialType(oPC) == RACIAL_TYPE_UNDERFOLK)
    {
        SetCompositeBonus(oSkin, "Under_S", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_LISTEN);
    }    

    //fire resistance 10
    if(GetHasFeat(FEAT_RESIST_FIRE_10))
    {
        ipIP =ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_FIRE, IP_CONST_DAMAGERESIST_10);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }

    //cold resistance 10
    if(GetHasFeat(FEAT_RESIST_COLD_10))
    {
        ipIP =ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_COLD, IP_CONST_DAMAGERESIST_10);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }

    // Very Heroic, +2 to all saving throws
    if(GetHasFeat(FEAT_VERYHEROIC))
    {
        SetCompositeBonus(oSkin, "VeryHeroic", 2, ITEM_PROPERTY_SAVING_THROW_BONUS, SAVING_THROW_ALL);
    }

    // Skill Affinity, +2 to jump
    if(GetHasFeat(FEAT_SA_JUMP))
    {
        SetCompositeBonus(oSkin, "SA_Jump", 2, ITEM_PROPERTY_SKILL_BONUS, 28);
    }

    // Skill Affinity, +2 to bluff
    if(GetHasFeat(FEAT_SA_BLUFF))
    {
        SetCompositeBonus(oSkin, "SA_Bluff", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_BLUFF);
    }

    // Improved Skill Affinity, +4 to bluff
    if(GetHasFeat(FEAT_SA_BLUFF_4))
    {
        SetCompositeBonus(oSkin, "SA_Bluff_4", 4, ITEM_PROPERTY_SKILL_BONUS, SKILL_BLUFF);
    }

    // Skill Affinity, +2 to intimidate
    if(GetHasFeat(FEAT_SA_INTIMIDATE))
    {
        SetCompositeBonus(oSkin, "SA_Intimidate", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_INTIMIDATE);
    }

    // Skill Affinity, +2 to balance
    if(GetHasFeat(FEAT_SA_BALANCE))
    {
        SetCompositeBonus(oSkin, "SA_Balance", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_BALANCE);
    }

    // Skill Affinity, +4 to jump
    if(GetHasFeat(FEAT_SA_JUMP_4))
    {
        SetCompositeBonus(oSkin, "SA_Jump_4", 4, ITEM_PROPERTY_SKILL_BONUS, 28);
    }

    // Leap, +5 to Jump
    if(GetHasFeat(FEAT_LEAP))
    {
        SetCompositeBonus(oSkin, "Leap", 5, ITEM_PROPERTY_SKILL_BONUS, 28);
    }

    // Thri-Kreen Leap
    if(GetHasFeat(1176)) // FEAT_KREEN_LEAP
    {
        SetCompositeBonus(oSkin, "TKLeap", 30, ITEM_PROPERTY_SKILL_BONUS, 28);
    }

    // Skill Affinity, +4 to spot
    if(GetHasFeat(FEAT_SA_SPOT_4))
    {
        SetCompositeBonus(oSkin, "SA_Spot_4", 4, ITEM_PROPERTY_SKILL_BONUS, SKILL_SPOT);
    }

    // Skill Affinity, +4 to spot
    if(GetHasFeat(FEAT_KEEN_SIGHT))
    {
        SetCompositeBonus(oSkin, "Keen_Sight", 4, ITEM_PROPERTY_SKILL_BONUS, SKILL_SPOT);
    }

    // Skill Affinity, +4 to listen
    if(GetHasFeat(FEAT_SA_LISTEN_4))
    {
        SetCompositeBonus(oSkin, "SA_Listen_4", 4, ITEM_PROPERTY_SKILL_BONUS, SKILL_LISTEN);
    }

    // Skill Affinity, +4 to perform
    if(GetHasFeat(FEAT_SA_PERFORM_4))
    {
        SetCompositeBonus(oSkin, "SA_Perform_4", 4, ITEM_PROPERTY_SKILL_BONUS, SKILL_PERFORM);
    }

    // Skill Affinity, +2 to perform
    if(GetHasFeat(FEAT_SA_PERFORM))
    {
        SetCompositeBonus(oSkin, "SA_Perform", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_PERFORM);
    }

    // Skill Affinity, +2 to open locks
    if(GetHasFeat(FEAT_SA_OPEN))
    {
        SetCompositeBonus(oSkin, "SA_Open_Lock", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_OPEN_LOCK);
    }

    // Skill Affinity, +2 to sleight of hand/Pickpocket
    if(GetHasFeat(FEAT_SA_PICKPOCKET))
    {
        SetCompositeBonus(oSkin, "SA_Pickpocket", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_PICK_POCKET);
    }


    // Minotaur bonuses due to scent
    if(GetHasFeat(FEAT_MINOT_SCENT))
    {
        SetCompositeBonus(oSkin, "Minot_Scent_Spot", 4, ITEM_PROPERTY_SKILL_BONUS, SKILL_SPOT);
        SetCompositeBonus(oSkin, "Minot_Scent_Search", 4, ITEM_PROPERTY_SKILL_BONUS, SKILL_SEARCH);
        SetCompositeBonus(oSkin, "Minot_Scent_Listen", 4, ITEM_PROPERTY_SKILL_BONUS, SKILL_LISTEN);
    }

    // Kender Bonuses
    if(GetHasFeat(FEAT_KENDERBLUFF))
    {
        SetCompositeBonus(oSkin, "Kender_Bonus_Bluff", 4, ITEM_PROPERTY_SKILL_BONUS, SKILL_BLUFF);
    }

    // -4 to concentration
    if(GetHasFeat(FEAT_LACKOFFOCUS))
    {
        SetCompositeBonus(oSkin, "LackofFocus", 4, ITEM_PROPERTY_DECREASED_SKILL_MODIFIER, SKILL_CONCENTRATION);
    }

    // Gully Dwarf Liabilities
    if(GetHasFeat(FEAT_COWARDPITY))
    {
        SetCompositeBonus(oSkin, "Gully_Trait_Persuade", 4, ITEM_PROPERTY_SKILL_BONUS, SKILL_PERSUADE);
        SetCompositeBonus(oSkin, "Gully_Trait_Fear", 4, ITEM_PROPERTY_DECREASED_SAVING_THROWS_SPECIFIC, SPELL_FEAR);
    }
   
    // Skill Affinity, +2 to move silently
    if(GetHasFeat(FEAT_SA_MOVE))
    {
        SetCompositeBonus(oSkin, "SA_Move", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_MOVE_SILENTLY);
    }
   
    // Skill Affinity, +4 to move silently
    if(GetHasFeat(FEAT_SA_MOVE4))
    {
        SetCompositeBonus(oSkin, "SA_Move_4", 4, ITEM_PROPERTY_SKILL_BONUS, SKILL_MOVE_SILENTLY);
    }

    // Skill Affinity, +2 to craft armor
    if(GetHasFeat(FEAT_SA_CRFTARM))
    {
        SetCompositeBonus(oSkin, "SA_Craft_Armor", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_CRAFT_ARMOR);
    }
 
    // Skill Affinity, +2 to craft weapon
    if(GetHasFeat(FEAT_SA_CRFTWEAP))
    {
        SetCompositeBonus(oSkin, "SA_Craft_Weapon", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_CRAFT_WEAPON);
    }
 
    // Skill Affinity, +2 to craft trap
    if(GetHasFeat(FEAT_SA_CRFTTRAP))
    {
        SetCompositeBonus(oSkin, "SA_Craft_Trap", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_CRAFT_TRAP);
    }

    // Skill Affinity, +2 to hide
    if(GetHasFeat(FEAT_SA_HIDE))
    {
        SetCompositeBonus(oSkin, "SA_Hide", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_HIDE);
    }

    // Skill Affinity, +4 to hide
    // for forest gnomes since they get +4 or +8 in the woods.
    //also for Volodni, which only get hide bonuses in the forest
    if(GetHasFeat(FEAT_SA_HIDEF))
    {
        SetCompositeBonus(oSkin, "SA_Hide_Forest", 4, ITEM_PROPERTY_SKILL_BONUS, SKILL_HIDE);
    }

    // Skill Affinity, +4 to hide
    // for troglodytes since they get +4 or +8 underground.
    if(GetHasFeat(FEAT_SA_HIDE_TROG))
    {
        SetCompositeBonus(oSkin, "SA_Hide_UndrGrnd", 4, ITEM_PROPERTY_SKILL_BONUS, SKILL_HIDE);
    }

    // Skill Affinity, +5 to hide
    // for grigs, as they get +5 in the woods.
    if(GetHasFeat(FEAT_SA_HIDEF_5))
    {
        SetCompositeBonus(oSkin, "SA_Hide_Forest", 5, ITEM_PROPERTY_SKILL_BONUS, SKILL_HIDE);
    }
    

    // Skill Affinity, +4 to hide
    // for forest gnomes since they get +4 or +8 in the woods.
    if(GetHasFeat(FEAT_SA_HIDE4))
    {
        SetCompositeBonus(oSkin, "SA_Hide_4", 4, ITEM_PROPERTY_SKILL_BONUS, SKILL_HIDE);
    }

    // Skill Affinity, +2 to appraise
    // dwarves and deep halfings get racial +2 to appraise checks.
    if(GetHasFeat(FEAT_SA_APPRAISE))
    {
        SetCompositeBonus(oSkin, "SA_Appraise", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_APPRAISE);
    }

    // Skill Affinity, +6 to animal empathy
    if(GetHasFeat(FEAT_SA_ANIMAL_EMP_6))
    {
        SetCompositeBonus(oSkin, "SA_AnimalEmpathy_6", 6, ITEM_PROPERTY_SKILL_BONUS, SKILL_ANIMAL_EMPATHY);
    }

    // Skill Affinity, +2 to animal empathy
    if(GetHasFeat(FEAT_SA_ANIMAL_EMP))
    {
        SetCompositeBonus(oSkin, "SA_AnimalEmpathy_2", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_ANIMAL_EMPATHY);
    }

    // Skill Affinity, +2 to persuade
    if(GetHasFeat(FEAT_SA_PERSUADE))
    {
        SetCompositeBonus(oSkin, "SA_Persuade", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_PERSUADE);
    }

    // Skill Affinity, +2 to sense motive
    if(GetHasFeat(FEAT_SA_SENSE_MOTIVE))
    {
        SetCompositeBonus(oSkin, "SA_SenseMotive", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_SENSE_MOTIVE);
    }

    // Skill Affinity, +2 to tumble
    if(GetHasFeat(FEAT_SA_TUMBLE))
    {
        SetCompositeBonus(oSkin, "SA_Tumble", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_TUMBLE);
    }

    // PSA to Lore and Spellcraft
    if(GetHasFeat(FEAT_PSA_LORESPELL))
    {
        SetCompositeBonus(oSkin, "PSA_Lorespell_Lore", 1, ITEM_PROPERTY_SKILL_BONUS, SKILL_LORE);
        SetCompositeBonus(oSkin, "PSA_Lorespell_Spell", 1, ITEM_PROPERTY_SKILL_BONUS, SKILL_SPELLCRAFT);
    }
    
    //+2 to save vs mind-affecting
    if(GetHasFeat(FEAT_BONUS_MIND_2))
    {
        ipIP = ItemPropertyBonusSavingThrowVsX(IP_CONST_SAVEVS_MINDAFFECTING, 2);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }

    // Skill Penalty, -2 to persuade
    if(GetHasFeat(FEAT_MINUS_PERSUADE_2))
    {
        SetCompositeBonus(oSkin, "Minus_Persuade", -2, ITEM_PROPERTY_SKILL_BONUS, SKILL_PERSUADE);
    }

    // Skill Penalty, -2 to Listen
    if(GetHasFeat(FEAT_POORHEARING))
    {
        SetCompositeBonus(oSkin, "Poor_Listen", -2, ITEM_PROPERTY_SKILL_BONUS, SKILL_LISTEN);
    }

    //damage reduction 5/+1
    if(GetHasFeat(FEAT_DAM_RED5))
    {
        ipIP =ItemPropertyDamageReduction(IP_CONST_DAMAGEREDUCTION_1, IP_CONST_DAMAGESOAK_5_HP);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }

    //damage reduction 10/+1
    if(GetHasFeat(FEAT_DAM_RED10))
    {
        ipIP =ItemPropertyDamageReduction(IP_CONST_DAMAGEREDUCTION_1, IP_CONST_DAMAGESOAK_10_HP);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }

    //damage reduction 15/+1
    if(GetHasFeat(FEAT_DAM_RED15))
    {
        ipIP =ItemPropertyDamageReduction(IP_CONST_DAMAGEREDUCTION_1, IP_CONST_DAMAGESOAK_15_HP);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }

    //damage reduction 5/+3
    if(GetHasFeat(FEAT_LESSER_FEY_DR))
    {
        ipIP =ItemPropertyDamageReduction(IP_CONST_DAMAGEREDUCTION_3, IP_CONST_DAMAGESOAK_5_HP);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }

    //damage reduction 10/+3
    if(GetHasFeat(FEAT_FEY_DR))
    {
        ipIP =ItemPropertyDamageReduction(IP_CONST_DAMAGEREDUCTION_3, IP_CONST_DAMAGESOAK_10_HP);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }

    //damage vulnerability cold 50%
    if(GetHasFeat(FEAT_VULN_COLD))
    {
        ipIP = ItemPropertyDamageVulnerability(DAMAGE_TYPE_COLD, IP_CONST_DAMAGEVULNERABILITY_50_PERCENT);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }

    //damage vulnerability fire 50%
    if(GetHasFeat(FEAT_VULN_FIRE))
    {
        ipIP = ItemPropertyDamageVulnerability(DAMAGE_TYPE_FIRE, IP_CONST_DAMAGEVULNERABILITY_50_PERCENT);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }

    //damage immunity 50% Piercing
    if(GetHasFeat(FEAT_PARTIAL_PIERCE_IMMUNE))
    {
        ipIP = ItemPropertyDamageImmunity(DAMAGE_TYPE_PIERCING, IP_CONST_DAMAGEIMMUNITY_50_PERCENT);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }

    //Svirfneblin dodge bonus (+4)
    if(GetHasFeat(FEAT_SVIRFNEBLIN_DODGE))
    {
        SetCompositeBonus(oSkin, "Svirf_Dodge", 4, ITEM_PROPERTY_AC_BONUS);
    }

    if(GetHasFeat(FEAT_CRAFTGUILD))
    {
        SetCompositeBonus(oSkin, "SA_Craft_GuildA", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_CRAFT_ARMOR);
        SetCompositeBonus(oSkin, "SA_Craft_GuildW", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_CRAFT_WEAPON);
        SetCompositeBonus(oSkin, "SA_Craft_GuildT", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_CRAFT_TRAP);
    }
    else if(GetHasFeat(FEAT_TECHGUILD))
    {
        SetCompositeBonus(oSkin, "SA_Tech_GuildA", 1, ITEM_PROPERTY_SKILL_BONUS, SKILL_CRAFT_ARMOR);
        SetCompositeBonus(oSkin, "SA_Tech_GuildW", 1, ITEM_PROPERTY_SKILL_BONUS, SKILL_CRAFT_WEAPON);
        SetCompositeBonus(oSkin, "SA_Tech_GuildT", 1, ITEM_PROPERTY_SKILL_BONUS, SKILL_CRAFT_TRAP);
        SetCompositeBonus(oSkin, "SA_Tech_GuildL", 1, ITEM_PROPERTY_SKILL_BONUS, SKILL_LORE);
    }
    else if(GetHasFeat(FEAT_SAGEGUILD))
    {
        SetCompositeBonus(oSkin, "SA_Sage_Guild", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_LORE);
    }

    //"cheat" ac boosts to Warforged armor so it stacks properly
    if(GetHasFeat(FEAT_COMPOSITE_PLATING) &&
       !(GetHasFeat(FEAT_MITHRIL_PLATING) || GetHasFeat(FEAT_ADAMANTINE_PLATING) 
         || GetHasFeat(FEAT_IRONWOOD_PLATING) || GetHasFeat(FEAT_UNARMORED_BODY)))
        SetCompositeBonus(oSkin, "CompositePlating", 2, ITEM_PROPERTY_AC_BONUS);
    if(GetHasFeat(FEAT_MITHRIL_PLATING))
        SetCompositeBonus(oSkin, "MithrilPlating", 3, ITEM_PROPERTY_AC_BONUS);

    //Subdual to elements
    //implemented as resist 1/- for heat and cold
    if(GetHasFeat(FEAT_SUBDUAL_ELEMENTS))
    {
        ipIP =ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_FIRE, IP_CONST_DAMAGERESIST_1);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
        ipIP =ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_COLD, IP_CONST_DAMAGERESIST_1);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }

    //Subdual DR 1/-
    //implemented as resist 1/- for slash/pierce/blud
    if(GetHasFeat(FEAT_SUBDUAL))
    {
        ipIP =ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_SLASHING, IP_CONST_DAMAGERESIST_1);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
        ipIP =ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_PIERCING, IP_CONST_DAMAGERESIST_1);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
        ipIP =ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_BLUDGEONING, IP_CONST_DAMAGERESIST_1);
        IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
    }

    ///Buommans vow of silence - moved to prc_feats.nss
    /*if(GetHasFeat(FEAT_VOWOFSILENCE))
    {
        int nHasSilence = FALSE;
        effect eTest = GetFirstEffect(oPC);
        while(GetIsEffectValid(eTest) && !nHasSilence)
        {
            if(GetEffectType(eTest) == EFFECT_TYPE_SILENCE
                && GetEffectDurationType(eTest) == DURATION_TYPE_PERMANENT
                && GetEffectCreator(eTest) == oPC
                && GetEffectSubType(eTest) == SUBTYPE_SUPERNATURAL)
            {
                nHasSilence == TRUE;
            }
            eTest = GetNextEffect(oPC);
        }
        if(!nHasSilence)
        {
            effect eSilence = EffectSilence();
            eSilence = SupernaturalEffect(eSilence);
            AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSilence, oPC));
        }
    }*/

    //Wemic
    // Skill Bonus, +8 to jump
    if(GetHasFeat(FEAT_WEMIC_JUMP_8))
    {
        SetCompositeBonus(oSkin, "WEMIC_JUMP_8", 8, ITEM_PROPERTY_SKILL_BONUS, 28);
    }

    // Metal hide - Bladeling armor restriction
    if(GetHasFeat(FEAT_METAL_HIDE))
    {
        if(GetLocalInt(oPC, "ONEQUIP") == 2)
        {
            object oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);
            int nArmorType = GetBaseAC(oItem);
            //if not light armor, then force unequip
            if(GetBaseAC(oItem) > 4)
                AssignCommand(oPC, ActionUnequipItem(oItem));

            if(DEBUG) DoDebug("race_skin (Bladeling) - Armor type: " + IntToString(GetBaseAC(oItem)));
        }
    }

    //Warforged armor restrictions
    if(GetIsWarforged(oPC))
    {
        ExecuteScript("race_warforged", oPC);
    }

    if(GetHasFeat(FEAT_SHIFTER_INSTINCTS))
    {
        SetCompositeBonus(oSkin, "ShifterInstinctSpot", 1, ITEM_PROPERTY_SKILL_BONUS, SKILL_SPOT);
        SetCompositeBonus(oSkin, "ShifterInstinctSenseMotive", 1, ITEM_PROPERTY_SKILL_BONUS, SKILL_SENSE_MOTIVE);
        SetCompositeBonus(oSkin, "ShifterInstinctListen", 1, ITEM_PROPERTY_SKILL_BONUS, SKILL_LISTEN);
    }

    if(GetHasFeat(FEAT_DRAGON_TRAINING))
        SetCompositeBonus(oSkin, "RacialDragonTrsining", 4, ITEM_PROPERTY_AC_BONUS_VS_ALIGNMENT_GROUP, RACIAL_TYPE_DRAGON);

    //natural weapons
    //replace with a feat check
    int nRace = GetRacialType(oPC);
    if(nRace==RACIAL_TYPE_MINOTAUR || nRace==RACIAL_TYPE_KRYNN_MINOTAUR)
    {
        string sResRef = "prc_mino_gore_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalSecondaryWeapon(oPC, sResRef);
    }
    else if(nRace==RACIAL_TYPE_TROLL)
    {
        string sResRef = "prc_troll_bite_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalSecondaryWeapon(oPC, sResRef);
        //primary weapon
        sResRef = "prc_claw_1d6l_";
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 2);
    }
    else if(nRace==RACIAL_TYPE_RAKSHASA)
    {
        string sResRef = "prc_raks_bite_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalSecondaryWeapon(oPC, sResRef);
        //primary weapon
        sResRef = "prc_claw_1d6l_";
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 2);
    }
    else if(nRace==RACIAL_TYPE_LIZARDFOLK)
    {
        string sResRef = "prc_lizf_bite_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalSecondaryWeapon(oPC, sResRef);
        //primary weapon
        sResRef = "prc_claw_1d6m_";
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 2);
    }
    else if(nRace==RACIAL_TYPE_TROGLODYTE)
    {
        string sResRef = "prc_lizf_bite_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalSecondaryWeapon(oPC, sResRef);
        //primary weapon
        sResRef = "prc_claw_1d6m_";
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 2);
    }
    else if(nRace==RACIAL_TYPE_TANARUKK)
    {
        string sResRef = "prc_tana_bite_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalSecondaryWeapon(oPC, sResRef);
    }
    else if(nRace==RACIAL_TYPE_WEMIC)
    {
        string sResRef = "prc_claw_1d6l_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 2);
    }
    else if(nRace==RACIAL_TYPE_ILLITHID)
    {
        string sResRef = "prc_ill_tent_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 4);
    }
   else if(nRace==RACIAL_TYPE_CENTAUR)
    {
        string sResRef = "prc_cent_hoof_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 2);
    }
    else if(nRace==RACIAL_TYPE_ASABI)
    {
        string sResRef = "prc_lizf_bite_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalSecondaryWeapon(oPC, sResRef);
    }
    else if(nRace==RACIAL_TYPE_DRAGONKIN)
    {
        //primary weapon
        string sResRef = "prc_claw_1d6l_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 2);
    }
    else if(nRace==RACIAL_TYPE_KHAASTA)
    {
        string sResRef = "prc_lizf_bite_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalSecondaryWeapon(oPC, sResRef);
    }
    else if(nRace==RACIAL_TYPE_NEZUMI)
    {
        string sResRef = "prc_lizf_bite_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalSecondaryWeapon(oPC, sResRef);
        //primary weapon
        sResRef = "prc_claw_1d6l_";
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 2);
    }
    else if(nRace==RACIAL_TYPE_POISON_DUSK)
    {
        string sResRef = "prc_lizf_bite_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalSecondaryWeapon(oPC, sResRef);
        //primary weapon
        sResRef = "prc_claw_1d6l_";
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 2);
    }
    else if(nRace==RACIAL_TYPE_HOUND_ARCHON)
    {
        string sResRef = "prc_hdarc_bite_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalSecondaryWeapon(oPC, sResRef);
        //primary weapon
        sResRef = "prc_hdarc_slam_";
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 1);
    }
    else if(nRace==RACIAL_TYPE_BLADELING)
    {
        int nSize = PRCGetCreatureSize(oPC);
        //primary weapon
        string sResRef = "prc_claw_1d6m_";
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 2);
    }
    else if(nRace==RACIAL_TYPE_DRIDER)
    {
        int nSize = PRCGetCreatureSize(oPC);
        //secondary weapon
        string sResRef = "prc_drid_bite_";
        sResRef += GetAffixForSize(nSize);
        AddNaturalSecondaryWeapon(oPC, sResRef);
    }
    else if(nRace==RACIAL_TYPE_TAER)
    {
        AddNaturalSecondaryWeapon(oPC, "prc_troll_bite_m");
        AddNaturalPrimaryWeapon(oPC, "prc_cent_hoof_s", 2);
    }
    else if(nRace==RACIAL_TYPE_BAAZ)
    {
        string sResRef = "prc_lizf_bite_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalSecondaryWeapon(oPC, sResRef);
        //primary weapon
        sResRef = "prc_claw_1d6l_";
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 2);
    }
    else if(nRace==RACIAL_TYPE_KAPAK)
    {
        string sResRef = "prc_lizf_bite_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalSecondaryWeapon(oPC, sResRef);
    }
    else if(nRace==RACIAL_TYPE_WARFORGED)
    {
        string sResRef;
        int nSize = PRCGetCreatureSize(oPC);
        //primary weapon
        sResRef = "prc_warf_slam_";
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 1);
    }
    else if(nRace==RACIAL_TYPE_WARFORGED_CHARGER)
    {
        string sResRef;
        int nSize = PRCGetCreatureSize(oPC)+1;
        //primary weapon
        sResRef = "prc_warf_slam_";
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 2);
    }    
    else if( nRace == RACIAL_TYPE_DRAY1 || // NWN Dark Sun
             nRace == RACIAL_TYPE_DRAY2 )  
    {
        string sResRef = "prc_lizf_bite_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalSecondaryWeapon(oPC, sResRef);
        //primary weapon - cheating since it needs 1d4l
        sResRef = "prc_claw_1d6l_";
        nSize--;
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 2);
    }
    else if(nRace==RACIAL_TYPE_PTERRAN)  // NWN Dark Sun
    {
        string sResRef = "prc_lizf_bite_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalSecondaryWeapon(oPC, sResRef);
        //primary weapon - cheating since it needs 1d4l
        sResRef = "prc_claw_1d6l_";
        nSize--;
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 2);
    }    
    else if(nRace==RACIAL_TYPE_GITH)  // NWN Dark Sun
    {
        // Set primary weapon 1d4 @ Medium
        string sResRef = "prc_claw_1d6l_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 2);
    }
    else if(nRace==RACIAL_TYPE_TAREK)  // NWN Dark Sun
    {
        // Set primary weapon 1d4 @ Medium
        string sResRef = "ds_tarek_slam_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 2);
    }
    else if(nRace==RACIAL_TYPE_BELGOI)  // NWN Dark Sun
    {
        // Set primary weapon 1d4 @ Medium
        string sResRef = "ds_belgoi_claw_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 2);
    }
    else if(nRace==RACIAL_TYPE_TARI)  // NWN Dark Sun
    {
        //  Set secondary creature weapon 1d3 @ Small
        string sResRef = "ds_tari_bite_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalSecondaryWeapon(oPC, sResRef);
    }
    else if(nRace == RACIAL_TYPE_AARAKOCRA)  // NWN Dark Sun
    {
        //  Set secondary creature weapon 1d3 @ Medium
        string sResRef = "ds_aarak_bite_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalSecondaryWeapon(oPC, sResRef);
        //  Set primary creature weapon 1d3 @ Medium
        sResRef = "ds_aarak_claw_";
        nSize--;
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 2);
    }
    else if(nRace == RACIAL_TYPE_THRIKREEN ||  // NWN Dark Sun
			nRace == RACIAL_TYPE_JEZ ||
			nRace == RACIAL_TYPE_TONDI ||
			nRace == RACIAL_TYPE_TOKSA ||
			nRace == RACIAL_TYPE_JHOL ||
			nRace == RACIAL_TYPE_TKEECH ||
			nRace == RACIAL_TYPE_JERAL)		
    {  
        //  Set secondary creature weapon 1d4 @ Medium
        string sResRef = "ds_kreen_bite_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalSecondaryWeapon(oPC, sResRef);
        //  Set primary creature weapon 1d4 @ Medium
        sResRef = "ds_kreen_claw_";
        nSize--;
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 4);
    }

    else if(nRace==RACIAL_TYPE_NAZTHARUNE_RAKSHASA)
    {
        string sResRef;
        int nSize = PRCGetCreatureSize(oPC);
        //primary weapon
        sResRef = "prc_claw_1d6l_";
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 2);
    }
    else if(nRace==RACIAL_TYPE_SATYR)
    {
        string sResRef = "prc_cent_hoof_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalSecondaryWeapon(oPC, sResRef);
    }
    else if(nRace==RACIAL_TYPE_VILETOOTH_LIZARDFOLK)
    {
        string sResRef = "prc_vtth_bite_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalSecondaryWeapon(oPC, sResRef);
        //primary weapon
        sResRef = "prc_claw_1d6m_";
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 2);
    }
    else if(nRace==RACIAL_TYPE_FERAL_GARGUN)
    {
        string sResRef = "prc_claw_1d6m_";
        int nSize = PRCGetCreatureSize(oPC);
        sResRef += GetAffixForSize(nSize);
        AddNaturalPrimaryWeapon(oPC, sResRef, 2);
    }    

    //Draconian on-death effects
    if(nRace == RACIAL_TYPE_BOZAK)
    {
        ExecuteScript("race_deaththroes", oPC);
        if(GetCreatureWingType(oPC) != CREATURE_WING_TYPE_NONE)
            return;
        else SetCreatureWingType(PRC_WING_TYPE_DRAGON_BRONZE, oPC);
    }
    if(nRace == RACIAL_TYPE_BAAZ)
    {
        ExecuteScript("race_deaththroes", oPC);
        if(GetCreatureWingType(oPC) != CREATURE_WING_TYPE_NONE)
            return;
        else SetCreatureWingType(PRC_WING_TYPE_DRAGON_BRASS, oPC);
    }
    if(nRace == RACIAL_TYPE_KAPAK)
    {
        ExecuteScript("race_deaththroes", oPC);
        if(GetCreatureWingType(oPC) != CREATURE_WING_TYPE_NONE)
            return;
        else SetCreatureWingType(PRC_WING_TYPE_DRAGON_COPPER, oPC);
    }

    //Check only if not polymorphed or shifted
    if(!GetIsPolyMorphedOrShifted(oPC))
    {
        //Enforce female Nymphs
        if(nRace == RACIAL_TYPE_NYMPH && GetGender(oPC) != GENDER_FEMALE)
            SetCreatureAppearanceType(oPC, 126);

        //Shifter traits
        if(GetHasFeat(FEAT_SHIFTER_SHIFTING))
        {
            int nNumTraits = 0;
            nNumTraits += GetHasFeat(FEAT_SHIFTER_WILDHUNT) +
                 GetHasFeat(FEAT_SHIFTER_RAZORCLAW) +
                 GetHasFeat(FEAT_SHIFTER_LONGTOOTH) +
                 GetHasFeat(FEAT_SHIFTER_LONGSTRIDE) +
                 GetHasFeat(FEAT_SHIFTER_BEASTHIDE) +
                 GetHasFeat(FEAT_SHIFTER_DREAMSIGHT) +
                 GetHasFeat(FEAT_SHIFTER_GOREBRUTE);
            if(GetHasFeat(FEAT_EXTRA_SHIFTER_TRAIT))
                nNumTraits--;

            if(!nNumTraits)
                StartDynamicConversation("race_shfttrt_con", oPC, DYNCONV_EXIT_NOT_ALLOWED, FALSE, TRUE, oPC);
        }

        //Tinker Gnome guilds
        if(GetHasFeat(FEAT_LIFEPATH) &&
        !(GetHasFeat(FEAT_CRAFTGUILD) || GetHasFeat(FEAT_TECHGUILD) || GetHasFeat(FEAT_SAGEGUILD)))
            StartDynamicConversation("race_lifepthconv", oPC, DYNCONV_EXIT_NOT_ALLOWED, FALSE, TRUE, oPC);

        //Spirit Folk heritages
        if(GetRacialType(oPC) == RACIAL_TYPE_SPIRIT_FOLK &&
         !(GetHasFeat(FEAT_BONUS_BAMBOO) || GetHasFeat(FEAT_BONUS_RIVER) || GetHasFeat(FEAT_BONUS_SEA) || GetHasFeat(FEAT_BONUS_MOUNTAIN)))
            StartDynamicConversation("race_spiritfkcon", oPC, DYNCONV_EXIT_NOT_ALLOWED, FALSE, TRUE, oPC);
    }
    
    // Movement Speed bonuses
    if (GetRacialType(oPC) == RACIAL_TYPE_CENTAUR)
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectMovementSpeedIncrease(66), oPC);
}