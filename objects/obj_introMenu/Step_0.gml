/// @description Insert description here
timer--;

if (timer < 0) || (text == "")
{
		global.introText = "";
		room_goto(global.roomTo);
}