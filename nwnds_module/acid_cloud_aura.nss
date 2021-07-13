void main()
{
    effect eAOE = EffectAreaOfEffect(AOE_PER_FOGACID,"acid_cloud1","acid_cloud2","null");
    eAOE = SupernaturalEffect(eAOE);
    eAOE = ExtraordinaryEffect(eAOE);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eAOE,OBJECT_SELF,HoursToSeconds(100));
}
