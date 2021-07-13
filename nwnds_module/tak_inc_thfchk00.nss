//=============================================================
// Container Thief Check
// by William Amrull (aka Tak), Sep 4, 2005
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Purpose: Makes the owner/guard(s) of a container attack
//  anyone who messes with said container.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Use: Put this script in the OnOpen event for the container
//  and add a variable to the container. The variable you add
//  should be called "owner" and contain the tag of the owner.
//  For multiple guards the variables should be like so:
//   string owner1 Tag
//   string owner2 Tag
//   string owner3 Tag
//   etc..
//  Note: There should be no owner tag variable that does not
//  include a number at the end when using multiple guards.
//=============================================================
#include "x0_i0_position"

void tak_container_agg_check(int nCondition, object oThief, object oOwner);

void tak_container_thief_check(object oThief, int nCondition)
{
    string sOwner = GetLocalString(OBJECT_SELF, "owner");
    object oOwner = GetObjectByTag(sOwner);
    if (oOwner != OBJECT_INVALID)
        tak_container_agg_check(nCondition, oThief, oOwner);

    sOwner = GetLocalString(OBJECT_SELF, "owner");
    oOwner = GetObjectByTag(sOwner);
    if (oOwner != OBJECT_INVALID) {
        int cnt;
        for (cnt = 1; sOwner != ""; cnt++) {
            sOwner = GetLocalString(OBJECT_SELF, "owner" + IntToString(cnt));
            oOwner = GetObjectByTag(sOwner);
            tak_container_agg_check(nCondition, oThief, oOwner);
        }
    }
}

void tak_container_agg_check(int nCondition, object oThief, object oOwner) {
    int nAgg = GetLocalInt(OBJECT_SELF,"agg");
    if (nAgg < 1)
        nAgg == 0;
    if (!(GetObjectSeen(oThief, oOwner))) {
        if ((nCondition == 5) ||
        (nCondition == 7) ||
        (nCondition == 4))
            TurnToFaceObject(oThief, oOwner);
    }
    else {
        switch (nCondition) {
            case 1:
                if (GetLocalInt(OBJECT_SELF,"ttc_unlock"))
                    nAgg+=GetLocalInt(OBJECT_SELF,"ttc_unlock");
                else
                    nAgg+=3;
                break; //unlocked
            case 2:
                if (GetLocalInt(OBJECT_SELF,"ttc_disarm"))
                    nAgg+=GetLocalInt(OBJECT_SELF,"ttc_disarm");
                else
                    nAgg+=3;
                break; //disarmed
            case 3:
                if (GetLocalInt(OBJECT_SELF,"ttc_taken"))
                    nAgg+=GetLocalInt(OBJECT_SELF,"ttc_taken");
                else
                    nAgg+=5;
                break; //item taken
            case 4:
                if (GetLocalInt(OBJECT_SELF,"ttc_trap"))
                    nAgg+=GetLocalInt(OBJECT_SELF,"ttc_trap");
                else
                    nAgg+=3;
                break; //trap triggered
            case 5:
                if (GetLocalInt(OBJECT_SELF,"ttc_damage"))
                    nAgg+=GetLocalInt(OBJECT_SELF,"ttc_damage");
                else
                    nAgg+=2;
                break; //damaged
            case 6:
                if (GetLocalInt(OBJECT_SELF,"ttc_open"))
                    nAgg+=GetLocalInt(OBJECT_SELF,"ttc_open");
                else
                    nAgg+=5;
                break; //opened
            case 7:
                if (GetLocalInt(OBJECT_SELF,"ttc_destroy"))
                    nAgg+=GetLocalInt(OBJECT_SELF,"ttc_destroy");
                else
                    nAgg+=5;
                break; //destroyed
            case 8:
                if (GetLocalInt(OBJECT_SELF,"ttc_attack"))
                    nAgg+=GetLocalInt(OBJECT_SELF,"ttc_attack");
                else
                    nAgg+=1;
                break; //pysically attacked
        }
    }
    SetLocalInt(OBJECT_SELF, "agg", nAgg);
    if ((nAgg >= 5) && (GetObjectSeen(oThief, oOwner))) { //Now I'm Pissed.
        AssignCommand(oOwner, ActionAttack(oThief));
    }
}
