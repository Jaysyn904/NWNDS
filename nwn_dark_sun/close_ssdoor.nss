
// Put this script OnOpen.

  void main()
{


    DelayCommand(10.0, ActionCloseDoor(OBJECT_SELF));   ;
    DelayCommand(1.0, SetLocked(OBJECT_SELF, TRUE));

}

