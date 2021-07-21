//::///////////////////////////////////////////////
//:: Name Effect Functions
//:: FileName yr_inc_effects
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This is a collection of effect functions I use to aid in the ease of removing
    effects. I did not build a GetLocalEffect since this could not be used to rebuild
    the existing effect correctly unless called by the original object that created
    the original effect. All functions are explained below and broken up into two sections.
    The first section is a list of the functions you will use. The second section is a list
    of the functions used internally by this system.


    Functions most used:



    void SetLocalEffect(object oTarget, effect eEffect, string sVarName, int nDuration = DURATION_TYPE_PERMANENT, float fDuration = 0.0)


        This will apply and store eEffect on oTarget under the name sVarName. A couple of things
        to note here is that the effect eEffect must be defined already before storing it.
        When the effect is defined the creator of the effect is set. You will also need
        to define any sub types you wish to have on the effect also (supernatural
        or extraordinary). The last note about this is that until the effect is applied
        to the target it does not contain it's duration. If the desired duration is
        something besides DURATION_TYPE_PERMANENT you will need to specify it here.


        Usage:


        object oTarget = The object both the effect and the local effect will be on.
        effect eEffect = The effect to store on oTarget.
        string sVarName = The name under which the effect will be stored.
        int nDuration = The DURATION_TYPE_* that will be used when the effect is
                        applied. See notes above about the reason why this is here.
        float fDuration = The duration of the effect if the DURATION_TYPE_* is not permanent.



    int CheckLocalEffect(object oTarget, string sVarName)


        This checks oTarget for the local effect sVarName. This is a conditional
        that returns TRUE or FALSE. Mostly used for conversations but can be used
        for other situations that require an effect to be checked.


        Usage:


        object oTarget = The object the effect is applied to and stored on.
        string sVarName = The name under which the effect is applied.


    void RemoveLocalEffect(object oTarget, string sVarName, int nDeleteUponRemoval = TRUE)


        This will remove a local effect with the name sVarName from oTarget. It can
        also delete the stored local effect from oTarget. Use this instead of cycling
        through your effects using GetFirst/GetNextEffect and RemoveEffect.


        Usage:


        object oTarget = The object both the effect and the local effect are on.
        string sVarName = The name of the stored effect to remove.
        int nDeleteUponRemoval = TRUE or FALSE. This will delete the local effect
                                 from oTarget if the effect is found and removed.



    void SetLocalAOE(object oTarget, string sVarName, int nAreaEffectId, location lLoc, int nDuration = DURATION_TYPE_PERMANENT, int nIsAppliedToObject = TRUE, float fDuration = 0.0, string sOnEnterScript = "", string sHeartbeatScript="", string sOnExitScript="")


        This will store an Area of Effect on oTarget and either apply it to oTarget
        or at a location you specify. If you wish to apply the effect to oTarget just
        supply the location of oTarget in place of lLoc.


        Usage:


        object oTarget = The object the local AOE will be stored on. It may also be the
                         object the AOE is applied to.
        string sVarName = The name under which the local AOE is stored.
        int nAreaEffectId = The AOE_* constant for the AOE you wish to use.
        location lLoc = The location to apply the effect at if you wish to apply it
                        to a location. If you wish to apply it to oTarget just supply
                        the location of oTarget here.
        int nDuration = The DURATION_TYPE_* constant for the duration to use on the effect.
        int nIsAppliedToObject = This is whether or not the effect is applied to oTarget. If
                                 FALSE then the effect will be applied at the supplied location.
        float fDuration = The duration of the effect if nDuration is other than permanent.
        string sOnEnterScript = The OnEnter script to use for the effect. If left blank the effect
                                will use the default script.
        string sHeartbeatScript = The OnHeartbeat script to use for the effect.
        string sOnExitScript = The OnExit script to use for the effect.



        void RemoveLocalAOE(object oTarget, string sVarName, int nDeleteUponRemoval = TRUE)


            This removes a local AOE stored on oTarget under the name sVarName.


            Usage:


            object oTarget = The object on which the local AOE is stored
            string sVarName = The name under which the AOE is stored
            int nDeleteUponRemoval = Whether or not to delete the local AOE when you remove the AOE



    Functions used internally:


    int CompareEffectToLocalEffect(object oTarget, effect eEffect, string sVarName)


        This is used internally to compare the local effect to the effects on oTarget
        while cycling through them.


        Usage:


        object oTarget = The object both the effect and the local effect are on.
        effect eEffect = An existing effect on oTarget.
        string sVarName = The local effect we are comparing eEffect to.


    void DeleteLocalEffect(object oTarget, string sVarName)


        This deletes a local effect stored on oTarget under the name sVarName.
        This does not remove the effect it just deletes the stored information
        about the effect.


        Usage:


        object oTarget = The object the local effect is stored on.
        string sVarName = The name of the effect to delete.


    void SetAOEDestroyable(object oAreaOfEffect, int nDestroyable = TRUE)


        This will toggle the local AOE to and from being destroyable.


        Usage:


        object oAreaOfEffect = The AOE to change the destroyable status on.
        int nDestroyable = Whether or not this effect can be destroyed.


    void CheckAndSetPermanent(object oTarget, string sVarName, int nAreaEffectId)


        This checks an object AOE against nAreaEffectID, and checks to ensure the locations
        are very close to each other to ensure it has the right AOE.


        Usage:


        object oTarget = The object to store the AOE on.
        string sVarName = The name to store the AOE under.
        int nAreaEffectID = The AOE_* constant of the AOE to store.


    int CompareTagToID(string sTag, int nID)


        This compares the tag of the AOE created against the AOE_* constants to see
        if we have a match. If you have altered your vfx_persistent.2da file to add
        new AOEs then you will need to include them in this function. The constants
        for the AOEs begin with AOE_ and can be found under the constants tab in the
        script editor. The tag of the AOE is the VFX_* line in the vfx_persistent.2da
        file.


        This function is one big if statement. The easiest way to add in your effect
        would be to add a line somewhere in the middle of the if statement and
        format it like this:


        sTag == "VFX_PER_WALLWIND" && nID == AOE_PER_WALLWIND ||


        Usage:


        string sTag = The tag of the AOE object to check against.
        int nID = The AOE_* constant to compare the tag to.


    object GetLocalAOE(object oTarget, string sVarName)


        This returns the local AOE stored on oTarget under the name sVarName.
        This is used to know which AOE to return to destroyable status and remove.


        Usage:


        object oTarget = The object the local AOE is stored on.
        string sVarName = The name under which the local AOE is stored.


    void DeleteLocalAOE(object oTarget, string sVarName)


        This deletes the stored information on oTarget about local AOE sVarName.


        Usage:


        object oTarget = The object the local AOE is stored on.
        string sVarName = The name under which the local AOE is stored.

*/
//:://////////////////////////////////////////////
//:: Created By: Yraen
//:: Created On:
//:://////////////////////////////////////////////

// This removes an effect from the target that matches the stored effect.
// object oTarget = The object that both has the effect on them and the local effect stored on them
// string sVarName = The name of the local effect to remove
// int nDeleteUponRemoval = TRUE or FALSE. If TRUE this will delete the local effect if it is found and removed
//                          from the target
void RemoveLocalEffect(object oTarget, string sVarName, int nDeleteUponRemoval = TRUE);

// Applies and stores an effect on the target for later retrieval
// object oTarget = The object the efffect will be stored on
// effect eEffect = The effect to be stored. It must be predefined.
// string sVarName = The name you wish to store this effect under.
// int nDuration = The duration that will be used when the effect is applied to the target.
// float fDuration = The duration to apply the effect for if nDuration is not permanent.
void SetLocalEffect(object oTarget, effect eEffect, string sVarName, int nDuration = DURATION_TYPE_PERMANENT, float fDuration = 0.0);

// Compares an existing effect to the stored effect. This is designed to be used in removing effects
// object oTarget = The object that has the local effects stored on it
// effect eEffect = The effect to compare to the local effect
// string sVarName = The name of the local effect to compare to
int CompareEffectToLocalEffect(object oTarget, effect eEffect, string sVarName);

// Deletes a local effect that is stored
// object oTarget = The object that has the local effect stored on it
// string sVarName = The name of the local effect to delete
void DeleteLocalEffect(object oTarget, string sVarName);

// This will toggle and area of effect object to and from destroyable
// object oAreaOfEffect = The AOE to change the destroyable status on
// int nDestroyable = Whether or not this effect can be destroyed
void SetAOEDestroyable(object oAreaOfEffect, int nDestroyable = TRUE);

// Applies and stores and Area of Effect as a local AOE on the target
// object oTarget = The object to store the AOE on
// string sVarName = The name to store the AOE under
// int nAreaEffectID = The AOE_MOB_* or AOE_PER_* constant for the AOE you want to use
// location lLoc = The location the effect will be applied at. If applied to an object just supply the location of the object
// int nDuration = The DURATION_TYPE_* of the effect.
// int nIsAppliedToObject = Whether or not to apply this effect to the object oTarget.
// float fDuration = The duration to apply the effect for if nDuration is not permanent.
// string sOnEnterScript, sOnHeartbeatScript, sOnExitScript = The scripts to use when applying the effect. Leave blank for default scripts.
void SetLocalAOE(object oTarget, string sVarName, int nAreaEffectId, location lLoc, int nDuration = DURATION_TYPE_PERMANENT, int nIsAppliedToObject = TRUE, float fDuration = 0.0, string sOnEnterScript = "", string sHeartbeatScript="", string sOnExitScript="");

// This checks an object AOE against nAreaEffectID, and checks to ensure the locations are very close to each other to ensure it has the right AOE
// object oTarget = The object to store the AOE on
// string sVarName = The name to store the AOE under
// int nAreaEffectID = The AOE_* constant of the AOE to store
void CheckAndSetPermanent(object oTarget, string sVarName, int nAreaEffectId);

// This compares the tag of the AOE created against the AOE_* constants to see if we match
// string sTag = The tag of the AOE object
// int nID = The AOE_* constant to compare to
int CompareTagToID(string sTag, int nID);

// This gets the AOE object
// object oTarget = The object the local AOE is stored on
// string sVarName = The name under which the local AOE is stored
object GetLocalAOE(object oTarget, string sVarName);

// This deletes a local AOE
// object oTarget = The object the local AOE is stored on
// string sVarName = The name under which the local AOE is stored
void DeleteLocalAOE(object oTarget, string sVarName);

// This removes a stored local AOE
// object oTarget = The object on which the local AOE is stored
// string sVarName = The name under which the AOE is stored
// int nDeleteUponRemoval = Whether or not to delete the local AOE when you remove the AOE
void RemoveLocalAOE(object oTarget, string sVarName, int nDeleteUponRemoval = TRUE);

// This checks oTarget for the local effect sVarName.
// object oTarget = The object the effect is applied to and stored on.
// string sVarName = The name under which the effect is applied.
int CheckLocalEffect(object oTarget, string sVarName);

int CheckLocalEffect(object oTarget, string sVarName)
{
    int nFlag = FALSE;
    effect eEffect = GetFirstEffect(oTarget);

    while(GetIsEffectValid(eEffect))
    {
        if(CompareEffectToLocalEffect(oTarget, eEffect, sVarName))
        {
            nFlag = TRUE;
            return nFlag;
        }
        eEffect = GetNextEffect(oTarget);
    }
    return nFlag;
}

void RemoveLocalEffect(object oTarget, string sVarName, int nDeleteUponRemoval = TRUE)
{
    effect eEffect = GetFirstEffect(oTarget);
    while(GetIsEffectValid(eEffect))
    {
        if(CompareEffectToLocalEffect(oTarget, eEffect, sVarName))
        {
            RemoveEffect(oTarget, eEffect);
            if(nDeleteUponRemoval)
            {
                DeleteLocalEffect(oTarget, sVarName);
                return;
            }
        }
        eEffect = GetNextEffect(oTarget);
    }
}

void SetLocalEffect(object oTarget, effect eEffect, string sVarName, int nDuration = DURATION_TYPE_PERMANENT, float fDuration = 0.0)
{
    int nType = GetEffectType(eEffect);
    int nSub = GetEffectSubType(eEffect);
    object oCreator = GetEffectCreator(eEffect);
    SetLocalInt(oTarget, sVarName+"Type", nType);
    SetLocalInt(oTarget, sVarName+"Sub", nSub);
    SetLocalInt(oTarget, sVarName+"Duration", nDuration);
    SetLocalObject(oTarget, sVarName+"Creator", oCreator);
    ApplyEffectToObject(nDuration, eEffect, oTarget, fDuration);
    if(nDuration != DURATION_TYPE_PERMANENT) AssignCommand(oTarget, DelayCommand(fDuration, DeleteLocalEffect(oTarget, sVarName)));
}

int CompareEffectToLocalEffect(object oTarget, effect eEffect, string sVarName)
{
    int nFlag = FALSE;
    int nType = GetEffectType(eEffect);
    int nSub = GetEffectSubType(eEffect);
    int nDuration = GetEffectDurationType(eEffect);
    object oCreator = GetEffectCreator(eEffect);
    if(GetLocalInt(oTarget, sVarName+"Type") == nType &&
    GetLocalInt(oTarget, sVarName+"Sub") == nSub &&
    GetLocalInt(oTarget, sVarName+"Duration") == nDuration &&
    GetLocalObject(oTarget, sVarName+"Creator") == oCreator)
    {
        nFlag = TRUE;
    }
    return nFlag;
}

void DeleteLocalEffect(object oTarget, string sVarName)
{
    DeleteLocalInt(oTarget, sVarName+"Type");
    DeleteLocalInt(oTarget, sVarName+"Sub");
    DeleteLocalInt(oTarget, sVarName+"Duration");
    DeleteLocalObject(oTarget, sVarName+"Creator");
}

void SetAOEDestroyable(object oAreaOfEffect, int nDestroyable = TRUE)
{
    AssignCommand(oAreaOfEffect, SetIsDestroyable(nDestroyable, FALSE, FALSE));
}

void SetLocalAOE(object oTarget, string sVarName, int nAreaEffectId, location lLoc, int nDuration = DURATION_TYPE_PERMANENT, int nIsAppliedToObject = TRUE, float fDuration = 0.0, string sOnEnterScript = "", string sHeartbeatScript="", string sOnExitScript="")
{
    effect eAOE = EffectAreaOfEffect(nAreaEffectId, sOnEnterScript, sHeartbeatScript, sOnExitScript);
    object oCreator = GetEffectCreator(eAOE);
    SetLocalObject(oTarget, sVarName+"Creator", oCreator);
    SetLocalInt(oTarget, sVarName+"Object", nIsAppliedToObject);
    SetLocalLocation(oTarget, sVarName+"Location", lLoc);
    if(nIsAppliedToObject)
    {
        ApplyEffectToObject(nDuration, eAOE, oTarget, fDuration);
    }
    else
    {
        ApplyEffectAtLocation(nDuration, eAOE, lLoc, fDuration);
    }
    CheckAndSetPermanent(oTarget, sVarName, nAreaEffectId);
}

void CheckAndSetPermanent(object oTarget, string sVarName, int nAreaEffectId)
{
    location lLoc;
    float fDistance;
    int nFound = FALSE;

    if(GetLocalInt(oTarget, sVarName+"Object"))
    {
        lLoc = GetLocation(oTarget);
    }
    else
    {
        lLoc = GetLocalLocation(oTarget, sVarName+"Location");
    }

    int nNth = 1;
    object oAOE = GetNearestObject(OBJECT_TYPE_AREA_OF_EFFECT, oTarget, nNth);

    while(GetIsObjectValid(oAOE) && !nFound)
    {
        nFound = CompareTagToID(GetTag(oAOE), nAreaEffectId);
        fDistance = GetDistanceBetweenLocations(GetLocation(oAOE), lLoc);
        if(GetObjectType(oAOE) == OBJECT_TYPE_AREA_OF_EFFECT && nFound && fDistance < 1.0 && GetAreaOfEffectCreator(oAOE) == GetLocalObject(oTarget, sVarName+"Creator"))
        {
            SetAOEDestroyable(oAOE, FALSE);
            SetLocalObject(oTarget, sVarName+"AOE", oAOE);
        }
        else
        {
            nFound = FALSE;
        }
        nNth++;
        oAOE = GetNearestObject(OBJECT_TYPE_AREA_OF_EFFECT, oTarget, nNth);
    }
}

int CompareTagToID(string sTag, int nID)
{
    int nFlag = FALSE;
    if(sTag == "VFX_PER_FOGACID" && nID == AOE_PER_FOGACID ||
       sTag == "VFX_PER_FOGFIRE" && nID == AOE_PER_FOGFIRE ||
       sTag == "VFX_PER_FOGSTINK" && nID == AOE_PER_FOGSTINK ||
       sTag == "VFX_PER_FOGKILL" && nID == AOE_PER_FOGKILL ||
       sTag == "VFX_PER_FOGMIND" && nID == AOE_PER_FOGMIND ||
       sTag == "VFX_PER_WALLFIRE" && nID == AOE_PER_WALLFIRE ||
       sTag == "VFX_PER_WALLWIND" && nID == AOE_PER_WALLWIND ||
       sTag == "VFX_PER_WALLBLADE" && nID == AOE_PER_WALLBLADE ||
       sTag == "VFX_PER_WEB" && nID == AOE_PER_WEB ||
       sTag == "VFX_PER_ENTANGLE" && nID == AOE_PER_ENTANGLE ||
       sTag == "VFX_PER_DARKNESS" && nID == AOE_PER_DARKNESS ||
       sTag == "VFX_MOB_CIRCEVIL" && nID == AOE_MOB_CIRCEVIL ||
       sTag == "VFX_MOB_CIRCGOOD" && nID == AOE_MOB_CIRCGOOD ||
       sTag == "VFX_MOB_CIRCLAW" && nID == AOE_MOB_CIRCLAW ||
       sTag == "VFX_MOB_CIRCCHAOS" && nID == AOE_MOB_CIRCCHAOS ||
       sTag == "VFX_MOB_FEAR" && nID == AOE_MOB_FEAR ||
       sTag == "VFX_MOB_BLINDING" && nID == AOE_MOB_BLINDING ||
       sTag == "VFX_MOB_UNEARTHLY" && nID == AOE_MOB_UNEARTHLY ||
       sTag == "VFX_MOB_MENACE" && nID == AOE_MOB_MENACE ||
       sTag == "VFX_MOB_UNNATURAL" && nID == AOE_MOB_UNNATURAL ||
       sTag == "VFX_MOB_STUN" && nID == AOE_MOB_STUN ||
       sTag == "VFX_MOB_PROTECTION" && nID == AOE_MOB_PROTECTION ||
       sTag == "VFX_MOB_FIRE" && nID == AOE_MOB_FIRE ||
       sTag == "VFX_MOB_FROST" && nID == AOE_MOB_FROST ||
       sTag == "VFX_MOB_ELECTRICAL" && nID == AOE_MOB_ELECTRICAL ||
       sTag == "VFX_PER_FOGGHOUL" && nID == AOE_PER_FOGGHOUL ||
       sTag == "VFX_MOB_TYRANT_FOG" && nID == AOE_MOB_TYRANT_FOG ||
       sTag == "VFX_PER_STORM" && nID == AOE_PER_STORM ||
       sTag == "VFX_PER_INVIS_SPHERE" && nID == AOE_PER_INVIS_SPHERE ||
       sTag == "VFX_MOB_SILENCE" && nID == AOE_MOB_SILENCE ||
       sTag == "VFX_PER_DELAY_BLAST_FIREBALL" && nID == AOE_PER_DELAY_BLAST_FIREBALL ||
       sTag == "VFX_PER_GREASE" && nID == AOE_PER_GREASE ||
       sTag == "VFX_PER_CREEPING_DOOM" && nID == AOE_PER_CREEPING_DOOM ||
       sTag == "VFX_PER_EVARDS_BLACK_TENTACLES" && nID == AOE_PER_EVARDS_BLACK_TENTACLES ||
       sTag == "VFX_MOB_INVISIBILITY_PURGE" && nID == AOE_MOB_INVISIBILITY_PURGE ||
       sTag == "VFX_MOB_DRAGON_FEAR" && nID == AOE_MOB_DRAGON_FEAR ||
       sTag == "VFX_CUSTOM" && nID == AOE_PER_CUSTOM_AOE ||
       sTag == "VFX_PER_GLYPH" && nID == AOE_PER_GLYPH_OF_WARDING ||
       sTag == "VFX_PER_FOGBEWILDERMENT" && nID == AOE_PER_FOG_OF_BEWILDERMENT ||
       sTag == "VFX_PER_CAMOUFLAGE" && nID == AOE_PER_VINE_MINE_CAMOUFLAGE ||
       sTag == "VFX_MOB_BATTLETIDE" && nID == AOE_MOB_TIDE_OF_BATTLE ||
       sTag == "VFX_PER_STONEHOLD" && nID == AOE_PER_STONEHOLD ||
       sTag == "VFX_PER_VFX_OVERMIND" && nID == AOE_PER_OVERMIND ||
       sTag == "VFX_MOB_HORRIFICAPPEARANCE" && nID == AOE_MOB_HORRIFICAPPEARANCE)
        {
            nFlag = TRUE;
        }
        return nFlag;
}

object GetLocalAOE(object oTarget, string sVarName)
{
    return GetLocalObject(oTarget, sVarName+"AOE");
}

void DeleteLocalAOE(object oTarget, string sVarName)
{
    DeleteLocalObject(oTarget, sVarName+"Creator");
    DeleteLocalInt(oTarget, sVarName+"Object");
    DeleteLocalLocation(oTarget, sVarName+"Location");
    DeleteLocalObject(oTarget, sVarName+"AOE");

}

void RemoveLocalAOE(object oTarget, string sVarName, int nDeleteUponRemoval = TRUE)
{
    object oAOE = GetLocalObject(oTarget, sVarName+"AOE");
    SetAOEDestroyable(oAOE, TRUE);
    DestroyObject(oAOE);
    if(nDeleteUponRemoval)
    {
        DeleteLocalAOE(oTarget, sVarName);
    }
}

//void main () {}
