//::///////////////////////////////////////////////
//:: ZEP_TORCH.nss
//:: Copyright (c) 2001 Bioware Corp.
//:: Modified by Dan Heidel 1/21/04 for CEP
//:://////////////////////////////////////////////
/*
    Turns the placeable object's animation on/off
    for the activation of torches, candles and othe light sources.
    It works by deleting the calling object and replacing it with its
    lit/unlit counterpart.  Although this function ignores the value of
    CEP_L_LIGHTCYCLE, if that localint is set to 1, the placeable will
    revert back to its normal lit/unlit day/night cycle state on the
    next heartbeat.  To properly turn off a cycling light-source placeable,
    CEP_L_LIGHTCYCLE must be set to 0.

    Works as zep_onoff except that no sounds are called and a
    lighting effect is called on the placeable instead.  The
    light type is stored in a local int CEP_L_LIGHT.  CEP_L_LIGHT is
    defined in zep_torchspawn from a table of constants - eg:
    VFX_DUR_LIGHT_YELLOW_20.  CEP_L_LIGHTCONST is a local string defined
    on the placeable which is used to set CEP_L_LIGHTCONST to the proper value.
    Place the name of the constant in this local string so that
    zep_torchspawn to operate correctly.

*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:  January 2002
//:://////////////////////////////////////////////

#include "zep_inc_main"


void main()
{
    location lLoc = GetLocation(OBJECT_SELF);
    string sResRef = GetResRef(OBJECT_SELF);
    int nAmIOn = GetLocalInt(OBJECT_SELF, "CEP_L_AMION");
    int nLightCycle = GetLocalInt(OBJECT_SELF, "CEP_L_LIGHTCYCLE");
    int nInitialized = GetLocalInt(OBJECT_SELF, "CEP_L_LIGHTINITIALIZED");
    int nLightDiurnal = GetIsNight();
    string sLightConst = GetLocalString(OBJECT_SELF, "CEP_L_LIGHTCONST");
    string sLightSwap = GetLocalString(OBJECT_SELF, "CEP_L_LIGHTSWAP");
    int nLight = ColorInit(sLightConst);

    if(nAmIOn == 1){nAmIOn = 0;}
    else {nAmIOn = 1;}

    object oNew = CreateObject(OBJECT_TYPE_PLACEABLE, sLightSwap, lLoc);
    SetLocalInt(oNew, "CEP_L_AMION", nAmIOn);
    SetLocalInt(oNew, "CEP_L_LIGHTCYCLE", nLightCycle);
    SetLocalInt(oNew, "CEP_L_LIGHTINITIALIZED", nInitialized);
    SetLocalInt(oNew, "CEP_L_LIGHTDIURNAL", nLightDiurnal);
    SetLocalString(oNew, "CEP_L_LIGHTCONST", sLightConst);
    SetLocalString(oNew, "CEP_L_LIGHTSWAP", sResRef);

    if (nAmIOn == 1)
    {
        effect eLight = EffectVisualEffect(nLight);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLight, oNew);
    }
    DestroyObject(OBJECT_SELF, 0.0);
}
