/// @function kaiju_initialize(_maxHP, _head, _body, _color)
/// @description initializes variables for a doll object.
/// @param _maxHP maximum hp for this monster
/// @param _headSprite The head sprite for this monster.
/// @param _bodySprite The body sprite for this monster.
function kaiju_initialize(_maxHP, _headSprite, _bodySprite, _color)
{
	maxHP = _maxHP;
	hp = maxHP;
	headSprite = _headSprite;
	bodySprite = _bodySprite;
	color = _color;
	
	//The angle the spell is being cast at. If no spell is being cast it is at -1.
	angle = -1;

	//How fast the player can accelerate. Is added to hsp, to a limit of maxSpeed.
	accel = KAIJU_ACCEL;

	//The highest the player can accelerate themselves to.
	maxSpeed = KAIJU_MAX_SPEED;

	//The force appled when the player character jumps. Subtracted from vsp.
	jumpHeight = KAIJU_JUMP_HEIGHT;

	//Which direction the doll is attempting to move.
	hdir = 0;
	
	//How long the character stays flickering.
	flicker = FLICKER;
	
	//Which direction the doll is facing.
	facing = sign(image_xscale);

	image_speed = KAIJU_ANIM_SPEED;

	///Timers
	
	//Amount of time needed to cast a spell again.
	delayTimer = 0;
	
	//Instance being targetted. For players this is set when they're clicked on. For NPCs it's whoever they want to attack.
	target = noone;
	
	//Coordinates of the target.This value is just for players. npcs should use target.x and target.y
	targetX  = 0;
	targetY = 0;
	
	//Whether the object is on the ground or not.
	grounded = place_meeting(x, bbox_bottom + 1, GROUND);
}


/// @function kaiju_movement(_hdir) 
/// @description Makes the doll move. Returns true if the player character is being ordered to move.
/// @param _hdir Horizontal direction the player is trying to move.
function kaiju_movement(_hdir) 
{
	// Left and right controls.

	//Gets controller input for horizontal direction.
	hdir = _hdir


	//Sets the direction the player is facing. This will be used when animating the sprite.
	if (hdir != 0)
	{
		//Modifies the hsp variable.
		hsp = phys_force_add(hsp, hdir * accel, maxSpeed);
		
		if (grounded)
		{
			facing = hdir;
		}
	}

	return abs(hdir);
}



/// @function kaiju_animate()
/// @description Changes the doll's animstate.
function kaiju_animate()
{

	//Makes sure the sprite is facing the right way.
	image_xscale = facing * scale;

	//Changes parts of the sprite that need to be changed by the animation.
	if (hdir == 0) //Standing still.
	{
		image_index = 0;
		image_speed = 0;
	}
	else //Running
	{
		image_speed = 1;
	}

	if !(grounded)
	{
			image_index = 3;
			image_speed = 0;
	}

	if (angle != -1)
	{
		//Todo: Rotate head sprite??
	}
}



/// @function kaiju_draw()
/// @description draws the kaiju object.
function kaiju_draw() 
{
	draw_sprite_ext(headSprite, image_index, x, y, image_xscale, image_yscale, image_angle, color, image_alpha);
	draw_sprite_ext(bodySprite, image_index, x, y, image_xscale, image_yscale, image_angle, color, image_alpha);
}


/// @function kaiju_draw_ext(_x, _y, _scale, _angle)
/// @description draws the kaiju object with extra variables inputted.'
/// @param _x x coordinate the kaiju is drawn at
/// @param _y y coordinate the kaiju is drawn at
function kaiju_draw_ext(_x, _y, _scale, _angle) 
{
	draw_sprite_ext(headSprite, image_index, _x, _y, _scale, _scale, _angle, color, image_alpha);
	draw_sprite_ext(bodySprite, image_index, _x, _y, _scale, _scale, _angle, color, image_alpha);
}


/// @function kaiju_timers()
/// @description decrements timers.
function kaiju_timers()
{
	
	//Delay before a spell can be cast again.

	//Firing delay timer.
	if (delayTimer > 0)
	{
		delayTimer--;
	}

}
