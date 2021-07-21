void main()
{
if(!GetLocalInt(OBJECT_SELF, "re_BESIE"))
    {
    SetLocalInt(OBJECT_SELF, "re_BESIE", TRUE);
    SetLocalString(OBJECT_SELF, "re_ToolType", "Placeable Spawner");
    }
if(GetLocalInt(GetModule(), "re_disablePlaceableSpawner") || GetLocalInt(GetArea(OBJECT_SELF), "re_disablePlaceableSpawner") || GetLocalInt(OBJECT_SELF, "re_disable")) return;
int iStartTime = GetFortitudeSavingThrow(OBJECT_SELF);
int iStopTime = GetReflexSavingThrow(OBJECT_SELF);
int iID = GetWillSavingThrow(OBJECT_SELF);
int iChanceOfSpawn = GetMaxHitPoints(OBJECT_SELF);
int iHappens = Random(10000) + 1;
object oObject;
string sTemplate = GetTag(OBJECT_SELF);
if(!GetLocalInt(OBJECT_SELF, "re_bFirstRun"))
    {
    iHappens = 0;
    SetLocalInt(OBJECT_SELF, "re_bFirstRun", TRUE);
    }
if(iStartTime > 23) iStartTime = 23;
if(iStopTime > 23) iStopTime = 23;
if((iStartTime <= iStopTime && (GetTimeHour() >= iStartTime && GetTimeHour() < iStopTime))
|| (iStartTime >= iStopTime && (GetTimeHour() >= iStartTime || GetTimeHour() < iStopTime)))
    {
    if(!GetIsObjectValid(GetLocalObject(OBJECT_SELF, "re_oObject")))
        {
        if(iChanceOfSpawn >= iHappens)
            {
            oObject = CreateObject(OBJECT_TYPE_PLACEABLE, sTemplate, GetLocation(OBJECT_SELF));
            SetLocalInt(oObject, "re_iID", iID);
            SetLocalObject(OBJECT_SELF, "re_oObject", oObject);
            }
        }
    }
else
    {
    if(GetIsObjectValid(GetLocalObject(OBJECT_SELF, "re_oObject")))
        {
        DestroyObject(GetLocalObject(OBJECT_SELF, "re_oObject"));
        DeleteLocalObject(OBJECT_SELF, "re_oObject");
        }
    }
}
