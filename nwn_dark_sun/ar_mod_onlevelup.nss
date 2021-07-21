#include "nc_inc_levelup"

void main()
{
    object oLeveling = GetPCLevellingUp();
    int nHD = GetHitDice(oLeveling);
    if (nHD <= 3)
        {
            int nStr = GetAbilityScore(oLeveling, ABILITY_STRENGTH, TRUE);
            int nDex = GetAbilityScore(oLeveling, ABILITY_DEXTERITY, TRUE);
            int nCon = GetAbilityScore(oLeveling, ABILITY_CONSTITUTION, TRUE);
            int nWis = GetAbilityScore(oLeveling, ABILITY_WISDOM, TRUE);
            int nInt = GetAbilityScore(oLeveling, ABILITY_INTELLIGENCE, TRUE);
            int nCha = GetAbilityScore(oLeveling, ABILITY_CHARISMA, TRUE);

            if ((nStr <= 3) ||
                (nDex <= 3) ||
                (nCon <= 3) ||
                (nWis <= 3) ||
                (nInt <= 3) ||
                (nCha <= 3))
                {
                    FloatingTextStringOnCreature("Invalid PC Ability Scores: All ability scores must be 3 or higher.", oLeveling, TRUE);
                    DelayCommand(2.0f, FloatingTextStringOnCreature("You will have to delete this character & create another one with valid scores.", oLeveling, TRUE));
                    NC_RelevelPC(oLeveling);
                }
         }

    int nClericLevel = GetLevelByClass(CLASS_TYPE_CLERIC, oLeveling);

    if (NC_GetHasClass(CLASS_TYPE_CLERIC, oLeveling)==TRUE)
         {
            NC_SendMessage(oLeveling, NC_RESPONSE_FOUND_CLERIC);
            NC_SendMessage(oLeveling, NC_RESPONSE_CHECK_CLERIC);
            if (NC_GetIsTemplar(oLeveling))
                {
                 if (NC_TemplarCheck(oLeveling)==TRUE)
                        {
                        NC_RelevelPC(oLeveling);
                        }
                }
            else if (!NC_CheckClericElementalDomains(oLeveling) || !NC_CheckClericBasicDomains(oLeveling))
                        {
                        NC_SendMessage(oLeveling,NC_RESPONSE_RELEVEL_DOMAIN);
                        NC_RelevelPC(oLeveling);
                        }
           else if (NC_CheckClassRestrictions(oLeveling))
                        {
                        NC_RelevelPC(oLeveling);
                        }
            if (nHD > 2)
                {
                    int nMin = ((nHD * (nHD - 1)) / 2) * 1000;
                    SetXP(oLeveling, nMin);
                }
                NC_GiveClericSymbol(oLeveling);
         }

    else if (NC_CheckClassRestrictions(oLeveling))
        {
        NC_RelevelPC(oLeveling);
        }
  //Set total xp cap after 2nd level.
   else if (nHD > 2)
        {
            int nMin = ((nHD * (nHD - 1)) / 2) * 1000;
            SetXP(oLeveling, nMin);
        }
}
