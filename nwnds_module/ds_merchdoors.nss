void main()
    {
        if (GetIsNight())
            {
                ActionCloseDoor(OBJECT_SELF);
                ActionSpeakString("This door is locked. A sign on the door says, 'Closed for the night.'");
                return;
            }

        else
        DelayCommand(20.0,ActionCloseDoor(OBJECT_SELF));
        return;
    }
