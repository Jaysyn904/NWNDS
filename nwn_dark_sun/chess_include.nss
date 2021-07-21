// Chess Include

float CHESS_STEP_SIZE = 2.54;
string WHITE = "White";
string BLACK = "Black";
string CHESS_ORIGIN_TAG = "ChessboardOrigin";

void SetupCustomChessTokens(string side);

int X_CH_BASE_TOKEN = 300;

// establishes all the tokens used in the dialog
void SetupCustomChessTokens(string side);

// returns a vector pointing the the Position of the xy square.
vector GetChessboardLocation(int x, int y);

// returns an object reference to the chesspiece with a tag side + id
object GetChessPiece(string side, int id, int Nth = 0);

// returns the string name of a chess piece's location
string GetChessSquareNameFromPiece(object piece);

// returns the string name of a square
string GetChessSquareName(int x, int y);

// returns the string name for the piece
string GetChessPieceNameFromPiece(object piece);

// returns the string name for the piece id #
string GetChessPieceName(int n);

// returns the side-name extracted from the tag
string GetSideFromTag(string tag);

// returns 1 if the location is a valid board location, 0 otherwise
int IsValidSquare(int x, int y);

// returns 0 if no, 1 if occupied by friendly, 2 if occupied by enemy
int IsSquareOccupied(int x, int y, string sFriendly = "White");

object GetPieceAtSquare(int x, int y);

// checks to see if the piece could be slid (spaces) times.  Checks for
// intervening pieces of either color.  The destination space causes a
// false return only when a friendly piece is there.
int TestSlideMove(string sSide, int iX, int iY, int dX, int dY, int spaces);

int TestIsMyTurn(string sSide);

void ToggleToMove();

int TestPieceExistance(string side, int piece_num);

// returns the facing degrees for which way white is supposed to be facing
float GetSideFacing(string sSide);

// returns the facing degrees for which way black is supposed to be facing.
float GetBlackFacing();

/*  For some reason the compiler complains regularly about no StartingConditional.. this is here to uncomment
 *  and compile, then recomment, and recompile.  Awkward, annoying, but it works.
 */
/*
int StartingConditional()
{
    return TRUE;
}
/**/
int TestIsMyTurn(string sSide)
{
    string sToMove = GetLocalString(GetArea(OBJECT_SELF), "CurrentMove");

    if (sToMove == sSide)
    {
        return TRUE;
    }

    if (sToMove == "" && sSide == WHITE)
    {
        return TRUE;
    }
    return FALSE;
}

void ToggleToMove()
{
    object oArea = GetArea(OBJECT_SELF);
    string sToMove = GetLocalString(oArea, "CurrentMove");

    if (sToMove == BLACK)
    {
        SetLocalString(oArea, "CurrentMove", WHITE);
    } else {
        SetLocalString(oArea, "CurrentMove", BLACK);
    }
}

object GetChessOrigin()
{
    int o_num = 0;
    object oOrigin;
    object oArea;

    oArea = GetArea(OBJECT_SELF);
    oOrigin = GetObjectByTag(CHESS_ORIGIN_TAG);

    while (oOrigin != OBJECT_INVALID && oArea != GetArea(oOrigin))
    {
        o_num = o_num + 1;
        oOrigin = GetObjectByTag(CHESS_ORIGIN_TAG, o_num);
    }

    return oOrigin;
}

vector GetChessboardLocation(int x, int y)
{
    object oArea = GetArea(OBJECT_SELF);

    if (GetLocalInt(oArea, "HaveSetup") == 0)
    {
        object oOrigin = GetChessOrigin();
        if (oOrigin == OBJECT_INVALID)
        {
            SpeakString("Error: cannot find origin of chessboard.");
            return Vector(0.0, 0.0, 0.0);
        }

        //SpeakString("White facing is " + FloatToString(GetFacing(oOrigin)));
        int iXbY;
        int iXbX;
        int iYbY;
        int iYbX;
        float facing = GetFacing(oOrigin);
        if ((facing > -45.0  && facing < 45.0) || (facing > 315.0 && facing < 405.0))
        {
            iXbX = 0;
            iXbY = 1;
            iYbX = -1;
            iYbY = 0;
        } else if (facing > 45.0 && facing < 135.0) {
            iXbX = 1;
            iXbY = 0;
            iYbX = 0;
            iYbY = 1;
        } else if (facing > 135.0 && facing < 225.0) {
            iXbX = 0;
            iXbY = -1;
            iYbX = 1;
            iYbY = 0;
        } else {
            iXbX = -1;
            iXbY = 0;
            iYbX = 0;
            iYbY = -1;
        }
        vector v = GetPosition(oOrigin);

        SetLocalFloat(oArea, "OriginX", v.x);
        SetLocalFloat(oArea, "OriginY", v.y);
        SetLocalFloat(oArea, "WhiteFacing", facing);
        SetLocalFloat(oArea, "BlackFacing", facing + 180.0);

        SetLocalInt(oArea, "XbX", iXbX);
        SetLocalInt(oArea, "XbY", iXbY);
        SetLocalInt(oArea, "YbX", iYbX);
        SetLocalInt(oArea, "YbY", iYbY);

        SetLocalInt(oArea, "HaveSetup", 1);
    }
    vector vVec = Vector(CHESS_STEP_SIZE * (y * GetLocalInt(oArea, "XbY") + x * GetLocalInt(oArea, "XbX")),
                         CHESS_STEP_SIZE * (y * GetLocalInt(oArea, "YbY") + x * GetLocalInt(oArea, "YbX")));
    vVec = vVec + Vector(GetLocalFloat(oArea, "OriginX"), GetLocalFloat(oArea, "OriginY"));
    return vVec;
}

object GetChessPiece(string side, int id, int Nth)
{
    string sTag = side + IntToString(id);

    int object_num = 0;
    object oPiece = GetObjectByTag(sTag, object_num);
    object oArea = GetArea(OBJECT_SELF);

    while (oPiece != OBJECT_INVALID && Nth >= 0)
    {
        if (oArea == GetArea(oPiece))    // correct board
        {
            if (Nth == 0)
            {
                return oPiece;
            } else {
                Nth = Nth - 1;
            }
        }
        object_num = object_num + 1;
        oPiece = GetObjectByTag(sTag, object_num);
    }

    return oPiece;
}

string GetChessSquareNameFromPiece(object piece)
{
  return GetChessSquareName(GetLocalInt(piece, "LocationX"), GetLocalInt(piece, "LocationY"));
}

string GetChessSquareName(int x, int y)
{
    string sName;

    switch (x)
    {
        case 0: sName = "A"; break;
        case 1: sName = "B"; break;
        case 2: sName = "C"; break;
        case 3: sName = "D"; break;
        case 4: sName = "E"; break;
        case 5: sName = "F"; break;
        case 6: sName = "G"; break;
        case 7: sName = "H"; break;
    }

    sName = sName + IntToString(y + 1);

    return sName;
}

string GetChessPieceNameFromPiece(object piece)
{
    int iID = StringToInt(GetSubString(GetTag(piece),5, 2));
    return GetChessPieceName(iID);
}

string GetChessPieceName(int n)
{
    string sName;

    switch(n)
    {
        case 0: case 1: case 2: case 3:
        case 4: case 5: case 6: case 7:
            sName = "Pawn";
            break;
        case 8: case 9:
            sName = "Rook";
            break;
        case 10: case 11:
            sName = "Knight";
            break;
        case 12: case 13:
            sName = "Bishop";
            break;
        case 14:
            sName = "Queen";
            break;
        case 15:
            sName = "King";
            break;
    }
    return sName;
}

int IsValidSquare(int x, int y)
{
  if (x >= 0 && y >= 0)
  {
    if (x <= 7 && y <= 7)
    {
      return TRUE;
    }
  }
  return FALSE;
}

int IsSquareOccupied(int x, int y, string sFriendly = "White")
{
    string sEnemy;
    if (sFriendly == WHITE)
    {
      sEnemy = BLACK;
    } else {
      sEnemy = WHITE;
    }

    object oAtDestination = GetPieceAtSquare(x, y);
    if (oAtDestination == OBJECT_INVALID)
        return 0;
    string sSide = GetSubString(GetTag(oAtDestination), 0, 5);
    if (sSide == sFriendly)
    {
        return 1;
    }
    if (sSide == sEnemy)
    {
        return 2;
    }
    return 0;
}

object GetPieceAtSquare(int x, int y)
{
    vector vDestination = GetChessboardLocation(x, y);
    location lTarget = Location(GetArea(OBJECT_SELF), vDestination, GetSideFacing(WHITE));

    // check for an object there.
    object oAtDestination = GetFirstObjectInShape(SHAPE_CUBE, 1.0, lTarget);

    while (oAtDestination != OBJECT_INVALID)
    {
        string sSide = GetSubString(GetTag(oAtDestination), 0, 5);
        if (sSide == WHITE || sSide == BLACK)
            return oAtDestination;
        oAtDestination = GetNextObjectInShape(SHAPE_CUBE, 1.0, lTarget);
    }
    return OBJECT_INVALID;
}


string GetSideFromTag(string tag)
{
    return GetSubString(tag,0, 5);
}

int TestPieceExistance(string side, int piece_num)
{
    object o = GetChessPiece(GetSideFromTag(side), piece_num);
    return GetIsObjectValid(o);
}

int TestSlideMove(string sSide, int iX, int iY, int dX, int dY, int spaces)
{
    if (sSide == BLACK)
    {
        dX = -dX;
        dY = -dY;
    }
    int iSumX = dX;
    int iSumY = dY;

    int i = 1;
    while (i < spaces)
    {
        if (IsValidSquare(iX + iSumX, iY + iSumY) == 0 || IsSquareOccupied(iX + iSumX, iY + iSumY) != 0)
            return FALSE;
        iSumX = iSumX + dX;
        iSumY = iSumY + dY;
        i = i + 1;
    }

    if (IsValidSquare(iX + iSumX, iY + iSumY))
    {
      if (IsSquareOccupied(iX + iSumX, iY + iSumY, sSide) != 1)
      {
        return TRUE;
      }
    }
    return FALSE;
}


float GetSideFacing(string sSide)
{
  return GetLocalFloat(GetArea(OBJECT_SELF), sSide + "Facing");
}

void SetupCustomChessTokens(string side)
{
    object oP;
    int i = 0;
    while (i < 16)
    {
        oP = GetChessPiece(side, i);
        SetCustomToken(X_CH_BASE_TOKEN + i, GetChessSquareNameFromPiece(oP));
        i = i + 1;
    }
    int j = 1;
    while (j < 9 && oP != OBJECT_INVALID)
    {
        oP = GetChessPiece(side, 14, j);
        SetCustomToken(X_CH_BASE_TOKEN + 15 + j, GetChessSquareNameFromPiece(oP));
        j = j + 1;
    }
}

int  GetStartingX(int piece_num)
{
    if (piece_num < 8 && piece_num >= 0)
    {
        return piece_num;
    } else {
        if (piece_num % 2 == 0)
        {
          return (piece_num - 8)/2;
        } else {
          return 7 - (piece_num - 8)/2;
        }
    }
}


void SummonArmy(string sPrefix, string sSide)
{
    int iIsWhite;

    int iX, iY;

    if (sSide == WHITE)
    {
        iIsWhite = TRUE;
        iY = 1; // the pawn row
    } else {
        iIsWhite = FALSE;
        iY = 6; // the pawn row
    }

    object oArea = GetArea(OBJECT_SELF);

    int iPiece = 0;
    vector vLoc;
    object oNewPiece;

    GetChessboardLocation(0, 0);    // initialize the facings.
    float fFacing = GetSideFacing(sSide);

    while (iPiece < 16)
    {
      iX = GetStartingX(iPiece);
      oNewPiece = CreateObject(OBJECT_TYPE_CREATURE, sPrefix + "_" + sSide + IntToString(iPiece),
                Location(oArea, GetChessboardLocation(iX, iY), fFacing), TRUE);
      SetLocalInt(oNewPiece, "LocationX", iX);
      SetLocalInt(oNewPiece, "LocationY", iY);
      iPiece = iPiece + 1;
      if (iPiece == 8)
      {
        if (iIsWhite)
        {
            iY = 0;
        } else {
            iY = 7;
        }
     }
    }
    SetLocalString(GetArea(OBJECT_SELF), "Summoned " + sSide, sPrefix);
}

void SummonPawnArmy(string sPrefix, string sSide)
{
    int iX, iY;

    if (sSide == WHITE)
    {
        iY = 1; // the pawn row
    } else {
        iY = 6; // the pawn row
    }

    object oArea = GetArea(OBJECT_SELF);

    int iPiece = 0;
    vector vLoc;
    object oNewPiece;

    GetChessboardLocation(0, 0);    // initialize the facings.
    float fFacing = GetSideFacing(sSide);

    /// Create the Pawns
    while (iPiece < 8)
    {
      iX = GetStartingX(iPiece);
      oNewPiece = CreateObject(OBJECT_TYPE_CREATURE, sPrefix + "_" + sSide + IntToString(iPiece),
                Location(oArea, GetChessboardLocation(iX, iY), fFacing), TRUE);
      SetLocalInt(oNewPiece, "LocationX", iX);
      SetLocalInt(oNewPiece, "LocationY", iY);
      iPiece = iPiece + 1;
    }

    /// Create the King
    iPiece = 15;
    iX = GetStartingX(iPiece);
    if (sSide == WHITE)
    {
        iY = 0;
    } else {
        iY = 7;
    }

    oNewPiece = CreateObject(OBJECT_TYPE_CREATURE, sPrefix + "_" + sSide + IntToString(iPiece),
            Location(oArea, GetChessboardLocation(iX, iY), fFacing), TRUE);
    SetLocalInt(oNewPiece, "LocationX", iX);
    SetLocalInt(oNewPiece, "LocationY", iY);

    SetLocalString(GetArea(OBJECT_SELF), "Summoned " + sSide, sPrefix);
}
