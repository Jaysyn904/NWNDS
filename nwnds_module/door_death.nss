/////////////////////////////////
/*
    Creates a Placeable borken door to replace the one just destroyed
    if the LocalString of the door is either "door_wood" or "door_dungeon"

    otherwise it executes the default HoTU sctipt for creating a craftable
    item
*/
////////////////////////////////
void main()
{
object oDest = GetTransitionTarget(OBJECT_SELF);

if( oDest != OBJECT_INVALID)
 {
    // kludge because transition door is not actually destroyed
    // and will close both doors if used with auto closed scripts
    int nMaxHP=GetMaxHitPoints(oDest);
    effect eDamage = EffectDamage(nMaxHP);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eDamage,oDest);


     string sPlaceable = GetLocalString(OBJECT_SELF,"BROKEN_DOOR");
     if(sPlaceable != "")
       {
        location lLocation = GetLocation(OBJECT_SELF);
        CreateObject(OBJECT_TYPE_PLACEABLE,sPlaceable,lLocation,FALSE,"BROKEN_DOOR");
       }
 }
else
{
   if(d100(1)>75)
       {ExecuteScript("x2_door_death", OBJECT_SELF);}

}

}
