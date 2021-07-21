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

#include "tak_inc_thfchk00"

void main()
{
    object oThief;
    if (GetLastOpenedBy() == OBJECT_INVALID)
        return;
    oThief = GetLastOpenedBy();
    tak_container_thief_check(oThief, 6);
}
