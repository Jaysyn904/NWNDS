void main()
{
    //Move dealer to chair object with the tag 'CHAIR_NPC_BLACKJACK' and sit in it.
    AssignCommand(OBJECT_SELF,ActionSit(GetObjectByTag("CHAIR_NPC_BLACKJACK")));
}
