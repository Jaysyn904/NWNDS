/************************************
*   Photosynthesis                  *
*                                   *
*   Cost: 11                        *
*   Power Score: Con                *
*                                   *
*************************************/

#include "lib_psionic"

void Photosynthesis(object oPC, int nDuration, int nMult, int nTimeStamp, int nRound=1)
{
    int nHP=nMult*3;

    if(nTimeStamp!=GetLocalInt(oPC, "PhotoTime")) return;

    if(GetWeather(GetArea(oPC))==WEATHER_RAIN || GetWeather(GetArea(oPC))==WEATHER_SNOW)
    nHP=nMult*1;

    if(!GetIsAreaInterior(GetArea(oPC))
        && GetIsAreaAboveGround(GetArea(oPC))==AREA_ABOVEGROUND
        && GetIsDay())
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nHP/EFFECT_SCALING_FACTOR), oPC);

    if(nRound<=nDuration)
        DelayCommand(3.0, Photosynthesis(oPC, nDuration, nMult, nTimeStamp, nRound+1));
    else
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE), oPC, 1.0);
}



void main()
{
    object oPC=OBJECT_SELF;
    int nCost=11;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION);
    effect eVis=EffectVisualEffect(VFX_IMP_HOLY_AID);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_PHOTOSYNTHESIS);
    int nTimeStamp=GetRealTime();

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_PHOTOSYNTHESIS)) return;

    SignalEvent(oPC, EventSpellCastAt(oPC, SPELL_PSIONIC_PHOTOSYNTHESIS, FALSE));

    //added to prevent multiple instances from stacking
    SetLocalInt(oPC, "PhotoTime", nTimeStamp);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    Photosynthesis(oPC, GetEnhancedDuration(nLevel*2), GetEnhancedEffect(EFFECT_SCALING_FACTOR, FEAT_PSIONIC_PHOTOSYNTHESIS), nTimeStamp);
}
