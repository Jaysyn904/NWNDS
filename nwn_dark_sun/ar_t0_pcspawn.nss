#include "ar_inc_pcspawn"
#include "ar_db_main"

void CreateEnterEffect(object oPlayer);


void main(){


//add this afer the SubRaceOnenter Call
  object oPC = GetEnteringObject();
  if(GetIsDM(oPC))
  {
   // object oFirst = GetFirstPC();
   // if(GetIsObjectValid(oFirst))
   //     {
   //     ClearAllActions();
    //    AssignCommand(oPC,ActionJumpToObject(oFirst));
   //     return;
   //     }
        return;
  }


  //if(GetXP(oPC) == 0)GiveXPToCreature(oPC,3500);

  int bSkipJump = GetLocalInt(oPC,AR_SKIP_ONENTER_JUMP)== 1 ? TRUE: FALSE;

  if(!bSkipJump) // server has reset
  {
   //Server has reset
  DelayCommand(2.0f,CreateEnterEffect(oPC));

  SkipNextJump(oPC);
  int bGoToGray = GetHitDice(oPC) < 3 ? TRUE: FALSE;
  if(GetIsPC(oPC) && !GetIsDM(oPC)){
    if (!bGoToGray){
            location lLast = ARSX_GetLastLocation(oPC);
            AssignCommand(oPC,ActionJumpToLocation(lLast));
            }}

    }//Server has not reset...

}


void CreateEnterEffect(object oPlayer)
{
    float fDelay = 3.0f;

    int nAlign = GetAlignmentGoodEvil(oPlayer);
    if (nAlign == ALIGNMENT_GOOD)
        DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_CELESTIAL), GetLocation(oPlayer)));
    else if (nAlign == ALIGNMENT_EVIL)
        DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), GetLocation(oPlayer)));
    else
    {
        switch (d2())
        {
        case 1: DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_CELESTIAL), GetLocation(oPlayer)));
                break;
        case 2: DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), GetLocation(oPlayer)));
                break;
        }
    }
}
