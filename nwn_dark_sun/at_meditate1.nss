void main()
{
object oPC = GetPCSpeaker();
AssignCommand ( oPC, ActionPlayAnimation (ANIMATION_LOOPING_SIT_CROSS, 1.0, 4000.0));
AdjustAlignment(oPC,ALIGNMENT_LAWFUL,5);
}
