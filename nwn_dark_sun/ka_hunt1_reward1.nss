#include "nw_i0_tool"

void main()
{
  // Give the speaker the items
            int nVeggie = d3();
            //% chance
            if ((nVeggie > 0) && (nVeggie <= 1))
                CreateItemOnObject("kankhelm", GetPCSpeaker(), 1);
            //% chance
            else if ((nVeggie > 1) && (nVeggie <= 2))
                CreateItemOnObject("spelunkershelm", GetPCSpeaker(), 1);
            //% chance
            else if ((nVeggie > 2) && (nVeggie <= 3))
                CreateItemOnObject("steelhelmet", GetPCSpeaker(), 1);
        }

