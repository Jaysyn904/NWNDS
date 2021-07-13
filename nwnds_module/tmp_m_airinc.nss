//::///////////////////////////////////////////////
//:: Name           Air Incarnation template script
//:: FileName       tmp_m_airinc.nss
//:: 
//:://////////////////////////////////////////////
/*CREATING AN ELEMENTAL INCARNATION
Elemental incarnation is an inherited template that can be added to any corporeal aberration, animal, magical beast, plant, or vermin (referred to hereafter as the base creature).

An elemental incarnation uses all the base creature‘s statistics and abilities except as noted here.

Size and Type: The creature‘s type changes to elemental, and the creature gains one or more elemental subtypes. Size is unchanged. Elemental incarnations encountered on the Material Plane have the extraplanar
subtype.

Hit Dice: Change base creature‘s racial Hit Dice to d8s.  Do not change class Hit Dice. (Possible?)

Attack: An elemental incarnation retains all the special attacks of the base creature and also gains special attacks depending on its elemental kind.

Special Qualities: An elemental incarnation retains all the special qualities of the base creature and also gains the following.

* Darkvision out to 60 feet.

* Immunity to poison, sleep effects, paralysis, and stunning.

* Not subject to critical hits or flanking.

* Unlike most other living creatures, an elemental does not have a dual nature—its soul and body form one unit.  When an elemental is slain, no soul is set loose. Spells that restore souls to their bodies, such as raise dead, reincarnate, and resurrection, don‘t work on an elemental.  It takes a different magical effect, such as limited wish, wish, miracle, or true resurrection, to restore it to life

* Damage reduction (see the table below).  If the base creature already has damage reduction, use the better value. If an air incarnation gains damage reduction, its natural weapons are treated as magic
weapons for the purpose of overcoming damage reduction.

Hit Dice		Damage Reduction
1–3 			—
4–11 			5/magic
12 or more 		10/magic

Special Attacks: An air incarnation retains all the special attacks of the base creature and also gains the following special attacks.

Windstorm (Ex): As a standard action, an air incarnation can create a windstorm with a radius depending on its Hit Dice (see the table below) up to 60 feet away. The storm lasts as long as the incarnation concentrates and has the normal effects of a windstorm, except that ranged attacks are possible in its area: The windstorm imposes a –8 penalty on ranged attack rolls and Listen checks, extinguishes unprotected flames, and has a 75% chance of extinguishing protected flames each round.

Skills: If the creature has an Intelligence of at least 3, it speaks Auran.

Abilities: Change from the base creature as follows: Strength –2, Dexterity +4, Constitution –2

Challenge Rating: HD 3 or less, as base creature; HD  4 to 7, as base creature +1; HD 8 or more, as base creature +2.

Alignment: Usually neutral.

Level Adjustment: Same as the base creature +4.

*/

#include "prc_inc_template"
#include "prc_inc_natweap"
#include "prc_inc_combat"

void main()
{
    int nEvent = GetRunningEvent();
    if(DEBUG) DoDebug("tmp_m_airinc running, event: " + IntToString(nEvent));

    // Get the PC. This is event-dependent
    object oPC;
    switch(nEvent)
    {
        case EVENT_ITEM_ONHIT:          oPC = OBJECT_SELF;               break;
        case EVENT_ONPLAYEREQUIPITEM:   oPC = GetItemLastEquippedBy();   break;
        case EVENT_ONPLAYERUNEQUIPITEM: oPC = GetItemLastUnequippedBy(); break;
        case EVENT_ONHEARTBEAT:         oPC = OBJECT_SELF;               break;

        default:
            oPC = OBJECT_SELF;
    }

    object oItem;
	object oSkin = GetPCSkin(oPC);
	itemproperty ipIP;

    // We aren't being called from any event, instead from EvalPRCFeats
    if(nEvent == FALSE)
    {
	
		// Make Air Incarnation
		ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_IMMUNITY_CRITICAL);
 	   	IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
		
 	   	ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_IMMUNITY_SNEAKATTACK);
 	   	IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
		
		ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_IMMUNITY_PARALYSIS);
		IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
		
		ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_IMMUNITY_TO_SLEEP);
 	   	IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
		
		ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_IMMUNITY_POISON);
 	   	IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
		
		SetLocalInt(oPC, "NOSTUN", 1);
		
		// Set Damage Reduction
		if (GetHitDice(oPC) > 11) 
			{
				ipIP = ItemPropertyDamageReduction(IP_CONST_DAMAGEREDUCTION_1, IP_CONST_DAMAGESOAK_10_HP);
			}
		else if (GetHitDice(oPC) > 3) 
			{
				ipIP = ItemPropertyDamageReduction(IP_CONST_DAMAGEREDUCTION_1, IP_CONST_DAMAGESOAK_5_HP);
			}
			
		IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
	
		//Abilities
		SetCompositeBonus(oSkin, "Template_AirInc_str", -2, ITEM_PROPERTY_ABILITY_BONUS, IP_CONST_ABILITY_STR);
		SetCompositeBonus(oSkin, "Template_AirInc_dex", 4, ITEM_PROPERTY_ABILITY_BONUS, IP_CONST_ABILITY_DEX);
		SetCompositeBonus(oSkin, "Template_AirInc_con", -2, ITEM_PROPERTY_ABILITY_BONUS, IP_CONST_ABILITY_CON);
		
		//feats
		ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_WEAPON_PROF_CREATURE);
 	   	IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
		ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_IMPROVED_UNARMED_STRIKE);
 	   	IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE); 	   	
		
		//Natural Attacks
 	   	string sResRef = "prc_raks_bite_";
 	   	int nSize = PRCGetCreatureSize(oPC);
 	   	sResRef += GetAffixForSize(nSize);
 	   	AddNaturalSecondaryWeapon(oPC, sResRef);
 	   	//primary weapon
 	   	sResRef = "prc_claw_1d6l_";
 	   	sResRef += GetAffixForSize(nSize);
 	   	AddNaturalPrimaryWeapon(oPC, sResRef, 2);
	
		//make Gravetouched undead
		ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_UNDEAD_HD);
 	   	IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
		
 	   	ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_IMMUNITY_ABILITY_DECREASE);
 	   	IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
		
 	   	ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_IMMUNITY_CRITICAL);
 	   	IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
		
 	   	ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_IMMUNITY_DEATH);
 	   	IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
		
 	   	ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_IMMUNITY_DISEASE);
 	   	IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
		
 	   	ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_IMMUNITY_MIND_SPELLS);
 	   	IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
		
 	   	ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_IMMUNITY_PARALYSIS);
 	   	IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
		
 	   	ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_IMMUNITY_POISON);
 	   	IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
		
 	   	ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_IMMUNITY_SNEAKATTACK);
 	   	IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
		
 	   	ipIP = ItemPropertyDamageImmunity(IP_CONST_DAMAGETYPE_NEGATIVE, IP_CONST_DAMAGEIMMUNITY_100_PERCENT);
 	   	IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);

        // Hook in the events, needed from level 1 for Skirmish
        if(DEBUG) DoDebug("tmp_m_gravetouch: Adding eventhooks");
        AddEventScript(oPC, EVENT_ONPLAYEREQUIPITEM,   "tmp_m_gravetouch", TRUE, FALSE);
        AddEventScript(oPC, EVENT_ONPLAYERUNEQUIPITEM, "tmp_m_gravetouch", TRUE, FALSE);
        AddEventScript(oPC, EVENT_ONHEARTBEAT,         "tmp_m_gravetouch", TRUE, FALSE);
    }
    // We're being called from the OnHit eventhook
    else if(nEvent == EVENT_ITEM_ONHIT)
    {
        oItem          = GetSpellCastItem();
        object oTarget = PRCGetSpellTargetObject();
        if(DEBUG) DoDebug("tmp_m_gravetouch: OnHit:\n"
                        + "oPC = " + DebugObject2Str(oPC) + "\n"
                        + "oItem = " + DebugObject2Str(oItem) + "\n"
                        + "oTarget = " + DebugObject2Str(oTarget) + "\n"
                          );
	    //FloatingTextStringOnCreature(GetName(oItem)+" is OnHit Item for Gravetouched", oPC, FALSE);
		int nDC = 10 + GetHitDice(oPC)/2 + GetAbilityModifier(ABILITY_CHARISMA, oPC);
		if (oItem == GetItemInSlot(INVENTORY_SLOT_CWEAPON_B, oPC))
		{
			// Disease bite
            if(!PRCMySavingThrow(SAVING_THROW_FORT, oTarget, nDC, SAVING_THROW_TYPE_DISEASE)) ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDisease(DISEASE_GHOUL_ROT), oTarget);
		}
		// Can't paralyze elves
		if (GetIsCreatureWeapon(oItem) && MyPRCGetRacialType(oTarget) != RACIAL_TYPE_ELF)
		{
            if(!PRCMySavingThrow(SAVING_THROW_FORT, oTarget, nDC, SAVING_THROW_TYPE_NONE)) ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectParalyze(), oTarget, RoundsToSeconds(d4()+1));		
		}
    }// end if - Running OnHit event
    // We are called from the OnPlayerEquipItem eventhook. Add OnHitCast: Unique Power to oPC's weapon
    else if(nEvent == EVENT_ONPLAYEREQUIPITEM)
    {
        oPC   = GetItemLastEquippedBy();
        oItem = GetItemLastEquipped();
        if(DEBUG) DoDebug("tmp_m_gravetouch - OnEquip\n"
                        + "oPC = " + DebugObject2Str(oPC) + "\n"
                        + "oItem = " + DebugObject2Str(oItem) + "\n"
                          );
		if (oItem == GetItemInSlot(INVENTORY_SLOT_CWEAPON_B, oPC))
		{
            IPSafeAddItemProperty(oItem, ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_ONHIT_UNIQUEPOWER, 1), 99999.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
	        AddEventScript(oItem, EVENT_ITEM_ONHIT, "tmp_m_gravetouch", TRUE, FALSE);		
		}
		if (oItem == GetItemInSlot(INVENTORY_SLOT_CWEAPON_R, oPC))
		{
            IPSafeAddItemProperty(oItem, ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_ONHIT_UNIQUEPOWER, 1), 99999.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
	        AddEventScript(oItem, EVENT_ITEM_ONHIT, "tmp_m_gravetouch", TRUE, FALSE);		
		}
		if (oItem == GetItemInSlot(INVENTORY_SLOT_CWEAPON_L, oPC))
		{
            IPSafeAddItemProperty(oItem, ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_ONHIT_UNIQUEPOWER, 1), 99999.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
	        AddEventScript(oItem, EVENT_ITEM_ONHIT, "tmp_m_gravetouch", TRUE, FALSE);
	        //AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_POSITIVE, IP_CONST_DAMAGEBONUS_2), oItem, 99999.0);
		}		
    }
    // We are called from the OnPlayerUnEquipItem eventhook. Remove OnHitCast: Unique Power from oPC's weapon
    else if(nEvent == EVENT_ONPLAYERUNEQUIPITEM)
    {
        oPC   = GetItemLastUnequippedBy();
        oItem = GetItemLastUnequipped();
        if(DEBUG) DoDebug("tmp_m_gravetouch - OnUnEquip\n"
                        + "oPC = " + DebugObject2Str(oPC) + "\n"
                        + "oItem = " + DebugObject2Str(oItem) + "\n"
                          );

        // Only applies to creature weapons
        if(GetIsCreatureWeapon(oItem))
        {
            // Remove the temporary OnHitCastSpell: Unique
            RemoveEventScript(oItem, EVENT_ITEM_ONHIT, "tmp_m_gravetouch", TRUE, FALSE);
            RemoveSpecificProperty(oItem, ITEM_PROPERTY_ONHITCASTSPELL, IP_CONST_ONHIT_CASTSPELL_ONHIT_UNIQUEPOWER, 0, 1, "", -1, DURATION_TYPE_TEMPORARY);           
        }
    }  
    else if(nEvent == EVENT_ONHEARTBEAT)
    {
        if(DEBUG) DoDebug("tmp_m_gravetouch - OnHB\n"
                        + "oPC = " + DebugObject2Str(oPC) + "\n"
                        + "oItem = " + DebugObject2Str(oItem) + "\n"
                          ); 
     /*   FloatingTextStringOnCreature(GetName(oPC)+" is heartbeat", oPC, FALSE);                  
        oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B, oPC);                  
		if (GetIsObjectValid(oItem))
		{
           // IPSafeAddItemProperty(oItem, ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_ONHIT_UNIQUEPOWER, 1), 99999.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
	       // AddEventScript(oItem, EVENT_ITEM_ONHIT, "tmp_m_gravetouch", TRUE, FALSE);
	        FloatingTextStringOnCreature(GetName(oItem)+" is in Creature Slot Bite", oPC, FALSE);
		}
        oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R, oPC);                  
		if (GetIsObjectValid(oItem))
		{
           // IPSafeAddItemProperty(oItem, ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_ONHIT_UNIQUEPOWER, 1), 99999.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
	       // AddEventScript(oItem, EVENT_ITEM_ONHIT, "tmp_m_gravetouch", TRUE, FALSE);	
	        FloatingTextStringOnCreature(GetName(oItem)+" is in Creature Slot Right", oPC, FALSE);
		}
        oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L, oPC);                  
		if (GetIsObjectValid(oItem))
		{
           // IPSafeAddItemProperty(oItem, ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_ONHIT_UNIQUEPOWER, 1), 99999.0, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, FALSE);
           // AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_ONHIT_UNIQUEPOWER, 1), oItem, 99999.0);
	       // AddEventScript(oItem, EVENT_ITEM_ONHIT, "tmp_m_gravetouch", TRUE, FALSE);	
	        FloatingTextStringOnCreature(GetName(oItem)+" is in Creature Slot Left", oPC, FALSE);
	        
			// No equipping magical items, and make sure to ignore creature items
			itemproperty ip = GetFirstItemProperty(oItem);
			while(GetIsItemPropertyValid(ip))
			{
				FloatingTextStringOnCreature(ItemPropertyToString(ip)+" is on Creature Slot Left", oPC, FALSE);
				ip = GetNextItemProperty(oItem);
			}	        
			
			//AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertyMonsterDamage(iMonsterDamage),oWeapL);
			
			//AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_POSITIVE, IP_CONST_DAMAGEBONUS_10), oItem, 99999.0);
		}*/
    }    
}