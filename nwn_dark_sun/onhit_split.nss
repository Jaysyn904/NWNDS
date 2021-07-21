//:://////////////////////////////////////////////////
//:: NW_C2_DEFAULT6
//:: Default OnDamaged handler
/*
If already fighting then ignore, else determine
combat round
*/
//:://////////////////////////////////////////////////
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/22/2002
//:://////////////////////////////////////////////////
/* Modified by Seth and Ursul for oozes.
*
* Seths Script did not check for base weapon slashing damage, only "additional" slashing damage.
* This was because "GetDamageDealtByType" appears to not reflect base weapon damage.
*/

#include "nw_i0_generic"


// Return TRUE if weapon does slashing damage
// Uses Get2DAString

int GetDoesSlashingDamage(object oWeapon)
    {
        int nBaseItemNumber = GetBaseItemType(oWeapon);
        int nBaseWeaponType = StringToInt(Get2DAString("baseitems","WeaponType",nBaseItemNumber));

        SpeakString("Item Number " + IntToString(nBaseItemNumber), TALKVOLUME_SILENT_TALK);
        SpeakString("Type " +IntToString(nBaseWeaponType), TALKVOLUME_SILENT_TALK);

        return (nBaseWeaponType);
    }

void checkSplit()
    {
        object oAttacker = GetLastDamager();
        object oWeapon = GetLastWeaponUsed (oAttacker);
        int nSlashing = GetDoesSlashingDamage(oWeapon);

        int nCurrentHP = GetCurrentHitPoints(); // Creatures current HPs
        int nDamageToExisting = nCurrentHP / 2;
        int nDamageToNew = GetMaxHitPoints() - nCurrentHP;

        effect eDamageExisting = EffectDamage(nDamageToExisting,DAMAGE_TYPE_MAGICAL,DAMAGE_POWER_NORMAL);
        effect eDamageNew = EffectDamage(nDamageToNew,DAMAGE_TYPE_MAGICAL,DAMAGE_POWER_NORMAL);

        // 3 = Axe, 4 = sword
        if ((nSlashing == 3) || (nSlashing == 4))
            {
                if (nCurrentHP > 10)
            {

            DelayCommand(0.75,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect
            (VFX_IMP_LIGHTNING_S),GetLocation(OBJECT_SELF)));

            DelayCommand(1.25,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect
            (VFX_IMP_BREACH),GetLocation(OBJECT_SELF)));
            object oNew = CreateObject(OBJECT_TYPE_CREATURE, GetResRef(OBJECT_SELF),GetLocation(OBJECT_SELF));

            DelayCommand(0.75,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect
            (VFX_IMP_LIGHTNING_S),GetLocation(oNew)));

            DelayCommand(1.25,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect
            (VFX_IMP_BREACH),GetLocation(oNew)));

            DelayCommand(2.0,ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamageExisting, OBJECT_SELF,0.0));
            DelayCommand(2.0,ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamageNew, oNew,0.0));

                } // end if CurrentHP
                } // end if Slashing

            } // end function


void main()
    {
        if(GetFleeToExit())
            {
                // We're supposed to run away, do nothing
            } else if (GetSpawnInCondition(NW_FLAG_SET_WARNINGS))
                {
                    // don't do anything?
                } else
                    {
                        object oDamager = GetLastDamager();

                        //Check to see if Jelly should split due to slashing damage.
                        checkSplit();

if (!GetIsObjectValid(oDamager)) {
// don't do anything, we don't have a valid damager
} else if (!GetIsFighting(OBJECT_SELF)) {
// If we're not fighting, determine combat round
if(GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL)) {
DetermineSpecialBehavior(oDamager);
} else {
if(!GetObjectSeen(oDamager)
&& GetArea(OBJECT_SELF) == GetArea(oDamager)) {
// We don't see our attacker, go find them
ActionMoveToLocation(GetLocation(oDamager), TRUE);
ActionDoCommand(DetermineCombatRound());
} else {
DetermineCombatRound();
}
}
} else {
// We are fighting already -- consider switching if we've been
// attacked by a more powerful enemy
object oTarget = GetAttackTarget();
if (!GetIsObjectValid(oTarget))
oTarget = GetAttemptedAttackTarget();
if (!GetIsObjectValid(oTarget))
oTarget = GetAttemptedSpellTarget();
// If our target isn't valid
// or our damager has just dealt us 25% or more
// of our hp in damager
// or our damager is more than 2HD more powerful than our target
// switch to attack the damager.
if (!GetIsObjectValid(oTarget)
|| (
oTarget != oDamager
&& (
GetTotalDamageDealt() > (GetMaxHitPoints(OBJECT_SELF) / 4)
|| (GetHitDice(oDamager) - 2) > GetHitDice(oTarget)
)
)
)
{
// Switch targets
DetermineCombatRound(oDamager);
}
}
}
// Send the user-defined event signal
if(GetSpawnInCondition(NW_FLAG_DAMAGED_EVENT))
{
SignalEvent(OBJECT_SELF, EventUserDefined(EVENT_DAMAGED));
}
}
