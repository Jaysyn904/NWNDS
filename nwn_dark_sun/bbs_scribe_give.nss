void main()
{
  object Notice = CreateItemOnObject("bbs_notice_bp", GetPCSpeaker());
  if (Notice != OBJECT_INVALID) {
    SetLocalString(Notice, "#T", GetLocalString(OBJECT_SELF, "#T"));
    SetLocalString(Notice, "#M", GetLocalString(OBJECT_SELF, "#M"));
  }
}
