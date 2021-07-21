// Script by: Nyadarus
// Created:   September 2003
// Used in:   The Hermit Quest
// Purpose:   Used to fire the visual effects in the 2nd floor of the
//              Citidel of Fire
void main()
{
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DIVINE_STRIKE_FIRE), GetLocation(GetObjectByTag("WP_HQ_FLAMESTRIKE")));
}
