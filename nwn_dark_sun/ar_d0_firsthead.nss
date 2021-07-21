void main()
{
    // Find current Head model
    int nModel = GetLocalInt(OBJECT_SELF, "AR_CURRENT_HEAD");
    // Reset to 1
    nModel = 1;
    SetLocalInt(OBJECT_SELF, "AR_CURRENT_HEAD", nModel);
    SetCreatureBodyPart(CREATURE_PART_HEAD,nModel,OBJECT_SELF);
}

