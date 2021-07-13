#include "chess_include"

void main()
{
    string sSide = WHITE;
    int i = 0;
    while (i < 2)
    {
        int iP = 0;
        while (iP < 16)
        {
            object oP = GetChessPiece(sSide, iP);
            if (GetIsObjectValid(oP) == TRUE)
            {
                ExecuteScript("x_ch_jump", oP);
            }
            iP = iP + 1;
        }

        object oP;

        // fix the position of any promoted pawns.
        for (iP = 1 ; iP < 9 ; iP++)
        {
            oP = GetChessPiece(sSide, 14, iP);
            if (GetIsObjectValid(oP) == TRUE)
            {
                ExecuteScript("x_ch_jump", oP);
            } else {
                break;
            }
        }

        i = i + 1;
        sSide = BLACK;
    }
}
