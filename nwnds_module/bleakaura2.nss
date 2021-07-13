#include "NW_I0_SPELLS"
void main()
{
    //Declare major variables
    int nDam;
    effect eDam;
    object oCaster = GetAreaOfEffectCreator();
    effect eVis = EffectVisualEffect(VFX_IMP_FROST_S);
    effect eVis3 = EffectVisualEffect(VFX_IMP_HEALING_S);
    effect eHeal = EffectHeal(10);
    object oTarget = GetFirstInPersistentObject();
    while(GetIsObjectValid(oTarget))
    {
        if(GetIsEnemy(oTarget, oCaster))
        {

            if ( MySavingThrow(SAVING_THROW_FORT, oTarget, 16, SAVING_THROW_TYPE_COLD, oCaster) )
                nDam = d6();
            else
                nDam = d6(2);
            if ( nDam > 0 )
            {
                eDam = EffectDamage(nDam,DAMAGE_TYPE_COLD);
                ApplyEffectToObject(DURATION_TYPE_INSTANT,eDam,oTarget);
                ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
                int nFlag = GetLocalInt(oCaster,"AURA_STATE");
                if ( nFlag == 0 )
                {
                    SetLocalInt(oCaster,"AURA_STATE",1);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis3,oCaster);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT,eHeal,oCaster);
                }
            }
        }
    oTarget = GetNextInPersistentObject();
    }
}
