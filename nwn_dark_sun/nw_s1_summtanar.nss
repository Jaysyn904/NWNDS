//::///////////////////////////////////////////////
//:: Summon Tanarri
//:: NW_S0_SummSlaad
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Modified for the few Demons on Athas.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Aug 14, 2001
//:://////////////////////////////////////////////
//:: VFX Pass By: Preston W, On: June 25, 2001

#include "bp_t_randloc"

int DEBUG   =   FALSE;

void main()
{
    //Declare major variables
    string sTag = GetTag(OBJECT_SELF);
    int nNum;
    string sRes;
    effect eSummon;


    if(sTag=="NW_S_SUCCUBUS")
        {
            if(d100()<=30)
                {
                    nNum    =   1;
                    sRes    =   "DS_VROCK001";
                }
        }

    if( (sTag=="DS_BABAU_001") ||
        (sTag=="DS_BABAU_002") ||
        (sTag=="DS_BABAU_003") )
            {
                if(d100()<=40)
                    {
                        nNum    =   1;
                        sRes    =   "DS_BABAU_001";
                    }
            }


    if(sTag=="DS_DRETCH001")
        {
            if(d100()<=35)
                {
                    nNum    =   1;
                    sRes    =   "DS_DRETCH001";
                }
        }

    if( (sTag=="NW_DMVROCK") ||
        (sTag=="DS_VROCK001") )
            {
                switch(Random(2))
                    {
                        case 0:
                        nNum    =   d10(2);
                        sRes    =   "DS_DRETCH001";
                        break;

                        case 1:
                        if(d100()<=35)
                            {
                                nNum    =   1;
                                sRes    =   "DS_VROCK001";
                            }
                        break;
                    }


            }


    if(DEBUG)
        {
            SendMessageToAllDMs(sTag + " >> " + IntToString(nNum) + " >> " + sRes);
        }

    object oCreature;
    if(sRes!="")
        {
            int i;
            //ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_HORRID_WILTING),GetSpellTargetLocation());
            for (i = 0; i < nNum; i++)
            {
                effect eVis =   EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD);
                oCreature   =   CreateObject(OBJECT_TYPE_CREATURE,sRes,RndLoc(GetSpellTargetLocation(),5,DIMENSION_HEMISPHERE),FALSE);
                ChangeFaction(oCreature,OBJECT_SELF);
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis,GetLocation(oCreature));
                //eSummon = EffectSummonCreature(sRes,VFX_FNF_SUMMON_MONSTER_3);
                //ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eSummon, RndLoc(GetSpellTargetLocation(),5,DIMENSION_HEMISPHERE), HoursToSeconds(24));
            }
        }
}


//Declare major variables
    //effect eSummon = EffectSummonCreature("NW_S_SUCCUBUS",VFX_FNF_SUMMON_MONSTER_3);
    //effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3);
    //Apply the VFX impact and summon effect
    //ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eVis, GetSpellTargetLocation());
    //ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eSummon, GetSpellTargetLocation(), HoursToSeconds(24));
