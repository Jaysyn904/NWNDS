#include "nw_i0_generic"
void main()
{
    object oUdath = GetObjectByTag("cyclopsudath");
    // Set the faction to hate the player, then <span class="highlight">attack</span> the player
    AdjustReputation(GetPCSpeaker(), OBJECT_SELF, -100);
    DetermineCombatRound(GetPCSpeaker());
DestroyObject(GetObjectByTag("cyclopsudath"), 1.0);
}
