//::///////////////////////////////////////////////
//:: Name hb_prism
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Prismasaurus heartbeat script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void RandomGlow()
{
    int nEffect = 408 + Random(16);

    effect eGlow = EffectVisualEffect(nEffect);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eGlow,OBJECT_SELF,1.0);
}



void main()
{
    ExecuteScript("x2_def_heartbeat", OBJECT_SELF);

    RandomGlow();
    DelayCommand(1.0,RandomGlow());
    DelayCommand(2.0,RandomGlow());
    DelayCommand(3.0,RandomGlow());
    DelayCommand(4.0,RandomGlow());
    DelayCommand(5.0,RandomGlow());
}
