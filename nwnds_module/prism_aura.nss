void main()
{
    effect eAOE = EffectAreaOfEffect(AOE_MOB_ELECTRICAL,"prism_aura1","prism_aura2","null");
    eAOE = SupernaturalEffect(eAOE);
    eAOE = ExtraordinaryEffect(eAOE);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eAOE,OBJECT_SELF,HoursToSeconds(100));

    effect eConceal = EffectConcealment(50);
    eConceal = SupernaturalEffect(eConceal);
    eConceal = ExtraordinaryEffect(eConceal);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eConceal,OBJECT_SELF);


}
