/************************************
*   Death Field onExit script       *
*                                   *
* Removes recurring damage          *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=GetAreaOfEffectCreator();
    object oTarget=GetExitingObject();
    string sVarName=GetName(oPC)+"Field";

    if (oTarget==oPC) return;

    SetLocalInt(oTarget, sVarName, -1);

}
