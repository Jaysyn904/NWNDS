//::///////////////////////////////////////////////
//:: ZEP_TORCHSPAWN.nss
//:: Created by by Dan Heidel 1/21/04 for CEP
//:://////////////////////////////////////////////
/*
    This function is called on heartbeat and designed to exert minimal
    drag on the system except during module load.  This function is used
    to initialize light-emitting placeables.  Since there is no OnSpawn
    event handler for placeables, the OnHeartbeat handler is used instead.
    As long as the total number of lighting placeables is kept to a reasonable
    number, the CPU impact will be minimal.

    This is used to initialize a light-emitting placeable and to update certain
    placeable behaviors if certain conditions are met.

    The following local variables are used on light-emitting placeables:

    CEP_L_AMION: this is a localint that holds the present on-off state of the
    placeable.  If the placeable is to be switched on or off, please use the
    zep_torch or zep_torchupdate functions.  DO NOT CHANGE THIS VARIABLE MANUALLY.
    Doing so will cause the light-emitting placeable to stop functioning
    properly if done improperly.

    CEP_L_LIGHTCYCLE: this is a localint that determines whether the light-
    -emitting placeable will automatically switch itself on and off to match the
    day/night cycle.  If it is set to 1, the placeable will shut off during the
    day. If set to 0, the placeable does not change state unless zep_torch or
    zep_torchupdate are used to change it.
    Also note that cycling placeables update on every heartbeat.  This means
    that if a cycling light-emitter is turned off at night, it will switch back
    on on the next heartbeat.

    CEP_L_LIGHTCONST: this localstring holds the name of the lighting constant
    used to put a colored light on a lit light-emitting placeable.  For example,
    if a torch is supposed to emit a 20 foot diameter yellow light, CEP_L_LIGHTCONST
    should contain "YELLOW_20".  The function ColorInit in the zep_inc_main
    library converts this string into a number which can be used by the game
    engine.
    The following colors and light radii are available:
    White, Yellow, Orange, Red, Green, Blue and Purple  (note that Green actually
    calls a GREY lighting effect which is green for some inscrutible reason)
    5, 10, 15, 20 are the available radii.  Note that some light colors are
    brighter than others.  Consult the CEP Builder's guide for more information.

    Note: the ColorInit function only looks at the first two and last two
    characters of the string so YELLOW_5 could be called by YE_5 and RED_20
    with RE20 but for readability, the user is encouraged to use the full names.
    Note: changing this string only causes the lighting color to change when a
    a cycling light-emitter switches states, a light-emitter is switched on or
    off with zep_torch or when a zep_torchupdate is called on a light-emitter.

    CEP_L_LIGHTSWAP: this localstring holds the resref of its counterpart
    light-emitter.  For example, a lit wooden lantern's CEP_L_LIGHTSWAP
    contains "owoodlantern001" and an unlit wood lantern's CEP_L_LIGHTSWAP
    contains "woodlantern001".  This variable provides a handle so that the
    lit/unlit light-emitter placeable can be swapped for its counterpart
    when the placeable "switches" on or off.  NEVER CHANGE THIS VARIABLE.

    CEP_L_LIGHTINITIALIZED: this localint is 0 if the placeable hasn't been initialized
    yet, 1 if it has.  This localint is defined at runtime.  NEVER CHANGE THIS VARIABLE.

    CEP_L_LIGHTDIURNAL: this localint holds the last checked value of GetIsNight()
    for use by cycling torches.  Defined at runtime.  DO NOT CHANGE.

**************************************************

    Due to various limitations in the Aurora NWN graphics engine, the switching
    of light-emitting placeables is done by deleting the placeable and putting
    it's lit/unlit counterpart at the same position.

    Use zep_torch on a light-emitting placeable to switch it on or off.It is best
    to call zep_torch from another object or script since even if the torch is made
    usable, it will be replaced with a non-usable version when the on/off switch occurs.

    If the color of a light-emitting placeable is changed and the change is to
    be reflected in game, a zep_torchupdate must be used on the placeable.

    As provided, the light-emitting placeables provided in CEP should work with
    little to no builder intervention.  The local variables are all set.  Simply
    place a lit or unlit placeable and it will take care of itself.

    All light-emitting placeables in the Civilization Exterior/Lighting category
    are day/night cycling by default, the rest are non-cycling.  Change the value
    of CEP_L_LIGHTCYCLE in the variables on your placed placeable if you wish to
    change this.

    Likewise, the color and radius of the emitted light can be changed on placeables
    placed down in the toolset.

*/

#include "zep_inc_main"


void main()
{
    int nLightCycle = GetLocalInt(OBJECT_SELF, "CEP_L_LIGHTCYCLE");
    int nInitialized = GetLocalInt(OBJECT_SELF, "CEP_L_LIGHTINITIALIZED");
    //0 if the first time this function has run for this torch, 1 if it has run before
    //used so that non-cycling placeables use less CPU time.
    if (nInitialized == 1 & nLightCycle == 0) return;   //if torch is non cycling and has been initialized, quit

    int nAmIOn = GetLocalInt(OBJECT_SELF, "CEP_L_AMION");
    string sLightConst = GetLocalString(OBJECT_SELF, "CEP_L_LIGHTCONST");
    string sLightSwap = GetLocalString(OBJECT_SELF, "CEP_L_LIGHTSWAP");
    int nLight = ColorInit(sLightConst);

    if (nInitialized == 0){
        SetLocalInt(OBJECT_SELF, "CEP_L_LIGHTINITIALIZED", 1);
        SetLocalInt(OBJECT_SELF, "CEP_L_LIGHTDIURNAL", !GetIsNight());
    } //if the placeable wasn't marked as initialized, it is now.

    int nLightDiurnal = GetLocalInt(OBJECT_SELF, "CEP_L_LIGHTDIURNAL");
    SetLocalInt(OBJECT_SELF, "CEP_L_LIGHTDIURNAL", GetIsNight());
    //this gets the GetIsNight value from the last time zep_torchspawn fired
    //it is used to check to see if the torch needs to change state for day/night cycle

    if(nLightCycle == 1){ //if this is a cycling placeable
        if(GetIsNight() == nLightDiurnal) return;
        //if day/night hasn't changed since last time, return.

        if((GetIsNight() == 0)&(nAmIOn == 0)) return;
        if((GetIsNight() == 1)&(nAmIOn == 1)) return;
        //if the on/off state matches what it should be, return.

        //otherwise, destroy the placeable and place its lit/unlit counterpart at the same location
        if(nAmIOn == 1){nAmIOn = 0;}
        else {nAmIOn = 1;}

        string sResRef = GetResRef(OBJECT_SELF);
        location lLoc = GetLocation(OBJECT_SELF);

        object oNew = CreateObject(OBJECT_TYPE_PLACEABLE, sLightSwap, lLoc);
        SetLocalInt(oNew, "CEP_L_AMION", nAmIOn);
        SetLocalInt(oNew, "CEP_L_LIGHTCYCLE", nLightCycle);
        SetLocalInt(oNew, "CEP_L_LIGHTINITIALIZED", nInitialized);
        SetLocalInt(oNew, "CEP_L_LIGHTDIURNAL", GetIsNight());
        SetLocalString(oNew, "CEP_L_LIGHTCONST", sLightConst);
        SetLocalString(oNew, "CEP_L_LIGHTSWAP", sResRef);

        if (nAmIOn == 1)
        {
            effect eLight = EffectVisualEffect(nLight);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLight, oNew);
        }
        DestroyObject(OBJECT_SELF, 0.0);
        return;
    }else{

        //if not a cycling placeable and uninitialized, place a light effect, if needed
        if (nAmIOn == 1)
        {
            effect eLight = EffectVisualEffect(nLight);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLight, OBJECT_SELF);
        }
    }
}


