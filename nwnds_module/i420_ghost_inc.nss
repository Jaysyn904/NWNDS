/////////////////////////////////////////////////////
//                                                 //
//  Invizible420's Ghost w/ visuals and Possession //
//                                                 //
//  Created 03/11/03 By: Invizible420              //
//                                                 //
/////////////////////////////////////////////////////
/*
   Description:  This is the on_heartbeat script
      for a ghost.  I tried to make it fairly
      accurate to 3rd edition rules (at least as
      close as NWN will let me).

      This heartbeat script will give the ghost a
      percent chance to use Malevolence (posses)
      the pc as well as do some of the other nasty
      things that 3rd edition ghosts can do.

      This script will only fire if a PC is within
      fDist (See Below) meters of the ghost and if
      a PC is in the area.
      So to not consume unnecessary CPU cycles.

         SEE i420_ghost_fx
         for more details and customization
*/

void i420_Ghost(object oTarget)
{
ExecuteScript("i420_ghost_fx",oTarget);
}
