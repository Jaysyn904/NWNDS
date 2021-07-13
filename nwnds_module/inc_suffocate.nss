void SuffocateCheck(object oTarget)
{
    int nRounds = GetLocalInt(oTarget,"SuffocateRounds");
    int nCon = GetAbilityScore(oTarget,ABILITY_CONSTITUTION);

    int nDif = nCon * 2 - nRounds;

    if ( nDif < 0 )
    {
        int nDC = 9 - nDif;
        SendMessageToPC(oTarget,"You are suffocating!");
        int nRoll = d20() + GetAbilityModifier(ABILITY_CONSTITUTION,oTarget);
        if ( nRoll >= nDC )
        {
            SendMessageToPC(oTarget,"Constitution check: "+ IntToString(nRoll)+ " vs dc " + IntToString(nDC) + " :Success!");
        }
        else
        {
            SendMessageToPC(oTarget,"Constitution check: "+ IntToString(nRoll)+ " vs dc " + IntToString(nDC) + " :Failure!");
            int nHitPoints = GetCurrentHitPoints(oTarget);
            effect eVis = EffectVisualEffect(VFX_IMP_DEATH);
            effect eHitDamage = EffectDamage(nHitPoints, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_PLUS_TWENTY);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHitDamage, oTarget);
        }
    }
    else
    {
        SendMessageToPC(oTarget,"You can't breath! You have " + IntToString(nDif) +
                " rounds of breath left!");
    }
}

void Suffocate(object oTarget)
{
    int nRace = GetRacialType(oTarget);
    if ((  nRace == RACIAL_TYPE_CONSTRUCT ) || ( nRace == RACIAL_TYPE_ELEMENTAL )
        || ( nRace == RACIAL_TYPE_UNDEAD ) || ( nRace == RACIAL_TYPE_OOZE ) )
        return;
    effect eVis = EffectVisualEffect(VFX_IMP_SONIC);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);

    int nRounds = GetLocalInt(oTarget,"SuffocateRounds");
    nRounds++;
    SetLocalInt(oTarget,"SuffocateRounds",nRounds);
    SuffocateCheck(oTarget);
}

void GiveBreath(object oTarget)
{
    SetLocalInt(oTarget,"SuffocateRounds",0);
}

//void main () {}
