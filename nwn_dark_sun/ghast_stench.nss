//::
//:: Ghast_stench
//::
//:: A pnp version of the Ghast's sickening stench.
//::
//:: Modified by: DM Heatstroke 01-20-11
//::

void main()
{
    effect eAOE = EffectAreaOfEffect(AOE_MOB_TYRANT_FOG,"ghast_stench1","null","null");
    eAOE = SupernaturalEffect(eAOE);
    eAOE = ExtraordinaryEffect(eAOE);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eAOE,OBJECT_SELF,HoursToSeconds(100));
}
