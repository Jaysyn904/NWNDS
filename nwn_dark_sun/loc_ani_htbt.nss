//:://////////////////////////////////////////////////
//:: Heartbeat for herbivore/omnivore
//:: LOC_ANI_HTBT
//:://////////////////////////////////////////////////
/*

    Heavily edited. Probably will only work for herb/omnivores.
    Note that if creatures have standard BW Waypoints,
    special herb/omnivore AI is disabled.

*/
//:://////////////////////////////////////////////////
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/22/2002
//:://////////////////////////////////////////////////

#include "loc_i0_generic"

void main()
{
    // * if not runnning normal or better AI then exit for performance reasons
    if (GetAILevel() == AI_LEVEL_VERY_LOW) return;

    // If we have the 'constant' waypoints flag set, walk to the next
    // waypoint.
    else if (GetWalkCondition(NW_WALK_FLAG_CONSTANT))
    {
        WalkWayPoints();
    }

    // Check to see if we should be playing default animations
    // - make sure we don't have any current targets
    else if ( !GetIsObjectValid(GetAttemptedAttackTarget())
          && !GetIsObjectValid(GetAttemptedSpellTarget())
          // && !GetIsPostOrWalking())
          && !GetIsObjectValid(GetNearestSeenEnemy()))
    {
        if (GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL) || GetBehaviorState(NW_FLAG_BEHAVIOR_OMNIVORE) ||
            GetBehaviorState(NW_FLAG_BEHAVIOR_HERBIVORE))
        {
            // This handles special attacking/fleeing behavior
            // for omnivores & herbivores.
            DetermineSpecialBehavior();
        }
        else if (!IsInConversation(OBJECT_SELF))
        {
            if (GetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS)
                || GetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS_AVIAN)
                || GetIsEncounterCreature())
            {
                PlayMobileAmbientAnimations();
            }
            else if (GetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS))
            {
                PlayImmobileAmbientAnimations();
            }
        }
    }

    if(!GetHasEffect(EFFECT_TYPE_SLEEP))
    {
        if(!GetIsPostOrWalking())
        {
            if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
            {
                if(!GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL) && !IsInConversation(OBJECT_SELF))
                {
                    if(!GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN)))
                    {
                        if( GetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS) || GetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS_AVIAN) )
                        {
                            PlayMobileAmbientAnimations();
                        }
                        else if( GetIsEncounterCreature() )
                        {
                            PlayMobileAmbientAnimations();
                        }
                        else if( GetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS) )
                        {
                            PlayImmobileAmbientAnimations();
                        }
                    }
                    else
                    {
                        // DetermineCombatRound();
                    }
                }
                else
                {
                    DetermineSpecialBehavior();
                }
            }
        }
    }
}
