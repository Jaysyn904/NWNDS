#include "x2_inc_spellhook"

void main()
{
    int nEvent =GetUserDefinedItemEventNumber();
    object oPC;
    object oItem;

    if (nEvent ==  X2_ITEM_EVENT_ACTIVATE)
    {
        oPC   = GetItemActivator();
        oItem = GetItemActivated();
        effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3);
        effect ePoly;
        int nPoly;
        int nDuration = GetLevelByClass(CLASS_TYPE_CLERIC, oPC);

        if(GetHasFeat(FEAT_AIR_DOMAIN_POWER, oPC)) nPoly = POLYMORPH_TYPE_HUGE_AIR_ELEMENTAL;
        if(GetHasFeat(FEAT_EARTH_DOMAIN_POWER, oPC)) nPoly = POLYMORPH_TYPE_HUGE_EARTH_ELEMENTAL;
        if(GetHasFeat(FEAT_FIRE_DOMAIN_POWER, oPC)) nPoly = POLYMORPH_TYPE_HUGE_FIRE_ELEMENTAL;
        if(GetHasFeat(FEAT_WATER_DOMAIN_POWER, oPC)) nPoly = POLYMORPH_TYPE_HUGE_WATER_ELEMENTAL;

        ePoly = EffectPolymorph(nPoly);

        //Apply the VFX impact and effects
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oPC));
        DelayCommand(0.4, AssignCommand(oPC, ClearAllActions())); // prevents an exploit
        DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ePoly, oPC, TurnsToSeconds(nDuration)));
    }
}
