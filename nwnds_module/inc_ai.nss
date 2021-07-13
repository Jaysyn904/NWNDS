int GetCanAct(object oCreature)
{
    effect eEffect = GetFirstEffect(oCreature);
    int nEffect;
    while ( GetIsEffectValid( eEffect ))
    {
        nEffect = GetEffectType(eEffect);
        if ( nEffect == EFFECT_TYPE_PARALYZE ||
             nEffect == EFFECT_TYPE_DAZED ||
             nEffect == EFFECT_TYPE_DOMINATED ||
             nEffect == EFFECT_TYPE_FRIGHTENED ||
             nEffect == EFFECT_TYPE_PETRIFY ||
             nEffect == EFFECT_TYPE_SLEEP ||
             nEffect == EFFECT_TYPE_STUNNED ||
             nEffect == EFFECT_TYPE_TURNED )
            return FALSE;

        eEffect = GetNextEffect(oCreature);
    }
    return TRUE;
}

//void main () {}