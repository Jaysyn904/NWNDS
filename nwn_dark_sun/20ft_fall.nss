/*   Script generated by
Lilac Soul's NWN Script Generator, v. 2.3

For download info, please visit:
http://nwvault.ign.com/View.php?view=Other.Detail&id=4683&id=625    */

//Put this on action taken in the conversation editor
void main()
{

object oPC = GetPCSpeaker();
object oTarget;
object oWayPoint = GetWaypointByTag("wp_oldwell");
location lLoc = GetLocation(oWayPoint);

oTarget = oPC;

AssignCommand(oPC, TakeGoldFromCreature(d20(2), oPC, TRUE));

effect eEffect;
eEffect = EffectDamage(d6(2), DAMAGE_TYPE_BLUDGEONING, DAMAGE_POWER_NORMAL);

ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect, oPC);

//Visual effects can't be applied to waypoints, so if it is a WP
//the VFX will be applied to the WP's location instead

int nInt;
nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_BUMP), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_BUMP), GetLocation(oTarget));

FloatingTextStringOnCreature("*You fall about 20 feet.*", oPC, FALSE);

AssignCommand(oPC,JumpToLocation(lLoc));

}
