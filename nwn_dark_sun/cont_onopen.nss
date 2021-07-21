#include "treasuresys_inc"

void main()
{
Handle_Open( OBJECT_SELF );
ExecuteScript( sTreasureGenScript, OBJECT_SELF );
SetLocalInt( OBJECT_SELF, "NW_DO_ONCE", 1 );
}
