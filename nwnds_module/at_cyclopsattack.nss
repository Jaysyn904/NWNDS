#include "nw_i0_generic"
void main()
{
    // Set the faction to hate the player, then <span class="highlight">attack</span> the player
    AdjustReputation(GetPCSpeaker(), OBJECT_SELF, -100);
    DelayCommand (1.5, DetermineCombatRound (GetPCSpeaker()));
}
