// Set this to the max #Of Heads.
const int AR_MAX_HEAD_MODELS = 181;

void main()
{
    // Find current Head model and increment by 1
    int nModel = GetLocalInt(OBJECT_SELF, "AR_CURRENT_HEAD");
    nModel = nModel + 1;
    // Reset to 1 if past max
    if(nModel > AR_MAX_HEAD_MODELS) nModel = 1;
    SetLocalInt(OBJECT_SELF, "AR_CURRENT_HEAD", nModel);
    SetCreatureBodyPart(CREATURE_PART_HEAD,nModel,OBJECT_SELF);

}
