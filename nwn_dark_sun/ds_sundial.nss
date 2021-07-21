void main()
{
int nHour = GetTimeHour();
int nMin = GetTimeMinute();
int nSec = GetTimeSecond();
string sTime = "The time is " + IntToString(nHour) + ":" + IntToString(nMin) + ":" + IntToString(nSec) + " on day " + IntToString(GetCalendarDay()) + " of the month " + IntToString(GetCalendarMonth()) + " of the year " + IntToString(GetCalendarYear());
ActionSpeakString(sTime);
}
