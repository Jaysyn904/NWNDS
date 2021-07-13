void main()
{

object oPC = GetLastPerceived();

if (!GetIsPC(oPC)) return;

if (!GetLastPerceptionSeen()) return;
ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT,1.0);
ActionPlayAnimation(ANIMATION_FIREFORGET_BOW,1.0);
ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY2,1.0);
ActionPlayAnimation(ANIMATION_FIREFORGET_BOW,1.0);
ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW,1.0);
ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,1.0);
ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,1.0);
ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW,1.0);
ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY2,1.0);
ActionPlayAnimation(ANIMATION_LOOPING_GET_MID,1.0);
ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW,1.0);
ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL,1.0);
ActionPlayAnimation(ANIMATION_FIREFORGET_BOW,1.0);
ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW,1.0);
ActionPlayAnimation(ANIMATION_LOOPING_TALK_PLEADING,1.0);
ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW,1.0);
ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT,1.0);
ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,1.0);
ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY2,1.0);
ActionPlayAnimation(ANIMATION_FIREFORGET_BOW,1.0);
}
