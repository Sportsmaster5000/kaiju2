/// @description Insert description here

var _increment = (RIGHT_BUTTON_RELEASED - LEFT_BUTTON_RELEASED)

if (_increment != 0) 
{
	switch (optionSelected) 
	{
	    case 0:
			 var _arraySize = array_length(global.heads);
			 global.playerHeadIndex += _increment;
			global.playerHeadIndex = (global.playerHeadIndex + _arraySize) % _arraySize;
			headSprite = global.heads[global.playerHeadIndex];
	        break;
	    case 1:
			 var _arraySize = array_length(global.bodies);
			global.playerBodyIndex += _increment;
			global.playerBodyIndex = (global.playerBodyIndex + _arraySize) % _arraySize;
			bodySprite = global.bodies[global.playerBodyIndex];
	        break;
	    case 2:
			 var _arraySize = array_length(global.colors);
			global.playerColorIndex += _increment;
			global.playerColorIndex = (global.playerColorIndex + _arraySize) % _arraySize;
			color = global.colors[global.playerColorIndex];
	        break;
	}
}

if (optionSelected == 3) && (FACE_BUTTON_RELEASED)
{
		room_goto(ROOM_START_GAME)
}

// Inherit the parent event
event_inherited();

