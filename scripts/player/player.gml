/// @function  player_jump()
/// @description Makes the player character jump. Returns true if a jump was performed this step.
function player_jump()
{

	//If the player character jumped this step.
	var _jumped = false;
	
	//Restores the player's jumps if they are grounded. 
	if (grounded)
	{
		jumps = global.maxJumps;
	}
	
	// Jumping controls.

	//If the player presses the jump button while grounded, they jump.
	if (A_BUTTON_PRESSED) && (grounded  || jumps > 0)
	{
	    vsp = min(-jumpHeight, vsp);
		jumps--;
		_jumped = true;
	}
    
	//If the player is holding the jump button, this offsets gravity, increasing their jump power.
	vsp -= A_BUTTON * KAIJU_GRAV_OFFSET ;

	return _jumped;
}

/// @function player_draw_gui()
/// @description draws HP, SP, and meters.
function player_draw_gui() 
{
	draw_text_color(5, 6, "HP:" + string(global.hp) + "/" + string(global.maxHP), c_black, c_black, c_black, c_black, 1);
	draw_text_color(5, 5, "HP:" + string(global.hp) + "/" + string(global.maxHP), c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
	
	
	draw_text_color(5, 26, "People Eaten:" + string(global.peopleEaten) + "/" + string(global.peopleCount), c_black, c_black, c_black, c_black, 1);
	draw_text_color(5, 25, "People Eaten:" + string(global.peopleEaten) + "/" + string(global.peopleCount), c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
}

/// @function player_eat_person(_person)
/// @description Run this on player collision with a human object. Destroys the human and increments score.
/// @param _person A reference to the human object being eaten.
function player_eat_person(_person)
{
	scale += 0.01;
	image_xscale = facing * scale;
	image_yscale = scale;
	global.peopleEaten++;

	with (_person) 
	{
		instance_destroy();
	}
	
	if (global.peopleEaten == global.peopleCount)
	{
		level_transition(room_next(room));
	}
}
