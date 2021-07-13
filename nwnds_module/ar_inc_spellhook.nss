#include "nw_i0_spells"
#include "x2_i0_spells"
#include "x2_inc_switches"
#include "ar_inc_defraze"
#include "divinetenser_inc"
//#include "ar_debug"



const int CONCENTRATION_DIFFICULTY = 10;
const float DISTANCE_TO_HOSTILE = 5.0;
const int SPELL_BACKLASH = 2020;
const int SPELL_CONSERVATION = 2018;
const int SPELL_STEALENERGY=2021;
const int SPELL_OBSIDIANDEATH=2022;
const int SPELL_CREATE_MAGIC_TATTOO=2243;

const string CONSERVE_SPELL_FAIL_TEXT = "Spell Failed: The land has been protected from defiling.";
const string AR_SPELL_CLASS_TEXT = "You are not of the required class to cast this spell";

// exits spell hook if nSpellID is in list
int NC_ExitIfSpell(int nSpellID);

//returns true if oPC has any levels in NClass, CLASS_TYPE_*
int NC_GetHasClass(int nCLASS, object oPC);

//Dose the preservers backlash effect on a subject defiler
// oPC: creature to effect
void DoBacklashEffect(object oPC);

//Conservation Spell Fail
//Target must make a will save in order to cast spell
void DoConservationEffect(object oPC);

//Spell Restrictions for Defiler and Preserver
int NCSpellCheck(int nSpellID, int nCasterClass);



void main()
{
    object oMagicItem = GetSpellCastItem();
    object oPC = OBJECT_SELF;
    if(GetLocalInt(OBJECT_SELF,"tensers_transformation") &&
      (GetIsObjectValid(oMagicItem) &&
       GetBaseItemType(oMagicItem) == BASE_ITEM_SPELLSCROLL ||
       GetBaseItemType(oMagicItem) == BASE_ITEM_RING ||
       GetBaseItemType(oMagicItem) == BASE_ITEM_MISCWIDE ||
       GetBaseItemType(oMagicItem) == BASE_ITEM_MISCTHIN ||
       GetBaseItemType(oMagicItem) == BASE_ITEM_MISCTALL ||
       GetBaseItemType(oMagicItem) == BASE_ITEM_MISCSMALL ||
       GetBaseItemType(oMagicItem) == BASE_ITEM_MISCMEDIUM ||
       GetBaseItemType(oMagicItem) == BASE_ITEM_MISCLARGE ||
       GetBaseItemType(oMagicItem) == BASE_ITEM_MAGICWAND ||
       GetBaseItemType(oMagicItem) == BASE_ITEM_MAGICSTAFF ||
       GetBaseItemType(oMagicItem) == BASE_ITEM_MAGICROD ||
       GetBaseItemType(oMagicItem) == BASE_ITEM_ENCHANTED_WAND ||
       GetBaseItemType(oMagicItem) == BASE_ITEM_ENCHANTED_SCROLL ||
       GetBaseItemType(oMagicItem) == BASE_ITEM_CLOAK ||
       GetBaseItemType(oMagicItem) == BASE_ITEM_BOOTS ||
       GetBaseItemType(oMagicItem) == BASE_ITEM_BOOK ||
       GetBaseItemType(oMagicItem) == BASE_ITEM_AMULET ||
       GetBaseItemType(oMagicItem) == BASE_ITEM_BELT ||
       GetBaseItemType(oMagicItem) == BASE_ITEM_BRACER ||
       GetBaseItemType(oMagicItem) == BASE_ITEM_GEM ||
       GetBaseItemType(oMagicItem) == BASE_ITEM_TORCH ||
       GetBaseItemType(oMagicItem) == BASE_ITEM_GLOVES))
    {
        DelayCommand(0.2, CheckHasTensersEffects(oPC));
        DelayCommand(0.3, CheckDivinePowerEffects(oPC));
        SendMessageToPC(OBJECT_SELF,"You cannot use magic or magical items while "+
        "under the effects of Tenser's Transformation.");
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect
        (VFX_IMP_MAGIC_RESISTANCE_USE),OBJECT_SELF);
        SetModuleOverrideSpellScriptFinished();
    }
    //ar_debug("starting SpellHook", OBJECT_SELF);
    location lCasterLocation=GetLocation(OBJECT_SELF);
    int nCasterClass = GetLastSpellCastClass();
    int bCanCastSpell = NCSpellCheck(GetLastSpell(),nCasterClass);
    //----------------------------------------------------------------------
    // Add Defiling Aura Effect, Backlash, Conservation
    // For athas reborn PW
    // Created By NiteCap@gmail.com
    //----------------------------------------------------------------------

    //if Spell was cast by pc or creature
    //then we do Aura, Backlash, and conservation effects
    // if Spell is  cast from an item, exit
    int nSpellID = GetSpellId ();

    if (GetIsObjectValid(GetSpellCastItem()))
    {

    if(GetIsPC(oPC))
    {
     // firstly check that the spell is being cast from a scroll
        object oScroll = GetSpellCastItem();
        if(GetIsObjectValid(oScroll) && GetBaseItemType(oScroll) == BASE_ITEM_SPELLSCROLL)
        {
            // now check are we in combat
            if(GetIsInCombat(oPC))
            {
                // now find the nearest hostile
                object oHostile = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oPC);
                if(GetIsObjectValid(oHostile))
                {
                    // check the distance to the nearest hostile
                    if(GetDistanceBetween(oPC, oHostile) <= DISTANCE_TO_HOSTILE)
                    {
                        // take in to account the innate spell level of the scroll
                        // I am using des_crft_spells.2da Innate Level column here, not (as would be correct)
                        // the IPPR_Spells.2da InnateLvl column, because some of the scrolls in
                        // the game ( i.e. light) would not be useable (DC 30+)
                        int nInnateLevel = StringToInt(Get2DAString("des_crft_spells", "Level", nSpellID));
                        // do a concentration check
                        if (!GetIsSkillSuccessful(oPC, SKILL_CONCENTRATION, CONCENTRATION_DIFFICULTY + nInnateLevel))
                        {
                            SetModuleOverrideSpellScriptFinished();
                        }
                    }
                }
            }
        }
    }
    return;
 }

   // exits spellhook if nSpellID is in list
  // or if we have effects of nSpellID.
   if(NC_ExitIfSpell(nSpellID)){return;}


  int nSpellLevel= StringToInt(Get2DAString("spells", "Innate",nSpellID));


    //NC:EDIT
    //Spell Restrictions for Defiler and Preserver
     if(!bCanCastSpell)
     {
      FloatingTextStringOnCreature(AR_SPELL_CLASS_TEXT,OBJECT_SELF,TRUE);
      SetModuleOverrideSpellScriptFinished();
      return;
     }
    //NC:EDIT

    if (nCasterClass == CLASS_TYPE_SORCERER ||
        nCasterClass == 43 )
                {
                //ar_debug("starting Aura effects", OBJECT_SELF);
                //Add conservation Check
                DoConservationEffect(oPC);
                DoRaze(nSpellID, lCasterLocation, OBJECT_SELF);
                //add check for Backlash
                DoBacklashEffect(OBJECT_SELF);
                }
    //---------------------------------------------------------------------------------------

}

void DoBacklashEffect(object oTarget)
{
    int nHasBackLash = GetLocalInt(oTarget,"BackLash");
    int nDice = GetLocalInt(oTarget,"BackLashDice");

    if(!NC_GetHasClass(CLASS_TYPE_SORCERER,oTarget))
        {
        return;
        }

    if(nHasBackLash==1)
            {
            effect eDamage = EffectDamage(d6(nDice));
            effect eVis = EffectVisualEffect(VFX_IMP_PULSE_NEGATIVE);
            effect eLink = EffectLinkEffects(eDamage, eVis);
            object oAOE = GetLocalObject(oTarget, "BackLashAOE");

            if(GetIsObjectValid(oAOE))
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,oTarget);
                    DeleteLocalInt(oTarget, "BackLash");
                    DeleteLocalInt(oTarget, "BackLashDice");
                    DeleteLocalObject(oTarget, "BackLashAOE");
                    DestroyObject(oAOE);
                }
                else
                {
                    DeleteLocalInt(oTarget, "BackLash");
                    DeleteLocalInt(oTarget, "BackLashDice");
                    DeleteLocalObject(oTarget, "BackLashAOE");
                }
            return;
           }
      }


void DoConservationEffect(object oPC)
{
 object oCaster = GetLocalObject(oPC,"AR_CONSERVE_CASTER");
 int nDC = GetLocalInt(oPC,"AR_CONSERVE");

    if(GetIsObjectValid(oCaster))
    {
        if(WillSave(oPC, nDC,SAVING_THROW_TYPE_SPELL, oCaster)==0)
            {
            FloatingTextStringOnCreature(CONSERVE_SPELL_FAIL_TEXT,oPC,FALSE);
            SetModuleOverrideSpellScriptFinished();
            return;
            }

    }

}

int NCSpellCheck(int nSpellID, int nCasterClass)
{
    int nReturn=TRUE;
    switch(nCasterClass)
        {
            case CLASS_TYPE_WIZARD:
                {
                  if(nSpellID == SPELL_OBSIDIANDEATH)nReturn==FALSE;
                  if(nSpellID == SPELL_STEALENERGY)nReturn==FALSE;
                }
            case CLASS_TYPE_SORCERER:
                {
                  if(nSpellID == SPELL_CONSERVATION)nReturn==FALSE;
                  if(nSpellID == SPELL_BACKLASH)nReturn==FALSE;
                }
           default: {nReturn==TRUE;}
        }
   return nReturn;

}

int NC_GetHasClass(int nCLASS, object oPC)
 {

        if (GetLevelByClass(nCLASS, oPC)>=1)
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
 }

// exits spell hook if nSpellID is in list
int NC_ExitIfSpell(int nSpellID)
{
  if((nSpellID == SPELL_BIGBYS_INTERPOSING_HAND) ||
     (nSpellID == SPELL_BIGBYS_GRASPING_HAND) ||
     (nSpellID == SPELL_BIGBYS_FORCEFUL_HAND) ||
     (nSpellID == SPELL_BIGBYS_CRUSHING_HAND) ||
     (nSpellID == SPELL_ETHEREALNESS) ||
     (nSpellID == SPELL_SHADOW_CONJURATION_INIVSIBILITY) ||
     (nSpellID == SPELL_INVISIBILITY) ||
     (nSpellID == SPELL_CREATE_MAGIC_TATTOO) ||
     (nSpellID == SPELL_INVISIBILITY_SPHERE) ||
     (nSpellID == SPELL_SANCTUARY) ||
     (nSpellID == SPELL_IMPROVED_INVISIBILITY))return TRUE;
     return FALSE;
}
