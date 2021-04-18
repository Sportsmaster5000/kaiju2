///@function level_initialize()
///@description Sets globals at beginning of level. Should be run in creation code for room_level# rooms.
function level_initialize()
{
	global.peopleCount = instance_number(obj_human);
}

/// @function level_transition()
/// @description Saves variables to globals, sends player to next room.
/// @param _room The room to send the player to.
function level_transition(_room)
{
	global.scale = scale;
	global.peopleEaten = 0;
	
	//The room the player will be sent to after the character creator.
	global.roomTo = room_next(room);
	
	room_goto(ROOM_CHARACTER_CREATOR);
}