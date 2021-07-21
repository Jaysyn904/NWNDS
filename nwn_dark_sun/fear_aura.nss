void main()
{
    effect eAOE = EffectAreaOfEffect(AOE_MOB_FEAR,"fear_aura1","null","null");
    eAOE = SupernaturalEffect(eAOE);
    eAOE = ExtraordinaryEffect(eAOE);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eAOE,OBJECT_SELF,HoursToSeconds(100));
}
