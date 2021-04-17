/// @description Checks star count to give the player advice.

if (global.stars >= 100)
{
	room_goto(room_outroScreen);
}

// Inherit the parent event
event_inherited();

