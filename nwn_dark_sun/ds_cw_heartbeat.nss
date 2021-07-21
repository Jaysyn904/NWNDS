#include "spawn_main"

void main()
{

        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DIVINE_STRIKE_FIRE), GetLocation(GetObjectByTag("WP_CAT_FLAMESTRIKE")));
        Spawn();
}
