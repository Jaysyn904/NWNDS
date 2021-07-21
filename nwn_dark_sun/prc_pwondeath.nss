/**
  *  Custom PW OnDeath script to be used with the PRC and pwfxp system.
  *  Created by: fluffyamoeba
  *  Created on: 2007-11-14
  *
  *  Usage: put in your PW's module.
  *
  *  This script is executed by nw_c2_default7 (the default NPC OnDeath script)
  *  if using the PRC.
  */
  
// calls the pwfxp script.

void main () 
{
ExecuteScript("pwfxp", OBJECT_SELF);
}
