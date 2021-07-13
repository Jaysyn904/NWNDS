int CountEffectsOnObject(object oTarget)
//Again this is a standard counting effect, it simply deletes the local int
//Also because you can't SetLocalEffect, this has questionable utility
{
    effect eTarget = GetFirstEffect(oTarget);
    DeleteLocalInt(oTarget, "count_e");
    do{
        int iNum = GetLocalInt(oTarget, "count_e");
        SetLocalInt(oTarget, "count_e", iNum+1);
       }while(GetIsEffectValid(eTarget = GetNextEffect(oTarget)) != FALSE);
       int iLocal = GetLocalInt(oTarget, "count_e");
       DeleteLocalInt(oTarget, "count_e");
       return iLocal;

}
int CountObjectTypeInArea(object oArea, int iObjectType)
//The int uses the same objecttype phrasing as GetObjectType
{
    object oThing = GetFirstObjectInArea(oArea);
    DeleteLocalInt(oArea, "count_ota");
    do{
        int iType = GetObjectType(oThing);
        if(iType == iObjectType){
            int iCount = GetLocalInt(oArea, "count_ota");
            SetLocalInt(oArea, "count_ota", iCount+1);
            int iNum = GetLocalInt(oArea, "count_ota");
            string sNum = IntToString(iNum);
            SetLocalObject(oArea, sNum, oThing);
        }
        else{}
       }while((oThing = GetNextObjectInArea(oArea)) != OBJECT_INVALID);
       int iLocal = GetLocalInt(oArea, "count_ota");
       DeleteLocalInt(oArea, "count_ota");
       return iLocal;
}
int CountEnemyTowardsInArea(object oArea, object oTarget)
//This is a counting function to return number of creatures hostile towards the target in the area
{
    object oThing = GetFirstObjectInArea(oArea);
    DeleteLocalInt(oArea, "count_ett");
    do{
        int iType = GetObjectType(oThing);
        if(iType == OBJECT_TYPE_CREATURE){
            int iEnemy = GetIsEnemy(oThing, oTarget);
            if(iEnemy == TRUE){
                int iCount = GetLocalInt(oArea, "count_ett");
                SetLocalInt(oArea, "count_ett", iCount+1);
                int iNum = GetLocalInt(oArea, "count_ett");
                string sNum = IntToString(iNum);
                SetLocalObject(oArea, sNum, oThing);
            }
            else{}
        }
        else{}
       }while((oThing = GetNextObjectInArea(oArea)) != OBJECT_INVALID);
       int iLocal = GetLocalInt(oArea, "count_ett");
       DeleteLocalInt(oArea, "count_ett");
       return iLocal;
}
int CountMembersOfFaction(object oMemberOfFaction, int iPcOnly=TRUE)
//the inputs are the same as per the getfirstfactionmember function
//Stores all variables on the faction member used for the input
{
    object oMember = GetFirstFactionMember(oMemberOfFaction, iPcOnly);
    do{
        int iCount = GetLocalInt(oMemberOfFaction, "count_mfm");
        SetLocalInt(oMemberOfFaction, "count_mfm", iCount+1);
        int iNum = GetLocalInt(oMemberOfFaction, "count_mfm");
        string sNum = IntToString(iNum);
        SetLocalObject(oMemberOfFaction, sNum, oMember);
    }while((oMember = GetNextFactionMember(oMemberOfFaction, iPcOnly)) != OBJECT_INVALID);
    int iLocal = GetLocalInt(oMemberOfFaction, "count_mfm");
    DeleteLocalInt(oMemberOfFaction, "count_mfm");
    return iLocal;
}
int CountPlayersInModule()
{
    object oPlayer = GetFirstPC();
    object oModule = GetModule();
    DeleteLocalInt(oModule, "count_mp");
    do{
        int iCount = GetLocalInt(oModule, "count_mp");
        SetLocalInt(oModule, "count_mp", iCount+1);
        int iNum = GetLocalInt(oModule, "count_mp");
        string sNum = IntToString(iNum);
        SetLocalObject(oModule, sNum, oPlayer);
    }while((oPlayer = GetNextPC()) != OBJECT_INVALID);
    int iLocal = GetLocalInt(oModule, "count_mp");
    DeleteLocalInt(oModule, "count_mp");
    return iLocal;
}
int CountPlayersInArea(object oArea)
{
    object oThing = GetFirstObjectInArea(oArea);
    DeleteLocalInt(oArea, "count_ap");
    do{
        int iPc = GetIsPC(oThing);
        if(iPc == TRUE){
            int iCount = GetLocalInt(oArea, "count_ap");
            SetLocalInt(oArea, "count_ap", iCount+1);
            int iNum = GetLocalInt(oArea, "count_ap");
            string sNum = IntToString(iNum);
            SetLocalObject(oArea, sNum, oThing);
        }
        else{}
    }while((oThing = GetNextObjectInArea(oArea)) != OBJECT_INVALID);
    int iLocal = GetLocalInt(oArea, "count_ap");
    DeleteLocalInt(oArea, "count_ap");
    return iLocal;
}
int CountItemsInInventory(object oChest)
//Counting functions output a int of the count as well as saving
//a number of local variables making GetRandom scripting possible
{
    object oItem = GetFirstItemInInventory(oChest);
    DeleteLocalInt(oChest, "count_i");
    do{
        int iCount = GetLocalInt(oChest, "count_i");
        SetLocalInt(oChest, "count_i", iCount+1);
        int iNum = GetLocalInt(oChest, "count_i");
        string sNum = IntToString(iNum);
        string sResref = GetResRef(oItem);
        SetLocalString(oChest, sNum, sResref);
        SetLocalObject(oChest, sNum, oItem);
    }while((oItem = GetNextItemInInventory(oChest)) != OBJECT_INVALID);
    int iLocal = GetLocalInt(oChest, "count_i");
    DeleteLocalInt(oChest, "count_i");
    return iLocal;
}
float RandomFloat(float fInput)
{
    float fOutput = IntToFloat(Random(FloatToInt(fInput)));
    return fOutput;
}
location GetLocationInArcOfObject(object oTarget, float fArcAngle, float fArcAngleLength, int iMinDistance, int iMaxDistance)
//This is ideal for say getting a location behind something
//The arcangle is the counterclockwise variation from the object's facing, ie 0 = objects facing, and 180 = objects rear
//arcangle length is the angle of the arc, a quarter circle is 90
//The min distance is the minimium distance the location will be from the target
//maximium distance is maximium distance of the location from target
//out put location's fOrient is always facing the object used to create it
{
    float fFacing = GetFacing(oTarget)+fArcAngle;
    float fHalfArc = (fArcAngleLength/2.0);
    float fMax = fFacing+fHalfArc;
    float fMin = fFacing+fHalfArc;
    float fArcSpread = fMax-fMin;
    float fAngle = RandomFloat(fArcSpread+1.0)+fMin;
    int iDistSpread = iMaxDistance-iMinDistance;
    float fDist = IntToFloat(Random(iDistSpread)+iMinDistance);
    float fX1 = cos(fAngle);
    float fY1 = sin(fAngle);
    float fX = (fX1*fDist);
    float fY = (fY1*fDist);
    vector vPos = Vector(fX, fY, 0.0);
    object oArea = GetArea(oTarget);
    float fOrient = fAngle+180.0;
    location lOutput = Location(oArea, vPos, fOrient);
    return lOutput;
}
location GetLocationNear(int iMinDistance, int iMaxDistance, location lTarget)
//This returns a location near the target location such that it is at least min dist away and isn't more than max dist away
{
    int iSpread = iMaxDistance-iMinDistance;
    int iDist = Random(iSpread+1)+iMinDistance;
    int iX = Random(iDist+1);
    int iY = iDist-iX;
    float fX = IntToFloat(iX);
    float fY = IntToFloat(iY);
    vector vAdd = Vector(fX, fY, 0.0);
    vector vCurrent = GetPositionFromLocation(lTarget);
    object oArea = GetAreaFromLocation(lTarget);
    float fOrient = GetFacingFromLocation(lTarget);
    vector vNew = vCurrent+vAdd;
    location lOutput = Location(oArea, vNew, fOrient);
    return lOutput;
}
location GetRandomLocation(object oArea, int iXTiles, int iYTiles, float fOrient)
{
    int iX = Random(iXTiles*10); //Random # between 0- 10* number of tiles (each tile is 10 in each direction)
    int iY = Random(iYTiles*10); //Same as above
    float fX = IntToFloat(iX); //Convert int to float, because floats are necessary for distance and creating vectors
    float fY = IntToFloat(iY);
    vector vPos = Vector(fX, fY, 0.0);//Create a vector from your random coordinates of above
    location lTarget = Location(oArea, vPos, fOrient);//Create a location from the position above and input data
    return lTarget; //output the target location
}
int GetTotalHitDiceOfArea(object oArea)
//this returns the total hit dice of every creature currently in the area
//This is less like other counting functions in that it isn't met for prepatory work
//This function erases all its local ints
{
    object oCritter = GetFirstObjectInArea(oArea);
    DeleteLocalInt(oArea, "hitdice");
    do{
        int iType = GetObjectType(oCritter);
        if(iType == OBJECT_TYPE_CREATURE){
            int iHitDice = GetHitDice(oCritter);
            int iNum = GetLocalInt(oArea, "hitdice");
            SetLocalInt(oArea, "hitdice", iNum+iHitDice);
        }
        else{}
       }while((oCritter = GetNextObjectInArea(oArea)) != OBJECT_INVALID);
       int iLocal = GetLocalInt(oArea, "hitdice");
       DeleteLocalInt(oArea, "hitdice");
       return iLocal;

}
int GetTotalHitDiceOfPlayersInArea(object oArea)
//this returns the total hit dice of every creature currently in the area
//This is less like other counting functions in that it isn't met for prepatory work
//This function erases all its local ints
{
    object oCritter = GetFirstObjectInArea(oArea);
    DeleteLocalInt(oArea, "hitdice");
    do{
        int iType = GetIsPC(oCritter);
        if(iType == TRUE){
            int iHitDice = GetHitDice(oCritter);
            int iNum = GetLocalInt(oArea, "hitdice");
            SetLocalInt(oArea, "hitdice", iNum+iHitDice);
        }
        else{}
       }while((oCritter = GetNextObjectInArea(oArea)) != OBJECT_INVALID);
       int iLocal = GetLocalInt(oArea, "hitdice");
       DeleteLocalInt(oArea, "hitdice");
       return iLocal;

}
int GetAverageCreatureHitDice(object oArea)
//this returns the average hitdice count for all the creatures in an area
//This doesn't count players
{
    int iCount = CountObjectTypeInArea(oArea, OBJECT_TYPE_CREATURE);
    int iCountPlayers = CountPlayersInArea(oArea);
    int iHDTotal = GetTotalHitDiceOfArea(oArea);
    int iHDPlayers = GetTotalHitDiceOfPlayersInArea(oArea);
    int iHD = iHDTotal-iHDPlayers;
    int iDiv = iCount-iCountPlayers;
    int iReturn = (iHD/iDiv);
    return iReturn;
}
object GetRandomItemIn(object oTarget)
//This calls the Inventory Counting function as part of it
//Note these are local objects, so it actually retrieves that object, not a copy of it
{
    int iNum = CountItemsInInventory(oTarget);
    int iPick = Random(iNum)+1;
    string sNum = IntToString(iPick);
    object oReturn = GetLocalObject(oTarget, sNum);
    return oReturn;
}
object GetRandomObjectInArea(object oArea, int iObjectType)
//This returns the actual object froma getlocal object after running the counting function
{
    int iNum = CountObjectTypeInArea(oArea, iObjectType);
    int iPick = Random(iNum)+1;
    string sNum = IntToString(iPick);
    object oReturn = GetLocalObject(oArea, sNum);
    return oReturn;
}
void EmptyInventory(object oTarget)
//this destroys all items in a target object's inventory
//Including plot items...
{
    object oItem = GetFirstItemInInventory(oTarget);
    do{
        SetPlotFlag(oItem, FALSE);
        DestroyObject(oItem, 0.0);
    }while((oItem = GetNextItemInInventory(oTarget)) != OBJECT_INVALID);
}
