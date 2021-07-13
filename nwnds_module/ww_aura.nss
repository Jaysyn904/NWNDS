void main()
{
    effect eAOE = EffectAreaOfEffect(AOE_MOB_FROST,"ww_aura1","ww_aura2","null");
    eAOE = SupernaturalEffect(eAOE);
    eAOE = ExtraordinaryEffect(eAOE);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eAOE,OBJECT_SELF,HoursToSeconds(100));
}
