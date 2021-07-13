void RespawnObject(string sTag, int iType, location lLoc) {

// ResRef must be derivable from Tag
string sResRef = GetStringLowerCase(GetStringLeft(sTag, 16));

CreateObject(iType, sResRef, lLoc);

}



void main()
{
string sTag = GetTag(OBJECT_SELF);
int iType = GetObjectType(OBJECT_SELF);

// For creatures, save the location at spawn-time as a local location and
// use it instead. Otherwise, the creature will respawn where it died.
location lLoc = GetLocation(OBJECT_SELF);

float fDelay = 120.0;  // 2 minute delay

AssignCommand(GetArea(OBJECT_SELF), DelayCommand(fDelay, RespawnObject(sTag, iType, lLoc)));
}

