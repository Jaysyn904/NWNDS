void AdjustAbility (int Ability, int Amount);

void AdjustAbility (int Ability, int Amount)
    {
    object oSpeaker;
    int Score;
    effect eAbility, eAdjustAbility;

    oSpeaker = GetPCSpeaker();

    if (Amount<0)
        {
        eAbility=EffectAbilityDecrease(Ability,abs(Amount));
        eAdjustAbility=EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE,FALSE);
        }
    else
        {
        eAbility=EffectAbilityIncrease(Ability,Amount);
        eAdjustAbility=EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE,FALSE);
        }

    eAbility=ExtraordinaryEffect(eAbility);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eAdjustAbility, oSpeaker, 0.5);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAbility, oSpeaker, 0.0);
    }
