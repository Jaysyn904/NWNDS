 //::2-15-07
//::BUG FIX
//:: Radius was giving 10m +5m per level, fixed to give 10' + 5' per level.
//:: added checks for bigbys spells to exit if one is cast to stop.

//change this const to the index in spells.2da of the main defiliing aura spell
const int SPELL_EFFECT_DEFAURA=99999;
const int SPELL_EFFECT_TAINTAURA=99998;
// For plant creature type
const int RACIAL_TYPE_PLANT=30;
//new visuals
const int VFX_DUR_FLAMING_SPHERE=821;
const int VFX_FNF_VAMPIRIC_DRAIN_PRC=822;
const int VFX_FNF_BLASPHEMY=823;
const int VFX_DUR_SHIELD_OF_LAW=824;
const int VFX_DUR_UNHOLY_AURA_SMP=825;
const int VFX_DUR_HOLY_AURA_SMP=826;
const int VFX_DUR_PROT_IRON_SKIN=827;
const int VFX_FNF_EARTHQUAKE_FISSURE=828;
const int VFX_FNF_ORDERS_WRATH=829;


//FEATS
const int DEFILING_AURA =4999;
const int PAINFUL_RAZE =5030;
const int AGONIZING_RAZE =5031;
const int EXTERMINATING_RAZE =5029;
const int DESTRUCTIVE_RAZE =5032;
const int EFFICIENT_RAZE =5033;
const int CONTROLLED_RAZE =5034;
const int DISTANCE_RAZE =5035;
const int TAINTED_AURA =5036;


//Determines if nSpell is an evocation spell
//nSpell: pointer to entry in spells.2da
int ARGetIsEvocation(int nSpell);

//Returns true if oTarget is of racial type plant.
int ARGetIsPlant(object oTarget);

//Returns true if oTarget is a member
//of any of the following racial types:
//Beast, Magical beast, animal, vermine
int ARGetIsBeast(object oTarget);

//Returns true if oTarget is a Associate of oCaster
int ARGetIsAssociate(object oTarget,object oCaster);

//Returns the level of the spell from the spells.2da index of nSpellID
int ARGetSpellLevel(int nSpellID);

//Preforms the defiler rasie effect
//nSpellID: is refferance of the casted spell in the spells.2da
//lTargetLocation: is the location of the center of the radius
//oCaster: object refereance to the caster
//nAffectParty: bollean TRUE, party memebers are effected by the raise effects
void DoRaze(int nSpellID, location lCenterRadius, object oCaster);

// Returns the linked effects to apply for the raise effect
// nPlantDamge: the int ammount of damage to apply to plants
// nNegate: the int ammount to negate saves, skills, and attack bonus
effect ARGetRaiseEffects(int nPlantDamage, int nNegate);

//Tainted Aura, caster Effects.
effect TaintedAuraCasterEffects(object oPC);


//DESTRUCTIVE_RAZE


int ARGetIsPlant(object oTarget)
{
        if(GetRacialType(oTarget) == RACIAL_TYPE_PLANT)
        {
        return TRUE;
        }
        return FALSE;

}

int ARGetIsBeast(object oTarget)
        {
        if(GetRacialType(oTarget) == RACIAL_TYPE_ANIMAL ||
           GetRacialType(oTarget) == RACIAL_TYPE_BEAST ||
           GetRacialType(oTarget) == RACIAL_TYPE_MAGICAL_BEAST ||
           GetRacialType(oTarget) == RACIAL_TYPE_VERMIN)
                {
                return TRUE;
                }
                return FALSE;
        }


int ARGetIsAssociate(object oTarget,object oCaster)
{
   if(GetAssociate(ASSOCIATE_TYPE_FAMILIAR,oCaster) == oTarget)return TRUE;
   if(GetAssociate(ASSOCIATE_TYPE_SUMMONED,oCaster) == oTarget)return TRUE;
   if(GetAssociate(ASSOCIATE_TYPE_DOMINATED,oCaster) == oTarget)return TRUE;
   if(GetAssociate(ASSOCIATE_TYPE_HENCHMAN,oCaster) == oTarget)return TRUE;

    //ar_debug("Is Not Associate" + IntToString(GetAssociateType(oTarget)), oCaster);
    return FALSE;
}


int ARGetSpellLevel(int nSpellID)
{
 int nSpellLevel = StringToInt(Get2DAString("spells", "Innate",nSpellID));
 return nSpellLevel;
}



int ARGetIsEvocation(int nSpell)
{
string s2DA = "spells";
string sColumn = "School";
int nRow = nSpell;

        if(GetStringLowerCase(Get2DAString(s2DA,sColumn,nRow))=="v")
                {
                return TRUE;
                }
        else
                {
                return FALSE;
                }

}


void DoRaze(int nSpellID, location lCenterRadius, object oCaster)
{
        //ar_debug("starting Raze",oCaster);
        int nCasterLevel=GetCasterLevel(oCaster);
        int nSpellLevel=ARGetSpellLevel(nSpellID);
        int nDC= nCasterLevel + GetAbilityModifier(ABILITY_CHARISMA,oCaster);
        //bugFIX: 10' = 3.0479m, 5' = 1.5239m
        //radius in meters 1 meter = 3.2808399 foot
        float fRadius = 3.0479f + (1.5239f*IntToFloat(nSpellLevel));
        int nDuration = nSpellLevel;
        int nPlantDamage = nSpellLevel*2;
        int nNegate=1;
        float fDelay=0.25f;//IntToFloat(Random(1));
        location lCenter = lCenterRadius;
        int nAffectParty=TRUE;

        //ar_debug("linking visuals",oCaster);

        effect eVis = EffectVisualEffect(VFX_IMP_SLOW);
        effect eRazeInstantEffects;
        eRazeInstantEffects = EffectLinkEffects(eRazeInstantEffects,eVis);

        object oTarget;

        //ar_debug("Raze AoE",oCaster);

        effect eRaise = EffectVisualEffect(VFX_DUR_SHIELD_OF_LAW);
        DelayCommand(fDelay,ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY,eRaise,lCenter,1.5f));

        //ar_debug("Checking Feats",oCaster);
     if(GetHasFeat(TAINTED_AURA , oCaster))
            {
            SignalEvent(oCaster, EventSpellCastAt(oCaster,SPELL_EFFECT_TAINTAURA,FALSE));

            //ar_debug("Has Tainted Aura", oCaster);
            if(GetLocalInt(oCaster,"TaintedAuraActive")==0)
                {
                int nCasterLevel = GetLevelByClass(CLASS_TYPE_SORCERER,oCaster);
                int nNeg = nCasterLevel / 5;
                if(nNeg < 1)nNeg=1;
                if(nNeg > 8)nNeg = 8;
                int nPos = nNeg;

                effect ePersuade = EffectSkillDecrease(SKILL_PERSUADE,nNeg);
                effect ePerform = EffectSkillDecrease(SKILL_PERFORM,nNeg);
                effect eAppraise = EffectSkillDecrease(SKILL_APPRAISE,nNeg);
                effect eBluff = EffectSkillDecrease(SKILL_BLUFF,nNeg);
                effect eTaunt = EffectSkillDecrease(SKILL_TAUNT,nNeg);
                effect eIntemedate=EffectSkillIncrease(SKILL_INTIMIDATE,nPos);

                effect eLinkAura = EffectLinkEffects(ePersuade,ePerform);
                eLinkAura = EffectLinkEffects(eLinkAura,eAppraise);
                eLinkAura = EffectLinkEffects(eLinkAura,eBluff);
                eLinkAura = EffectLinkEffects(eLinkAura,eTaunt);
                eLinkAura = EffectLinkEffects(eLinkAura,eIntemedate);

                effect eAOE = EffectAreaOfEffect(AOE_MOB_MENACE,"ar_s3_taintede","ar_s3_taintedh","ar_s3_taintedx");
                //Create the AOE object at the selected location
                eLinkAura = EffectLinkEffects(eLinkAura,eAOE);
                eLinkAura = ExtraordinaryEffect(eLinkAura);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLinkAura, OBJECT_SELF, HoursToSeconds(24));
                SetLocalInt(oCaster,"TaintedAuraActive",1);
                }
                // Tainted aura is active
            }


        if(GetHasFeat(DEFILING_AURA , oCaster)) nPlantDamage = nSpellLevel*2;
        //ar_debug("has Defiling aura, damaging plants for " + IntToString(nPlantDamage), oCaster);

        if(GetHasFeat(EXTERMINATING_RAZE , oCaster))nPlantDamage = nSpellLevel*4;
        //ar_debug("Has Exterminating Raze, damaging Plants For:" + IntToString(nPlantDamage), oCaster);

        if(GetHasFeat(PAINFUL_RAZE , oCaster))nNegate=2;
        //ar_debug("has painful Raze, Negetive effects are at: " + IntToString(nNegate), oCaster);

        if(GetHasFeat(AGONIZING_RAZE , oCaster))nNegate=5;
        //ar_debug("has AgonizingRaze, Negitive Effects are at:" + IntToString(nNegate), oCaster);

        if(GetHasFeat(EFFICIENT_RAZE , oCaster))nDC = nDC + 4;
        //ar_debug("Has Effecient Raze, DC is at:" + IntToString(nDC), oCaster);

        if(GetHasFeat(CONTROLLED_RAZE , oCaster))nAffectParty=FALSE;
        //ar_debug("has Controlled Raze:",oCaster);

        if(GetHasFeat(DISTANCE_RAZE , oCaster))lCenter = GetLocation(GetAttemptedSpellTarget());
        //ar_debug("Has Distance Raze, centering Raze on target:", oCaster);

        if(GetHasFeat(DESTRUCTIVE_RAZE , oCaster))
        {
        //ar_debug("Has Destructive Raze", oCaster);
            if(ARGetIsEvocation(nSpellID) == TRUE)
                {
                //ar_debug("Is Evocation Spell",oCaster);
                int nEvocationDamage = nSpellLevel;
                effect eDamageToAll = EffectDamage(nEvocationDamage);
                eRazeInstantEffects = EffectLinkEffects(eRazeInstantEffects, eDamageToAll);
                }
        }


        effect eNegateAttack = EffectAttackDecrease(nNegate);
        effect eNegateSave = EffectSavingThrowDecrease(SAVING_THROW_ALL, nNegate,SAVING_THROW_TYPE_ALL);
        effect eNegateSkills = EffectSkillDecrease(SKILL_ALL_SKILLS,nNegate);
        effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
        effect eLinkNegate = EffectLinkEffects(eDur,eNegateAttack);
        eLinkNegate = EffectLinkEffects(eLinkNegate,eNegateSave);
        eLinkNegate = EffectLinkEffects(eLinkNegate, eNegateSkills);

        effect ePlantDmamge = EffectDamage(nPlantDamage);
        effect eRaisePlantEffects = EffectLinkEffects(ePlantDmamge,eVis);
        //ar_debug("Aquiring First Target",oCaster);

        oTarget= GetFirstObjectInShape(SHAPE_SPHERE,fRadius,lCenter,TRUE,OBJECT_TYPE_CREATURE);

        while(GetIsObjectValid(oTarget))
            {
                if (oTarget != oCaster)
                 {
                 if(ARGetIsAssociate(oTarget, oCaster)== FALSE)
                 {
                    //ar_debug("Not Effecting Caster",oCaster) ;
                    SignalEvent(oTarget,EventSpellCastAt(oCaster,SPELL_EFFECT_DEFAURA,TRUE));

                    if(ARGetIsPlant(oTarget) == TRUE)
                        {
                        //ar_debug("plant Damage", oCaster);
                        ApplyEffectToObject(DURATION_TYPE_INSTANT,eRaisePlantEffects,oTarget);
                        }

                    //Stop Stacking
                   // max  -5
                 string sHasRazeEffects="AR_HAS_RAZE_EFFECTS";

                 if(!GetHasSpellEffect(SPELL_EFFECT_DEFAURA,oTarget) || GetLocalInt(oTarget,sHasRazeEffects) == 0)
                   {
                        if(nAffectParty==TRUE)
                            {
                                SetLocalInt(oTarget,sHasRazeEffects,1);
                                //ar_debug("Effecting Party is on",oCaster);
                                if(FortitudeSave(oTarget,nDC,SAVING_THROW_TYPE_NONE,oCaster))nDuration/=2;
                                if(nDuration < 1)nDuration = 1;
                                ApplyEffectToObject(DURATION_TYPE_INSTANT,eRazeInstantEffects,oTarget);
                                ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eLinkNegate,oTarget,RoundsToSeconds(nDuration));
                                DelayCommand(RoundsToSeconds(nDuration),DeleteLocalInt(oTarget,sHasRazeEffects));
                                }
                           }
                         else
                          {
                            if(!GetFactionEqual(oCaster, oTarget))
                              {
                                    //ar_debug("effecting Party is Off",oCaster);
                                    SetLocalInt(oTarget,sHasRazeEffects,1);
                                    if(FortitudeSave(oTarget,nDC,SAVING_THROW_TYPE_NONE,oCaster))nDuration = nDuration/2;
                                    if(nDuration < 1)nDuration = 1;
                                    ApplyEffectToObject(DURATION_TYPE_INSTANT,eRazeInstantEffects,oTarget);
                                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eLinkNegate,oTarget,RoundsToSeconds(nDuration));
                                    DelayCommand(RoundsToSeconds(nDuration), DeleteLocalInt(oTarget,sHasRazeEffects));
                              }
                          }
                }
    }
                //ar_debug("Aquiring Next Target in sphere",oCaster);
            oTarget = GetNextObjectInShape(SHAPE_SPHERE,fRadius,lCenter,TRUE,OBJECT_TYPE_CREATURE);
            }
            //ar_debug("Exiting aura",oCaster)  ;

}


//void main(){}

