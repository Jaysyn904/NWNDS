//::
//:: tliz_aura
//::
//:: A pnp version of the T'liz's Fear & Unnatural Aura.
//::
//:: Modified by: DM Heatstroke 01-25-11
//::

void main()
{
    effect eAOE = EffectAreaOfEffect(AOE_MOB_FEAR,"tliz_aura1","null","null");
    eAOE = SupernaturalEffect(eAOE);
    eAOE = ExtraordinaryEffect(eAOE);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eAOE,OBJECT_SELF,HoursToSeconds(100));
}
