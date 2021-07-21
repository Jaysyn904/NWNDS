#include "nw_i0_tool"

void main()
{
  // Give the speaker the items
            int nVeggie = d3();
            //% chance
            if ((nVeggie > 0) && (nVeggie <= 1))
                CreateItemOnObject("giantslayersling", GetPCSpeaker(), 1);
            //% chance
            else if ((nVeggie > 1) && (nVeggie <= 2))
                CreateItemOnObject("dullsurgicalblad", GetPCSpeaker(), 1);
            //% chance
            else if ((nVeggie > 2) && (nVeggie <= 3))
                CreateItemOnObject("steelhalberd", GetPCSpeaker(), 1);
        }

