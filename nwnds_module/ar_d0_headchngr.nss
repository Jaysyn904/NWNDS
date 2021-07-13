void main()
{
object oModel = OBJECT_SELF;
object oPC = GetPCSpeaker();
int nModelNumber = GetLocalInt(oModel,"AR_CURRENT_HEAD");

SetCreatureBodyPart(CREATURE_PART_HEAD, nModelNumber, oPC);

}
