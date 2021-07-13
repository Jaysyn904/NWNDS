//::///////////////////////////////////////////////
//:: Name: OnDeath_Rumagon
//:: Copyright (c) 2012 Athas Reborn
//:://////////////////////////////////////////////
/*
    Rumagon's OnDeath script
*/
//:://////////////////////////////////////////////
//:: Created By: DM Heatstroke
//:: Created On: May 23 2012
//:://////////////////////////////////////////////

// Necromancy  101 /////////
#include "_inc_livingdead_"
#include "_inc_battlecry_"
////////////////////////////
#include "NW_I0_SPELLS"
#include "nw_i0_plot"
#include "nw_j_assassin"

void PartyGold(object oPC);

void dsoCreateItemOnObject(string sItemTemplate, object oTarget = OBJECT_SELF, int nStackSize = 1)
      {
      // Make sure it's a blueprint by trimming to 16 and lowercasing it
      // SpeakString("Will create item "+sItemTemplate+" stack "+IntToString(nStackSize));
      sItemTemplate = GetSubString(sItemTemplate, 0, 16);
      sItemTemplate = GetStringLowerCase(sItemTemplate);
      //SpeakString("Attempting to create item "+sItemTemplate+" stack "+IntToString(nStackSize));
      object oItem = CreateItemOnObject(sItemTemplate, oTarget, nStackSize);
      }



void main()
{
{
// initialise local variables
string sItem;
int nStackSize = 1;
int nKillFlag = GetLocalInt(GetLastKiller(), "KILL_TASK_FLAG");
object oPC = GetLastKiller();
string sTagSelf = GetTag(OBJECT_SELF);
string sTagTarget = GetLocalString(oPC, "KILL_TASK_TARGET");
PartyGold(oPC);
{
    if(GetIsPC(GetLastKiller()) &&
       GetLocalInt(GetLastKiller(),"NW_JOURNAL_ENTRY"  + "jt_bloodletter") == 3)
    {
 AddJournalQuestEntry ("jt_bloodletter", 4, oPC);
    }
}
    SpeakString("Y-you never find The Bloodletter you...fool...", TALKVOLUME_TALK);
// check for correct kill task target and complete
if(sTagSelf == sTagTarget && nKillFlag == 1) {
SetLocalInt(oPC, "KILL_TASK_FLAG", 2);
AddJournalQuestEntry("kt_journal_01", 99, oPC);
}

    object oLastOpener = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC);
    object oChest =  GetNearestObjectByTag("BloodletterChest");
    if ((GetFirstItemInInventory(oChest) == OBJECT_INVALID) && (GetLocalInt(oLastOpener, "nGotBloodletter") != 1)){
    SetLocalInt(oLastOpener, "nGotBloodletter", 1);
   // GenerateHighWeapon(oLastOpener,oChest);
    int nRandom = d20();
    switch (nRandom)
    {
    case 1: sItem = "at_itpclk_ruby";  break;                     // Sister Ruby's Shawl
    case 2: sItem = "ar_wswpgs_fire03";  break;                   // Imbued Greatsword
    case 3: sItem = "ar_itmclk_lust";  break;                     // Defilers Lust
    case 4: sItem = "ar_itmbts_speed";  break;                    // Sandals of Speed
    case 5: sItem = "ar_helm_divcasq";  break;                    // Divine Casque
    case 6: sItem = "ar_itmglv_defile";  break;                   // Defiler's Guantlets
    case 7: sItem = "ar_wbwmsh_hearts";  break;                   // Heartseeker Bow
    case 8: sItem = "ar_wamar_hrtskr"; nStackSize = 99;  break;   // 99 Heartseeker Arrows
    case 9: sItem = "ar_apmdbp_isteel";  break;                   // Imbued Steel Breastplate
    case 10: sItem = "ar_amhvhp_antiqu";  break;                  // Antique Plate Mail
    case 11: sItem = "ar_helm_antique";  break;                   // Antique Helm
    case 12: sItem = "ar_itmbts_shadow";  break;                  // Shadow Boots
    case 13: sItem = "ar_waxpwk_imbued";  break;                  // Imbued Widow's Knife
    case 14: sItem = "ar_wblmhl_numbsk";  break;                  // Numbskull
    case 15: sItem = "ar_amclrb_underw";  break;                  // Robes of the Underworld
    case 16: sItem = "ar_itmblt_champ";  break;                   // Champion's Buckle
    case 17: sItem = "ar_wplmsc_moon";  break;                    // Scythe of the Moon
    case 18: sItem = "ar_waxmgr_winpre";  break;                  // Winter's Prelude
    case 19: sItem = "ar_itpglv_master";  break;                  // Villichi Master Gauntlets
    case 20: sItem = "ar_itmglv_wizard";  break;                  // Preserver's Gloves

    }
    dsoCreateItemOnObject(sItem,oChest,nStackSize);
    SetLocked(oChest,TRUE);
}

}
    int nInsanity  = GetLocalInt(OBJECT_SELF,"INSANITY");
    if(nInsanity)
        {
            object oCaster = OBJECT_SELF;
            object oTarget = GetLastKiller();
            effect eConfuse = EffectConfused();
            effect eImpact = EffectVisualEffect(VFX_FNF_LOS_NORMAL_20);
            effect eVis = EffectVisualEffect(VFX_IMP_CONFUSION_S);
            effect eMind = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED);
            effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
            effect eLink = EffectLinkEffects(eMind, eConfuse);
            eLink = EffectLinkEffects(eLink, eDur);
            eLink = SupernaturalEffect(eLink);

            // Get oCaster's DC
            int nCreCHAMod = GetAbilityModifier(ABILITY_CHARISMA, oCaster);
            int nCreHD = GetHitDice (oCaster);
            int nDC = (10 + (nCreHD/2) + nCreCHAMod);

            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpact, GetSpellTargetLocation());

            if ( !MySavingThrow(SAVING_THROW_WILL, oTarget, nDC, SAVING_THROW_TYPE_MIND_SPELLS, oCaster))
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);           // Apply Viz
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oTarget);
                    AssignCommand(oTarget,SpeakString("*The "+GetName(oCaster)+" has driven you insane!*"));
                }
        }

    int nShadowy = GetLocalInt(OBJECT_SELF,"SHADOWY");
    if (nShadowy)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }

    int nStony = GetLocalInt(OBJECT_SELF,"STONY");
    if (nStony)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_PROT_STONESKIN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }

    int nWoody = GetLocalInt(OBJECT_SELF,"WOODY");
    if (nWoody)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_PROT_BARKSKIN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }

            int nIcy = GetLocalInt(OBJECT_SELF,"ICY");
    if (nIcy)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_ICESKIN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }

    int nGlow = GetLocalInt (OBJECT_SELF,"GLOW_COLOR");
    if (nGlow == 1)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_BLUE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 2)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_BROWN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 3)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_GREEN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 4)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_GREY);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 5)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_BLUE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 6)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_BROWN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 7)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_GREEN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 8)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_ORANGE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 9)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_PURPLE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 10)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_RED);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 11)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_YELLOW);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 12)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_ORANGE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 13)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_PURPLE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 14)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_RED);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 15)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_WHITE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 16)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_YELLOW);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }

    ExecuteScript("nw_c2_default7", OBJECT_SELF);
    // Necromancy 101 ///////////////////////
    DoDeathCry();
    if (UndeadCheck(GetLastKiller())) return;
    /////////////////////////////////////////
}
  void PartyGold(object oPC)
    {
      int nHD = GetHitDice(OBJECT_SELF);
      int nGold = ((nHD - 3) * 4) + d20();

    // This code shows how you can cycle through all the party members of the first PC
    object oPartyMember = GetFirstFactionMember(oPC, TRUE);
    int nMembers = 0;
    while (GetIsObjectValid(oPartyMember) == TRUE)
      {
        // count party members
        nMembers++;
        oPartyMember = GetNextFactionMember(oPartyMember, TRUE);
      }

  if (nMembers < 1)
      nMembers = 1;
  int nShare = (nGold / nMembers);

  oPartyMember = GetFirstFactionMember(oPC, TRUE);
  while (GetIsObjectValid(oPartyMember) == TRUE)
    {
      GiveGoldToCreature(oPartyMember, nShare);
      oPartyMember = GetNextFactionMember(oPartyMember, TRUE);
    }
  }
