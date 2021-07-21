#include "re_rndenc"
void main()
{
object oPC = GetItemActivatedTarget();
RandomEncounter(100.0, oPC, "random", 0, 0, 0, 5, 360);
}
