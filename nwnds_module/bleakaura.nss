void main()
{
    //Set and apply AOE object
    effect eCold = EffectDamageShield(0,DAMAGE_BONUS_1d6,DAMAGE_TYPE_COLD);
    eCold = SupernaturalEffect(eCold);
    eCold = ExtraordinaryEffect(eCold);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eCold, OBJECT_SELF);
    effect eAOE = EffectAreaOfEffect(AOE_MOB_FROST,"bleakaura1","bleakaura2","rotaura2");
    eAOE = SupernaturalEffect(eAOE);
    eAOE = ExtraordinaryEffect(eAOE);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eAOE, OBJECT_SELF, HoursToSeconds(100));
}
