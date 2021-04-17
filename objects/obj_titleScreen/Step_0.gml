/// @description Checks for keyboard input, increments timer.\

if (ANY_BUTTON_RELEASED) && (time > game_get_speed(gamespeed_fps) )
{
	room_goto(ROOM_CHARACTER_CREATOR);
}

time++;