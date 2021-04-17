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

/*
	var _powerName = powerSet[powerIndex].name;
	draw_set_halign(fa_left);
	draw_text(5, 5, "HP: " );
	draw_text(5, 25, "Stars: " + string(global.stars) + " / " + string(global.maxStars));

	meter_draw(32, 5, 105, 20, c_black, c_red, c_yellow, c_gray, 1, hp, global.maxHP);
	//meter_draw(32, 25, 105, 40, c_black, c_blue, c_yellow, c_gray, 1, pp, global.maxPP);
	
	draw_text(5, 45, "Item: " + _powerName);
	*/
}

