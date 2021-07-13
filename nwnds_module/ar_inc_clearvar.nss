void main()
{
object oPC = OBJECT_SELF;

DeleteLocalObject(oPC, "BackLashAOE");
DeleteLocalObject(oPC,"AR_CONSERVE_CASTER");
DeleteLocalInt(oPC, "BackLash");
DeleteLocalInt(oPC, "BackLashDice");
DeleteLocalInt(oPC,"AR_CONSERVE");
DeleteLocalInt(oPC,"AR_CONSERVE_DC");
DeleteLocalInt(oPC,"TaintedAuraActive");

}
