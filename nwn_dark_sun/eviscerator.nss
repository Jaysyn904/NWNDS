//::
//:: A pnp version of the Slaughter Wight's Lvl draining touch,
//:: Eviscorator Feat & Death master feat.
//::
//:: Modified by: DM Heatstroke 01-30-11
//::

#include "NW_I0_GENERIC"
#include "NW_I0_SPELLS"
#include "nw_i0_plot"

int GetIsShaken(object oTarget,object oOrigin)
{
    effect eEffect = GetFirstEffect(oTarget);
    int nEffectType;

    while ( GetIsEffectValid(eEffect) )
    {
//        AssignCommand(oTarget,SpeakString("Effect Creator: " + GetName(GetEffectCreator(eEffect))
//            + " Effect ID: " + IntToString(GetEffectSpellId(eEffect))
//            + " Effect Type: " + IntToString(GetEffectType(eEffect)) ));

        if ( GetEffectCreator(eEffect) == oOrigin &&
            GetEffectSpellId(eEffect) == 700 )
        {
            nEffectType = GetEffectType(eEffect);
            if ( nEffectType == EFFECT_TYPE_ATTACK_DECREASE ||
                 nEffectType == EFFECT_TYPE_SAVING_THROW_DECREASE ||
                 nEffectType == EFFECT_TYPE_SKILL_DECREASE )
            {
                AssignCommand(oTarget,SpeakString("**Shaken!**"));
                return TRUE;
            }
}
        eEffect = GetNextEffect(oTarget);
    }

    //AssignCommand(oTarget,SpeakString("I am not shaken"));
    return FALSE;
}

void DoLevelDrain(object oTarget, object oCaster)
{
    // Setup oCaster's healing
    effect eDrain = EffectTemporaryHitpoints(5);
    eDrain = ExtraordinaryEffect(eDrain);
    effect eVis1 = EffectVisualEffect(VFX_IMP_HEALING_L);

    // Setup Level Drain
    effect eVis2 = EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY);
    effect eNeg = EffectNegativeLevel(1);
    eNeg = SupernaturalEffect(eNeg);

    // Drain levels from oTarget
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis2, oTarget);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eNeg, oTarget, HoursToSeconds(24));
    // Apply Temp HP to oCaster
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis1, oCaster);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDrain, oCaster, HoursToSeconds(1));

}

void main()
{
    object oCaster = OBJECT_SELF ;               // Where the spell came from
    object oTarget = GetSpellTargetObject();  // What the spell is aimed at

        if ( GetIsImmune(oTarget,IMMUNITY_TYPE_NEGATIVE_LEVEL) )
    {
        SendMessageToPC(oTarget,"Immune to level drain.");
        return;
    }

    DelayCommand(0.1,DoLevelDrain(oTarget,oCaster));

    int nRace = GetRacialType(oTarget);
    if ((  nRace == RACIAL_TYPE_CONSTRUCT ) || ( nRace == RACIAL_TYPE_ELEMENTAL )
        || ( nRace == RACIAL_TYPE_UNDEAD ))
        return;
    if ( GetIsImmune( oTarget, IMMUNITY_TYPE_CRITICAL_HIT ) )
        return;

    if ( d20() < 14 )
        return;

    effect eImp = EffectVisualEffect(VFX_FNF_LOS_EVIL_30);

    effect eVis = EffectVisualEffect(VFX_IMP_DOOM);

    effect eAttack = EffectAttackDecrease(2);
    effect eSaves = EffectSavingThrowDecrease(SAVING_THROW_ALL,2);
    effect eSkills = EffectSkillDecrease(SKILL_ALL_SKILLS,2);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
    effect eLink = EffectLinkEffects(eAttack,eSaves);
    eLink = EffectLinkEffects(eLink,eSkills);
    eLink = EffectLinkEffects(eLink,eDur);

    effect eVis2 = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_FEAR);
    effect eDur2 = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
    effect eLink2 = EffectLinkEffects(eVis2,eDur2);

    object oAOE = GetFirstObjectInShape(SHAPE_SPHERE, FeetToMeters(30.0), GetLocation(oTarget));

    float fDelay;
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eImp,oTarget);
    while ( GetIsObjectValid( oAOE ) )
    {
        if ( oAOE != oCaster && GetIsEnemy(oAOE,oCaster) )
        {
            if ( !GetIsImmune( oAOE, IMMUNITY_TYPE_MIND_SPELLS ) &&
                 !GetIsImmune( oAOE, IMMUNITY_TYPE_FEAR ) &&
                 !GetHasEffect( EFFECT_TYPE_FRIGHTENED, oAOE) )
            {
                fDelay = GetDistanceBetween(oAOE,oTarget) / 20;
                if ( GetIsShaken(oAOE, oCaster) )
                {
                    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eLink2,oAOE,RoundsToSeconds(10)));
//                    AssignCommand(oAOE,SpeakString("Fear! Oh no!"));
                }
                else
                {
                    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oAOE));
                    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eLink,oAOE,RoundsToSeconds(10)));
                }
            }
        }
        oAOE = GetNextObjectInShape(SHAPE_SPHERE, FeetToMeters(30.0), GetLocation(oTarget));
    }


}
