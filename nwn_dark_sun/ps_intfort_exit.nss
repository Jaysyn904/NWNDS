/************************************
* Intellect Fortress onExit script  *
*                                   *
* Removes Int fortress effect.      *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=GetAreaOfEffectCreator();
    object oTarget=GetExitingObject();
    effect eChk=GetFirstEffect(oTarget);

    if (!GetIsFriend(oTarget, oPC)) return;

    while (GetIsEffectValid(eChk))
    {
        if (GetEffectType(eChk)==EFFECT_TYPE_SAVING_THROW_INCREASE && GetEffectSubType(eChk)==SUBTYPE_EXTRAORDINARY && GetEffectCreator(eChk)==oPC)
        {
            RemoveEffect(oTarget, eChk);
            break;
        }

        eChk=GetNextEffect(oTarget);
    }

}
