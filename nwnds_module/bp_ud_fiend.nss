//::///////////////////////////////////////////////
//:: Name x2_def_userdef
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default On User Defined Event script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

const int EVENT_USER_DEFINED_PRESPAWN = 1510;
const int EVENT_USER_DEFINED_POSTSPAWN = 1511;
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == EVENT_HEARTBEAT ) //HEARTBEAT
    {

    }
    else if(nUser == EVENT_PERCEIVE) // PERCEIVE
    {

    }
    else if(nUser == EVENT_END_COMBAT_ROUND) // END OF COMBAT
    {

    }
    else if(nUser == EVENT_DIALOGUE) // ON DIALOGUE
    {

    }
    else if(nUser == EVENT_ATTACKED) // ATTACKED
    {

    }
    else if(nUser == EVENT_DAMAGED) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH  - do not use for critical code, does not fire reliably all the time
    {

    }
    else if(nUser == EVENT_DISTURBED) // DISTURBED
    {

    }
    else if (nUser == EVENT_USER_DEFINED_PRESPAWN)
    {
        // * Allow { Comments } in the name of a creature.
        string sName    =   GetName(OBJECT_SELF);
        int nLength =   GetStringLength(sName);
        int nStart  =   FindSubString(sName,"{");
        int nEnd    =   FindSubString(sName,"}");
        if((nStart != -1)&&(nEnd != -1))    {
            string sLeft    =   GetStringLeft(sName,nStart-1);
            string sRight   =   GetStringRight(sName,(nLength - nEnd)-1);
            sName    =   sLeft + sRight;
            SetName(OBJECT_SELF,sName);
        }
        if(GetResRef(OBJECT_SELF)=="bp_b_barbazu")       {
            effect eVis =   EffectVisualEffect(VFX_EYES_RED_FLAME_DWARF_MALE);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
        if(GetResRef(OBJECT_SELF)=="bp_t_dretch")       {
            if(d100()<=98)
                DecrementRemainingSpellUses(OBJECT_SELF,SPELL_STINKING_CLOUD);
        }
    }
    else if (nUser == EVENT_USER_DEFINED_POSTSPAWN)
    {

    }
}
