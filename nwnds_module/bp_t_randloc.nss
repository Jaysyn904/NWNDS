//::///////////////////////////////////////////////
//:: script(file)name: _incl_rndloc
//:: Type: includefile
//:://////////////////////////////////////////////
/*
Generates random Locations v1.0
Notes: To be refined and functions added.
*/
//:://////////////////////////////////////////////
//:: Created By: Hikade (nick: agem)
//:://////////////////////////////////////////////
// * (CONSTANTS) VARIABLES >
// NOTE: Only Vars here because i think editing the
// nwscript.nss is pointless due to the PATCH issue.
// Sorry this makes Function Declaration(s) less
// transparent, but this is the it is...
/* values form the nwscript.nss
int SHAPE_SPELLCYLINDER = 0;
int SHAPE_CONE = 1;
int SHAPE_CUBE = 2;
int SHAPE_SPELLCONE = 3;
int SHAPE_SPHERE = 4;
*/
int BASE_SHAPE_CONE     =   SHAPE_CONE; // :=1
int BASE_SHAPE_BOX      =   SHAPE_CUBE; // :=2
int BASE_SHAPE_CIRCLE   =   SHAPE_SPHERE; // :=4
int BASE_SHAPE_STAR     =   SHAPE_SPELLCYLINDER; // :=3
int DIMENSION_2D        =   0;
int DIMENSION_HEMISPHERE        = 1;
int DIMENSION_HEMISPHERE_PLUS   = 2;
int DIMENSION_3D        = 3;
int DIMENSION_3D_PLUS   = 4;
// * (CONSTANTS) VARIABLES <

// * Function Declaration(s) >

// Creates an Random Location in BASE_SHAPE_* (see Variables)
// - lTarget: Starting location from where to generate random location
// - iMaxRange : Maximal distance allowed for generated location
// - iMinRange : Minimal distance allowed for generated location
// -> When iMinRange=0 generated location can be on startingpoint
// -> When iMinRange=iMaxRange then generated location is always at Maximal Distance e.g. a empty circle
// - Shape : BASE_SHAPE_BOX = SHAPE_CUBE :=2 is Default (others see var BASE_SHAPE_*)
// - fAngle: Only used for certain BASE_SHAPE_*(see following)
// -> BASE_SHAPE_CONE Sets the center angle off Cone (Half Cone)
// -> BASE_SHAPE_STAR Sets Staring angel for first Starpoint
// - fAngle: Only used for certain BASE_SHAPE_*(see following)
// -> BASE_SHAPE_CONE +- angel of Cone center angel
// -> BASE_SHAPE_STAR Set value for ammount of Starpoints e.g. 5.0f = FIVE STAR
// - nDimension: Set Dimesion Type (see var DIMENSION_*)
// -> DIMENSION_2D :normal 2D you will most commonly use e.g. full circle
// -> DIMENSION_HEMISPHERE :Top Part of halfsphere, special: location z-value are porportional distance
// -> DIMENSION_HEMISPHERE_PLUS : Top Part of halfsphere and z-values will always be visible
// -> DIMENSION_3D: Full Sphere, ideal for floating things, special: location z-value are porportional distance
// -> DIMENSION_3D_Plus : Full Sphere, ideal for floating things, and z-values will mostly be visible
// Handy special cases:
// -> BASE_SHAPE_STAR with only 1 Starpoint is a Line with one direction.
// -> BASE_SHAPE_STAR with 2 Starpoints is a Line with a middlepoint that has in an left/right property
location RndLoc(location lTarget,int iMaxRange,int iMinRange=0,int nShape_Type=2,float fAngle=0.0f, float fAngleWidth=90.0f,int nDimension=0);
/*
float SetFacingType(float fDirection,location lTarget,object oSource=OBJECT_SELF);
*/
void FillArea();
// Creates an Random Sign 1/-1
int RndSign();
// Creates an Random Float
float RndFloat(int nMaxFloat);
// Creates an Random Angle
float RndAngle(int iDeg=360);
// Creates an Random Unit Vector
vector RndUnitVector();
// Create an Random z-value for an vector based on DIMENSION_*
float RndZCoor(float fZCoor,int iMaxRange,int iMinRange,int nDimension=0);

// * Function Implementation >
// Creates an Random Sign 1/-1
int RndSign()   {
    int iRndSign;
    if(Random(2)) iRndSign = -1; else iRndSign =1;
    return iRndSign;
}

// Creates an Random Float
float RndFloat(int nMaxFloat)   {
    float fRandom;
    int iPrefixPoint = Random(nMaxFloat);//+1;
    int iSufixPoint = Random(10)+1;
    return fRandom = IntToFloat(iPrefixPoint)+(IntToFloat(iSufixPoint)/10);
}

// Creates an Random Angle
float RndAngle(int iDeg=360)    {
    float fAngle;
    int iRndDeg = Random(iDeg)+1;
    int iRndMinute = Random(10)+1;
    return fAngle = IntToFloat(iRndDeg)+(IntToFloat(iRndMinute)/10);
}

// Creates an Random Unit Vector
vector RndUnitVector()  {
    vector vRndUnitVector = AngleToVector(RndAngle());
    return vRndUnitVector;
}
/*
float SetFacingType(float fDirection,location lTarget,object oSource=OBJECT_SELF)
{
vector vTarget = GetPositionFromLocation(lTarget);
vector vSource =GetPosition(oSource);
vector vDirection = AngleToVector(fDurection);
float fFacing = VectorToAngle(vTarget-vSource)+ fDirection;
return fFacing;
}
*/

// Create an Random z-value for an vector based on DIMENSION_*
float RndZCoor(float fZCoor,int iMaxRange,int iMinRange,int nDimension) {
    float fRndZCoor;
    switch (nDimension) {
        //DIMENSION_HEMISPHERE
        case 1 :
            {
            int zOffSet = Random(iMaxRange-iMinRange);
            fZCoor = fZCoor + (zOffSet + iMinRange);
            }
            break;
        // DIMENSION_HEMISPHERE_PLUS
        case 2 :
            {
            int zOffSet = Random(12);
            fZCoor = fZCoor + (zOffSet);
            }
            break;
        // DIMENSION_3D
        case 3 :
            {
            int zOffSet = Random(iMaxRange-iMinRange);
            fZCoor =fZCoor + (zOffSet + iMinRange)*RndSign();
            }
            break;
        //DIMENSION_3D_PLUS
        case 4 :
            {
            int zOffSet = Random(8);
            fZCoor = fZCoor + (zOffSet)*RndSign();
            }
            break;
        default: break;
    }
    return fRndZCoor=fZCoor;
}

// Creates an Random Location in BASE_SHAPE_*
location RndLoc(location lTarget,int iMaxRange,int iMinRange=0,int nShape_Type=2, float fAngle=0.0f, float fAngleWidth=90.0f,int nDimension=0)  {
    object oTargetArea = GetAreaFromLocation(lTarget);
    vector vTarget = GetPositionFromLocation(lTarget);
    float fTargetfacing = GetFacingFromLocation(lTarget);
    switch (nShape_Type)    {
        case 2: // BASE_SHAPE_BOX = SHAPE_CUBE :=2
            {
            if(Random(2))   {
                int xOffSet = Random(iMaxRange-iMinRange);
                int yOffSet = Random(iMaxRange);
                // To enable Q2,Q3,Q4 positions of vector
                vTarget.x = vTarget.x + (xOffSet + iMinRange)*RndSign();
                vTarget.y = vTarget.y + (yOffSet)* RndSign();
            } else {
                int xOffSet = Random(iMaxRange);
                int yOffSet = Random(iMaxRange-iMinRange);
                // To enable Q2,Q3,Q4 positions of vector
                vTarget.x = vTarget.x + (xOffSet) *RndSign();
                vTarget.y = vTarget.y + (yOffSet + iMinRange)*RndSign();
            }
            // Adds according z-value if demanded
            vTarget.z =RndZCoor(vTarget.z,iMaxRange,iMinRange,nDimension);
            }
            break;
        case 4: // BASE_SHAPE_CIRCLE = SHAPE_SPHERE :=4
            {
            int iRndRange = Random((iMaxRange+1)-iMinRange);
            vector vRandomUnitVector = RndUnitVector();
            vRandomUnitVector *= IntToFloat(iRndRange+iMinRange);
            vTarget += vRandomUnitVector;
            // Adds according z-value if demanded
            vTarget.z =RndZCoor(vTarget.z,iMaxRange,iMinRange,nDimension);
            }
            break;
        case 1: // BASE_SHAPE_CONE = SHAPE_CONE :=1
            {
            int iRndRange = Random((iMaxRange+1)-iMinRange);
            float fRndAngle = RndAngle(FloatToInt(fAngleWidth)/2*RndSign());
            fRndAngle += fAngle;
            vector vRndVector = AngleToVector(fRndAngle);
            vRndVector *= IntToFloat(iRndRange+iMinRange);
            vTarget += vRndVector;
            // Adds according z-value if demanded
            vTarget.z =RndZCoor(vTarget.z,iMaxRange,iMinRange,nDimension);
            }
            break;
            /* //difference to SHAPE_CONE unknown and a CYLINDER can be made by BASE_SHAPE_CIRCLE
            case SHAPE_SPELLCONE:
            {
            }break;
            */
        case 3: // BASE_SHAPE_STAR = SHAPE_SPELLCYLINDER :=3
            {
            int iRndRange = Random((iMaxRange+1)-iMinRange);
            float fStartingAngle = fAngle;
            float fAngleStep = (360.0f/fAngleWidth);
            float fRndAngel = Random(FloatToInt(fAngleWidth)+1)*fAngleStep;
            vector vRandomVector = AngleToVector(fRndAngel)*IntToFloat(iRndRange+iMinRange);
            vTarget += vRandomVector;
            // Adds according z-value if demanded
            vTarget.z =RndZCoor(vTarget.z,iMaxRange,iMinRange,nDimension);
            }
            break;
        default : break;
    }
    // return Random Location of wished type
    return lTarget= Location(oTargetArea,vTarget,fTargetfacing);
}

//void main (){}
