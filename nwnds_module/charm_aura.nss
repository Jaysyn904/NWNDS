void main()
{
    effect eAOE = EffectAreaOfEffect(AOE_MOB_UNNATURAL,"charm_aura1","charm_aura2","null");
    eAOE = SupernaturalEffect(eAOE);
    eAOE = ExtraordinaryEffect(eAOE);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eAOE,OBJECT_SELF,HoursToSeconds(100));
}
