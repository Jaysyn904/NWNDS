//::///////////////////////////////////////////////
//:: area_trans
//:://////////////////////////////////////////////
/*
    SEAMLESS AREA TRANSITIONS v1.1

    Version 1:
    - areas can be different sizes
    - a module can have more than one grid ("Region")

    Version 1.1:
    - SetLocalInt(oPC, "AREATRANS_DIRECTION_BACKUP", nDir)
        new local integer used in diagonal transitions
        if the diagonal direction fails, the nearest cardinal direction (N, S, E, or W)
        is used in its place to find a transition area
    - int AREATRANS_SQUARES_PER_GRID_UNIT
        new global used to correct math error in FindAreaContainingGridTag()
    - string GetDirectionName(int nDir)
        new function to encapsulate code for generating name from direction integer

    Otherwise this script shares functionality with and is compatible with Jaga's Seamless Area Transitioner.
    http://nwvault.ign.com/View.php?view=scripts.Detail&id=89
    by Jaga Te'lesin      (jaga-nwn@earthlink.net)

    Jaga's work was the inspiration for this rewrite.


    For instructions please see the Read Me.

*/
//:://////////////////////////////////////////////
//:: Created:   The Magus (2013 mar 9)
//:: Modified:  The Magus (2013 mar 12) v1.1
//:://////////////////////////////////////////////


// GLOBALS ---------------------------------------------------------------------

// USER CONFIGURABLE
object AREATRANS_DATA                   = GetModule(); // Data Object holding area tags for each grid coord

const int AREATRANS_DEBUG               = FALSE;    // TRUE turns debugging feedback on
const int AREATRANS_GRID_CARTESIAN      = FALSE;    // use FALSE If this script is replacing Jaga's AreaTrans in an existing module
                                                    // The original Area Trans Grid was NOT cartesian
                                                    // TRUE will expect Grid coordinates to be cartesian
const float AREATRANS_DIAGONAL_OFFSET   = 3.5f;     // Distance out from any corner to sense diagonal movement (8 to 15 recommended)
const float AREATRANS_LANDING_OFFSET    = 4.0f;     // Distance out from edge in destination Area that PC will land (8 to 10 recommended)
const float AREATRANS_DELAY             = 0.0f;     // Delay before zoning
const float AREATRANS_REFACTORY_PERIOD  = 9.0f;     // delay to prevent zoning on arrival in new area
const int AREATRANS_FLEXIBLE_GRID       = TRUE;     // TRUE - each area regardless of size occupies only one grid coordinate
                                                    // FALSE - an area depending on size, may occupy more than one grid coordinate. See below.
const float AREATRANS_GRID_UNIT         = 40.0;     // INFLEXIBLE GRIDS:
                                                    // default area dimension in meters for each grid.
                                                    // This becomes the smallest size you can use for a dimension of an area
                                                    // The dimensions of larger areas must be a multiple of this figure.
                                                    // FLEXIBLE GRID:
                                                    // Unused

int AREATRANS_SQUARES_PER_GRID_UNIT     = FloatToInt(AREATRANS_GRID_UNIT/10.0);

// DO NOT ADJUST THESE Directional constants
const int ERROR             = -1;
const int NORTH             = 1;  // bit 1
const int SOUTH             = 2;  // bit 2
const int EAST              = 4;  // bit 3
const int WEST              = 8;  // bit 4

const int NORTHEAST         = 5;  // north + east
const int SOUTHEAST         = 6;  // south + east
const int NORTHWEST         = 9;  // north + west
const int SOUTHWEST         = 10; // south + west



// OTHER DATA ------------------------------------------------------------------
struct GRIDCOORD
{
    string prefix;
    string Xtag;
    string Ytag;
    string Ztag;
    int Xpos;
    int Ypos;
    int Zpos;
};

// FUNCTION DECLARATIONS -------------------------------------------------------

// leftover from Jaga's Seamless Area Transitioner. To be modified someday with unique VFX. - [FILE: area_trans]
void TransportEffect( object oTarget , float fDuration );
// Converts an integer to a string for use in the grid coord tag - [FILE: area_trans]
string GetCoordString(int nCoord);
// Returns the first prefix of a tag, without the underscore - [FILE: area_trans]
string GetTagPrefix(string sTag);
// Takes a Grid Tag and breaks it down into its components - [FILE: area_trans]
struct GRIDCOORD ParseGridTag(string sGridTag);
// Returns a tag representing coordinates on grid - [FILE: area_trans]
string GetGridTagAtPositionInArea(struct GRIDCOORD GridCoord, vector vPosition);
// Returns a tag representing coordinates on grid - [FILE: area_trans]
string GetGridTagAtDirection(struct GRIDCOORD GridCoord, int nDir, int nDist=1);
// Called by GetTransitionArea. - [FILE: area_trans]
// Looks for the area origin, by crawling from one grid node to the next FROM the grid node that the PC is transitioning to
object FindAreaContainingGridTag(string sDestGridTag, int nDir, object oPC);
// Returns an integer representing the direction that the PC is transitioning from the area - [FILE: area_trans]
// returns -1 on Error
int GetTransitionDirection(vector vPCVector, float fAreaThisHeight, float fAreaThisWidth, object oPC);
// Returns the name of the direction - [FILE: area_trans]
string GetDirectionName(int nDir);
// Returns an area object in nDir direction from the grid coords sPCGridTag - [FILE: area_trans]
object GetTransitionArea(string sDestGridTag, int nDir, object oPC);


// FUNCTION IMPLEMENTATIONS ----------------------------------------------------

void TransportEffect (object oTarget, float fDuration)
{
    effect eZoneEffect1 = EffectVisualEffect(VFX_DUR_INVISIBILITY);
    //effect eZoneEffect2 = EffectVisualEffect(VFX_IMP_ACID_L);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eZoneEffect1,oTarget,(fDuration*2.0f));
    //ApplyEffectToObject(DURATION_TYPE_INSTANT,eZoneEffect2,oTarget);
}

string GetCoordString(int nCoord)
{
    string sCoord   = IntToString(abs(nCoord));
    if ((nCoord < 10) && (nCoord > -1))  return ("p0"+sCoord);
    else if ((nCoord > 9) && (nCoord < 100))  return ("p"+sCoord);
    else if ((nCoord > -10) && (nCoord < 0))  return ("n0"+sCoord);
    else if ((nCoord > -100) && (nCoord < -9))  return ("n"+sCoord);

    return "";
}

string GetTagPrefix(string sTag)
{
    string sTagPrefix   = "";
    int iPos1           = FindSubString(sTag, "_");
    int iPos2;
    int iLastPos        = GetStringLength(sTag)-1;

    if (iPos1 > 0)
    {
        sTagPrefix   = GetStringLeft(sTag, iPos1); // returns prefix without underscores
    }
    else if (iPos1 == 0)
    {
        // we have a leading underscore
        iPos2 = FindSubString(sTag, "_", ++iPos1);// look for a second underscore
        if (iPos2 != -1 && iPos2 != 1 && iPos2 != iLastPos) // ignore: _XXXXX , __XXXX , _XXXX_
        {
            sTagPrefix  = GetSubString(sTag, iPos1, iPos2 - iPos1);
        }
    }

    return sTagPrefix;
}

struct GRIDCOORD ParseGridTag(string sGridTag)
{
    struct GRIDCOORD GridCoord;

    GridCoord.prefix        = GetStringLeft(sGridTag, (GetStringLength(sGridTag)-9) );
    string sAreaTagCoord    = GetStringRight(sGridTag, 9);
    GridCoord.Xtag          = GetStringLeft(sAreaTagCoord,3);   // X-coordinate of current area (from Tag)
    GridCoord.Ytag          = GetSubString(sAreaTagCoord,3,3);  // Y-coordinate of current area (from Tag)
    GridCoord.Ztag          = GetStringRight(sAreaTagCoord,3);  // Z-coordinate of current area (from Tag)

    GridCoord.Xpos          = StringToInt(GetStringRight(GridCoord.Xtag,2));
    if(!(GetStringLeft(GridCoord.Xtag,1)=="p"))
        GridCoord.Xpos      *= -1;

    GridCoord.Ypos          = StringToInt(GetStringRight(GridCoord.Ytag,2));
    if(!(GetStringLeft(GridCoord.Ytag,1)=="p"))
        GridCoord.Ypos      *= -1;

    GridCoord.Zpos          = StringToInt(GetStringRight(GridCoord.Ztag,2));
    if(!(GetStringLeft(GridCoord.Ztag,1)=="p"))
        GridCoord.Zpos      *= -1;

    return GridCoord;
}

string GetGridTagAtPositionInArea(struct GRIDCOORD GridCoord, vector vPosition)
{
    int nPosX               = GridCoord.Xpos + FloatToInt( (vPosition.x/AREATRANS_GRID_UNIT) );
    int nPosY;
    // This bit of code is required to make this code compatible with the original seamless area trans grid coordinates
    // the original seamless area transitions used a non-cartesian grid in which numbers increased going south and east
    // On a cartesian grid numbers increase going north and east
    if(!AREATRANS_GRID_CARTESIAN)
        nPosY   = GridCoord.Ypos - FloatToInt( (vPosition.y/AREATRANS_GRID_UNIT) );
    else
        nPosY   = GridCoord.Ypos + FloatToInt( (vPosition.y/AREATRANS_GRID_UNIT) );

    // construct grid tag in same manner as area tag
    return( GridCoord.prefix + GetCoordString(nPosX) + GetCoordString(nPosY) + GridCoord.Ztag );
}

string GetGridTagAtDirection(struct GRIDCOORD GridCoord, int nDir, int nDist=1)
{
    int nPosX   = GridCoord.Xpos;
    int nPosY   = GridCoord.Ypos;
    if(AREATRANS_GRID_CARTESIAN)
    {
        //if(nDir==NORTH || nDir==NORTHEAST || nDir==NORTHWEST)
        if(nDir&NORTH)
            nPosY   += nDist;
        //else if(nDir==SOUTH || nDir==SOUTHEAST || nDir==SOUTHWEST)
        else if(nDir&SOUTH)
            nPosY   -= nDist;
    }
    else
    {
        //if(nDir==NORTH || nDir==NORTHEAST || nDir==NORTHWEST)
        if(nDir&NORTH)
            nPosY   -= nDist;
        //else if(nDir==SOUTH || nDir==SOUTHEAST || nDir==SOUTHWEST)
        else if(nDir&SOUTH)
            nPosY   += nDist;
    }
    //if(nDir==EAST || nDir==NORTHEAST || nDir==SOUTHEAST)
    if(nDir&EAST)
        nPosX   += nDist;
    //else if(nDir==WEST || nDir==NORTHWEST || nDir==SOUTHWEST)
    else if(nDir&WEST)
        nPosX   -= nDist;

    // construct grid tag in same manner as area tag
    return( GridCoord.prefix + GetCoordString(nPosX) + GetCoordString(nPosY) + GridCoord.Ztag );
}

object FindAreaContainingGridTag(string sDestGridTag, int nDir, object oPC)
{
    // if nothing is found look for the valid area tag by cycling through nearby grid coordinates
    string sAreaGridTag;
    int nMax        = FloatToInt(320.0/AREATRANS_GRID_UNIT)-1;
    int nMaxSouth, nMaxWest, nDist;
    int nSouth, nWest;
    if(nDir!=NORTH)
        nMaxSouth   = nMax;
    if(nDir!=EAST)
        nMaxWest    = nMax;
    struct GRIDCOORD SearchCoord  = ParseGridTag(sDestGridTag);
    object oArea    = OBJECT_INVALID;
    while(oArea==OBJECT_INVALID)
    {
        if(nSouth<nMaxSouth)
        {
            // Search South
            sAreaGridTag = GetGridTagAtDirection(SearchCoord, SOUTH, ++nSouth);
            if(AREATRANS_DEBUG)
                SendMessageToPC(oPC,"Searching South ("+IntToString(nSouth)+"): "+sAreaGridTag);
        }
        else if(nWest<nMaxWest)
        {
            // Reset Southward search and search West
            nSouth  = 0;
            ++nWest;
            if(nDir==NORTHEAST)
                nMaxSouth   = 0;
            sAreaGridTag = GetGridTagAtDirection(SearchCoord, WEST);
            SearchCoord  = ParseGridTag(sAreaGridTag);
            if(AREATRANS_DEBUG)
                SendMessageToPC(oPC,"Shifting West ("+IntToString(nWest)+"): "+sAreaGridTag);
        }
        else
        {
            // Out of bounds
            break;
        }

        oArea   = GetObjectByTag(sAreaGridTag);
        if(oArea!=OBJECT_INVALID)
        {
            int nSquareHeight   = GetAreaSize(AREA_HEIGHT, oArea)/AREATRANS_SQUARES_PER_GRID_UNIT;
            if(!nSquareHeight)  nSquareHeight=1;
            int nSquareWidth    = GetAreaSize(AREA_WIDTH, oArea)/AREATRANS_SQUARES_PER_GRID_UNIT;
            if(!nSquareWidth)   nSquareWidth=1;

            if(     nSquareHeight<=nSouth
                ||  nSquareWidth<=nWest
              )
            {
                oArea   = OBJECT_INVALID;
            }
            else
                SetLocalString(AREATRANS_DATA, sDestGridTag, sAreaGridTag);
        }
    }

    return oArea;
}

int GetTransitionDirection(vector vPCVector, float fAreaThisHeight, float fAreaThisWidth, object oPC)
{
    int nDir            = ERROR;                            // return value on error

    int bNorth, bSouth, bEast, bWest;
    bNorth  = (vPCVector.y > (fAreaThisHeight-10.0));
    if(!bNorth)
        bSouth  = (vPCVector.y <= 10.0);
    bEast   = (vPCVector.x > (fAreaThisWidth-10.0));
    if(!bEast)
        bWest   = (vPCVector.x <= 10.0);

    // On Northern edge tile (area)
    if(bNorth)
    {
        // On North-Eastern corner tile
        if(bEast)
        {
            float fNorthDist    = fAreaThisHeight - vPCVector.y;        // Distance from North edge
            float fEastDist     = fAreaThisWidth - vPCVector.x;         // Distance from East edge

            if(fNorthDist<=AREATRANS_DIAGONAL_OFFSET && fEastDist<=AREATRANS_DIAGONAL_OFFSET)
            {
                nDir    = NORTHEAST;
                if(fEastDist<fNorthDist)
                    SetLocalInt(oPC, "AREATRANS_DIRECTION_BACKUP", EAST);
                else
                    SetLocalInt(oPC, "AREATRANS_DIRECTION_BACKUP", NORTH);
            }
            else if(fEastDist<fNorthDist)
                nDir    = EAST;
            else
                nDir    = NORTH;
        }
        // On North-Western corner tile
        else if(bWest)
        {
            float fNorthDist    = fAreaThisHeight - vPCVector.y;        // Distance from North edge

            if(fNorthDist<=AREATRANS_DIAGONAL_OFFSET && vPCVector.x<=AREATRANS_DIAGONAL_OFFSET)
            {
                nDir    = NORTHWEST;
                if(vPCVector.x<fNorthDist)
                    SetLocalInt(oPC, "AREATRANS_DIRECTION_BACKUP", WEST);
                else
                    SetLocalInt(oPC, "AREATRANS_DIRECTION_BACKUP", NORTH);
            }
            else if(vPCVector.x<fNorthDist)
                nDir    = WEST;
            else
                nDir    = NORTH;
        }
        else
            nDir= NORTH;
    }
    // On Southern edge tile (area)
    else if(bSouth)
    {
        // On South-Eastern corner tile
        if(bEast)
        {
            float fEastDist     = fAreaThisWidth - vPCVector.x;         // Distance from East edge

            if(vPCVector.y<=AREATRANS_DIAGONAL_OFFSET && fEastDist<=AREATRANS_DIAGONAL_OFFSET)
            {
                nDir    = SOUTHEAST;
                if(fEastDist<vPCVector.y)
                    SetLocalInt(oPC, "AREATRANS_DIRECTION_BACKUP", EAST);
                else
                    SetLocalInt(oPC, "AREATRANS_DIRECTION_BACKUP", SOUTH);
            }
            else if(fEastDist<vPCVector.y)
                nDir    = EAST;
            else
                nDir    = SOUTH;
        }
        // On South-Western corner tile
        else if(bWest)
        {
            if(vPCVector.y<=AREATRANS_DIAGONAL_OFFSET && vPCVector.x<=AREATRANS_DIAGONAL_OFFSET)
            {
                nDir    = SOUTHWEST;
                if(vPCVector.x<vPCVector.y)
                    SetLocalInt(oPC, "AREATRANS_DIRECTION_BACKUP", WEST);
                else
                    SetLocalInt(oPC, "AREATRANS_DIRECTION_BACKUP", SOUTH);
            }
            else if(vPCVector.x<vPCVector.y)
                nDir    = WEST;
            else
                nDir    = SOUTH;
        }
        else
            nDir= SOUTH;
    }
    else if(bEast)
        nDir    = EAST;
    else if(bWest)
        nDir    = WEST;

    return nDir;
}

string GetDirectionName(int nDir)
{
    string sDir;
    if(nDir&NORTH)
        sDir="north";
    else if(nDir&SOUTH)
        sDir="south";
    if(nDir&EAST)
        sDir+="east";
    else if(nDir&WEST)
        sDir+="west";

    return sDir;
}

object GetTransitionArea(string sDestGridTag, int nDir, object oPC)
{
    // look up the area for those coordinates
    object oArea        = GetObjectByTag(sDestGridTag);
    if(!AREATRANS_FLEXIBLE_GRID && oArea==OBJECT_INVALID)
    {
        // "table" look up
        oArea   = GetObjectByTag(GetLocalString(AREATRANS_DATA, sDestGridTag));
        if(oArea==OBJECT_INVALID)
        {
            // search for area
            oArea   = FindAreaContainingGridTag(sDestGridTag, nDir, oPC);
        }
    }

    return oArea;
}

void main()
{
    object oPC = GetClickingObject();
    if(oPC==OBJECT_INVALID || GetLocalInt(oPC,"m_nZoning"))
    {
        if(AREATRANS_DEBUG)
            SendMessageToPC(oPC,"The transition refractory period has not elapsed yet...");
        SendMessageToAllDMs("AREA TRANS: "+GetName(oPC)+" was either invalid, already zoning, or had it's Don't Zone flag set.");
        return;
    }
    else if(GetLocalInt(GetLocalObject(oPC, "SpawnedBy"),"DontZone")==1)
        return;


    location lLocPC         = GetLocation(oPC);
    vector vPCVector        = GetPositionFromLocation(lLocPC);  // PC's current Vector
    object oAreaThis        = GetArea(OBJECT_SELF);
    int nAreaThisHeight     = GetAreaSize(AREA_HEIGHT, oAreaThis);
    int nAreaThisWidth      = GetAreaSize(AREA_WIDTH, oAreaThis);

    float fAreaThisHeight   = nAreaThisHeight*10.0;
    float fAreaThisWidth    = nAreaThisWidth*10.0;

    // Parse this Area's Grid Coordinates
    struct GRIDCOORD AreaThis   = ParseGridTag(GetTag(oAreaThis));
    // Get PC's Grid Coordinates
    struct GRIDCOORD PCOrig;
    if( AREATRANS_FLEXIBLE_GRID
        ||(     fAreaThisHeight==AREATRANS_GRID_UNIT
            &&  fAreaThisWidth==AREATRANS_GRID_UNIT
          )
      )
        PCOrig              = AreaThis;
    else
        PCOrig              = ParseGridTag(GetGridTagAtPositionInArea(AreaThis,vPCVector));

    // Get Direction of Transition
    int nDir                = GetTransitionDirection(vPCVector, fAreaThisHeight, fAreaThisWidth, oPC);

    // Get Tag of Destination Grid Coordinates
    string sDestGridTag     = GetGridTagAtDirection(PCOrig, nDir);
    if(AREATRANS_DEBUG)
        SendMessageToPC(oPC, "AREA("+GetTag(oAreaThis)+") ORIGIN("+GetGridTagAtPositionInArea(AreaThis,vPCVector)+") DIRECTION("+GetDirectionName(nDir)+") DEST("+sDestGridTag+")");

    // Get Area of Transition
    object oAreaDest        = GetTransitionTarget(OBJECT_SELF);
    if(oAreaDest!=OBJECT_INVALID)
    {
        oAreaDest           = GetArea(oAreaDest);
    }
    else
    {
        oAreaDest           = GetTransitionArea(sDestGridTag, nDir, oPC);
    }

    if( oAreaDest==OBJECT_INVALID )
    {
        // Backup Direction to try?
        int nDirBak = GetLocalInt(oPC, "AREATRANS_DIRECTION_BACKUP");
        if(nDirBak)
        {
            nDir            = nDirBak;
            sDestGridTag    = GetGridTagAtDirection(PCOrig, nDir);
            if(AREATRANS_DEBUG)
                SendMessageToPC(oPC, "SECOND TRY AREA("+GetTag(oAreaThis)+") ORIGIN("+GetGridTagAtPositionInArea(AreaThis,vPCVector)+") DIRECTION("+GetDirectionName(nDir)+") DEST("+sDestGridTag+")");
            oAreaDest       = GetTransitionArea(sDestGridTag, nDir, oPC);
        }
    }

    // Garbage collection
    DeleteLocalInt(oPC, "AREATRANS_DIRECTION_BACKUP");

    // Get Position in Destination Area ----------------------------------------
    float fX; // east-west within destination area to western edge of gridline
    float fY; // north-south within destination area to southern edge of grid
    // INFLEXIBLE GRID
    if(!AREATRANS_FLEXIBLE_GRID)
    {
        struct GRIDCOORD Orig   = ParseGridTag(GetTag(oAreaDest));
        struct GRIDCOORD Dest   = ParseGridTag(sDestGridTag);

        if(nDir==NORTH)
        {
            fX  = ((Dest.Xpos-Orig.Xpos) * AREATRANS_GRID_UNIT);
            fX += (vPCVector.x - ((PCOrig.Xpos-AreaThis.Xpos) * AREATRANS_GRID_UNIT));
            fY  = AREATRANS_LANDING_OFFSET;
        }
        else if(nDir==SOUTH)
        {
            fX  = ((Dest.Xpos-Orig.Xpos) * AREATRANS_GRID_UNIT);
            fX += (vPCVector.x - ((PCOrig.Xpos-AreaThis.Xpos) * AREATRANS_GRID_UNIT));
            fY  = (10.0*GetAreaSize(AREA_HEIGHT, oAreaDest)) - AREATRANS_LANDING_OFFSET;
        }
        else if(nDir==EAST)
        {
            fX  = AREATRANS_LANDING_OFFSET;
            fY  = (abs(Dest.Ypos-Orig.Ypos) * AREATRANS_GRID_UNIT);
            fY += (vPCVector.y - (abs(PCOrig.Ypos-AreaThis.Ypos) * AREATRANS_GRID_UNIT));
        }
        else if(nDir==WEST)
        {
            fX  = (10.0*GetAreaSize(AREA_WIDTH, oAreaDest)) - AREATRANS_LANDING_OFFSET;
            fY  = (abs(Dest.Ypos-Orig.Ypos) * AREATRANS_GRID_UNIT);
            fY += (vPCVector.y - (abs(PCOrig.Ypos-AreaThis.Ypos) * AREATRANS_GRID_UNIT));
        }
        else if(nDir==NORTHEAST)
        {
            fX  = ((Dest.Xpos-Orig.Xpos)*AREATRANS_GRID_UNIT) + AREATRANS_LANDING_OFFSET;
            fY  = (abs(Dest.Ypos-Orig.Ypos)*AREATRANS_GRID_UNIT) + AREATRANS_LANDING_OFFSET;
        }
        else if(nDir==SOUTHEAST)
        {
            fX  = ((Dest.Xpos-Orig.Xpos)*AREATRANS_GRID_UNIT) + AREATRANS_LANDING_OFFSET;
            fY  = (abs(Dest.Ypos-Orig.Ypos)*AREATRANS_GRID_UNIT) + (AREATRANS_GRID_UNIT-AREATRANS_LANDING_OFFSET);
        }
        else if(nDir==SOUTHWEST)
        {
            fX  = ((Dest.Xpos-Orig.Xpos)*AREATRANS_GRID_UNIT) + (AREATRANS_GRID_UNIT-AREATRANS_LANDING_OFFSET);
            fY  = (abs(Dest.Ypos-Orig.Ypos)*AREATRANS_GRID_UNIT) + (AREATRANS_GRID_UNIT-AREATRANS_LANDING_OFFSET);
        }
        else if(nDir==NORTHWEST)
        {
            fX  = ((Dest.Xpos-Orig.Xpos)*AREATRANS_GRID_UNIT) + (AREATRANS_GRID_UNIT-AREATRANS_LANDING_OFFSET);
            fY  = (abs(Dest.Ypos-Orig.Ypos)*AREATRANS_GRID_UNIT) + AREATRANS_LANDING_OFFSET;
        }
    }
    // FLEXIBLE GRID
    else
    {
        if(nDir==NORTH)
        {
            int nAreaDestWidth  = GetAreaSize(AREA_WIDTH, oAreaDest);
            fX  = vPCVector.x * (nAreaDestWidth/IntToFloat(nAreaThisWidth));
            if(fX<AREATRANS_LANDING_OFFSET)
                fX  = AREATRANS_LANDING_OFFSET;
            else if(fX>((10.0*nAreaDestWidth)-AREATRANS_LANDING_OFFSET))
                fX  = ((10.0*nAreaDestWidth)-AREATRANS_LANDING_OFFSET);
            fY  = AREATRANS_LANDING_OFFSET;
        }
        else if(nDir==SOUTH)
        {
            int nAreaDestWidth  = GetAreaSize(AREA_WIDTH, oAreaDest);
            fX  = vPCVector.x * (nAreaDestWidth/IntToFloat(nAreaThisWidth));
            if(fX<AREATRANS_LANDING_OFFSET)
                fX  = AREATRANS_LANDING_OFFSET;
            else if(fX>((10.0*nAreaDestWidth)-AREATRANS_LANDING_OFFSET))
                fX  = ((10.0*nAreaDestWidth)-AREATRANS_LANDING_OFFSET);

            fY  = (10.0*GetAreaSize(AREA_HEIGHT, oAreaDest)) - AREATRANS_LANDING_OFFSET;
        }
        else if(nDir==EAST)
        {
            int nAreaDestHeight = GetAreaSize(AREA_HEIGHT, oAreaDest);
            fX  = AREATRANS_LANDING_OFFSET;
            fY  = vPCVector.y * (nAreaDestHeight/IntToFloat(nAreaThisHeight));
            if(fY<AREATRANS_LANDING_OFFSET)
                fY  = AREATRANS_LANDING_OFFSET;
            else if(fY>((10.0*nAreaDestHeight)-AREATRANS_LANDING_OFFSET))
                fY  = ((10.0*nAreaDestHeight)-AREATRANS_LANDING_OFFSET);
        }
        else if(nDir==WEST)
        {
            int nAreaDestHeight = GetAreaSize(AREA_HEIGHT, oAreaDest);
            fX  = (10.0*GetAreaSize(AREA_WIDTH, oAreaDest)) - AREATRANS_LANDING_OFFSET;
            fY  = vPCVector.y * (nAreaDestHeight/IntToFloat(nAreaThisHeight));
            if(fY<AREATRANS_LANDING_OFFSET)
                fY  = AREATRANS_LANDING_OFFSET;
            else if(fY>((10.0*nAreaDestHeight)-AREATRANS_LANDING_OFFSET))
                fY  = ((10.0*nAreaDestHeight)-AREATRANS_LANDING_OFFSET);
        }
        else if(nDir==NORTHEAST)
        {
            fX  = AREATRANS_LANDING_OFFSET;
            fY  = AREATRANS_LANDING_OFFSET;
        }
        else if(nDir==SOUTHEAST)
        {
            fX  = AREATRANS_LANDING_OFFSET;
            fY  = (10.0*GetAreaSize(AREA_HEIGHT, oAreaDest)) - AREATRANS_LANDING_OFFSET;
        }
        else if(nDir==SOUTHWEST)
        {
            fX  = (10.0*GetAreaSize(AREA_WIDTH, oAreaDest)) - AREATRANS_LANDING_OFFSET;
            fY  = (10.0*GetAreaSize(AREA_HEIGHT, oAreaDest)) - AREATRANS_LANDING_OFFSET;
        }
        else if(nDir==NORTHWEST)
        {
            fX  = (10.0*GetAreaSize(AREA_WIDTH, oAreaDest)) - AREATRANS_LANDING_OFFSET;
            fY  = AREATRANS_LANDING_OFFSET;
        }

    }

    if(AREATRANS_DEBUG)
    {
        SendMessageToPC(oPC,"AREA FROM ("+GetTag(oAreaThis)+") TO ("+GetTag(oAreaDest)+")");
        SendMessageToPC(oPC,"GRID FROM ("+GetGridTagAtPositionInArea(AreaThis,vPCVector)+") TO ("+sDestGridTag+")");
        SendMessageToPC(oPC,"POSITION FROM ("+FloatToString(vPCVector.x,6)+", "+FloatToString(vPCVector.y,6)+") TO ("+FloatToString(fX,6)+", "+FloatToString(fY,6)+")");
    }

    if(oAreaDest!=OBJECT_INVALID)
    {
        //if(!GetIsPC(oPC))
        //    SetCommandable(TRUE, oPC);

        // Enable pursuit - by providing transition to go to
        //SetLocalObject(oPC, "TRANSITION_LAST", OBJECT_SELF);
        //SetLocalLocation(oPC,"TRANSITION_LAST", lLocPC);

        //effect eZoneEffect3     = EffectVisualEffect(VFX_IMP_ACID_L);   // ZoneIn effect for end-of-transition
        location lDestination   = Location(oAreaDest, Vector(fX, fY), GetFacingFromLocation(lLocPC));

        SetLocalInt(oPC,"m_nZoning",TRUE);
        TransportEffect(oPC,AREATRANS_DELAY);
        string sDir = GetDirectionName(nDir);
        SendMessageToPC(oPC, "... heading "+GetStringUpperCase(GetStringLeft(sDir,1))+GetStringRight(sDir,GetStringLength(sDir)-1)+" ...");
        DelayCommand(   AREATRANS_DELAY,
                        AssignCommand(oPC, JumpToLocation(lDestination) )
                     );
        DelayCommand(   AREATRANS_DELAY+AREATRANS_REFACTORY_PERIOD,
                        DeleteLocalInt(oPC,"m_nZoning")
                     );
        /*
        DelayCommand(   AREATRANS_DELAY,
                        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eZoneEffect3,lDestination)
                     );
        */
    }
    else if(AREATRANS_DEBUG)
        SendMessageToPC(oPC,"Movement to an invalid area attempted.  Area was not found with specified TAG.");
}
