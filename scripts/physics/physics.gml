/// @function phys_create(_gravity, _friction, _hsp, _vsp, _collision)
/// @description Initializes physics variables.
/// @param _grav How many pixels the object is pulled down by each step.
/// @param _frict How much horizontal speed is reduced each step while it is non-zero.
/// @param _hsp Horizontal speed.
/// @param _vsp vertical speed
/// @param _collision Whether the object stops when it collides with blocks.
function phys_create(_grav, _frict, _hsp, _vsp, _collision) 
{

	//Initializes instance variables.
	grav = _grav;
	frict = _frict;
	hsp = _hsp;
	vsp = _vsp;
	collision = _collision;
	
	//The object is considered grounded if they are directly above a block.
	grounded = place_meeting(x, y + 1, GROUND)


}

/// @function phys_force_add(_force, _accel, _max)
/// @description Accelerates a given force value up to a maximum number. Returns the new value.
/// @param _force the base value to be added to. Usually hsp or vsp.
/// @param _accel the number to be added to the _force variable.
/// @param _max the maximum value that _force can be set to.
function phys_force_add(_force, _accel, _max)
{
	var _sign = sign(_accel);
	
	_force += _accel;
	_force = min(abs(_force), _max);
	
	return _force * _sign;
}

/// @function phys_floor_collison(vsp)
/// @description Stops the player if they would touch a block vertically
/// @param _vsp object's vertical speed.
function phys_floor_collision(_vsp) 
{

	//Checks every pixel in the player's path for collision.
	for (var _i = 0; (abs(_i) < abs(_vsp)) || (place_meeting(x, y + _i, BLOCK)); _i += sign(_vsp))
	{

	    //If there is a collision, it will move the player as close to the object as possible and then stop.
	    //This is the check for collision with blocks.
	    if (place_meeting(x, y + _i, BLOCK))
	    {
	        y += _i - sign(_vsp);
	        return 0;
	    }
    
	    //This is the collision for one-way platforms.
	    if (sign(_vsp) >= 0)
	    {	
	        if (bottom(bbox_bottom + (_i + 1), obj_oneWay))
	        {
	                y += _i;
	                return 0;
	        }
		
	    }
	}

	return _vsp;
}


/// @function phys_wall_collision(hsp)
/// @description If the object would end up inside the block object, it instead just moves them as close as possible. If they are above a given threshold for speed, they bounce off of it.
/// @param hsp object's horizontal speed.
function phys_wall_collision(_hsp) 
{

	//Checks every pixel in the object's path for collision.
	for (var _i = 0; (abs(_i) < abs(_hsp)) || (place_meeting(x + _i, y, BLOCK)); _i += sign(_hsp))
	{
	    //If there is a collision, it will move the player as close to the object as possible and then stop. Bas a tiny upwards margin for now.4
	    if (place_meeting(x + _i, y, BLOCK))
	    {
	        x += _i - sign(_hsp);
	        return 0;
	    }
	}
	
	return _hsp;
}
/// @function phys_wall_collision_bounce(hsp)
/// @description Horizontal collision. Bounces when it would hit a wall.
/// @param hsp object's horizontal speed.
function phys_wall_collision_bounce(_hsp) 
{

	//Checks every pixel in the object's path for collision.
	for (var _i = 0; (abs(_i) < abs(_hsp)) || (place_meeting(x + _i, y, BLOCK)); _i += sign(_hsp))
	{
	    //If there is a collision, it will bounce off the object.
	    if (place_meeting(x + _i, y, BLOCK))
	    {
	        x += _i - sign(_hsp);
	        return -_hsp;
	    }
	}
	
	return _hsp;
}


/// @function phys_friction(hsp, friction, grounded)
/// @description Applies friction to a horizontal speed variable. Returns new horizontal speed.
/// @param hsp Horizontal speed.
/// @param friction Friction variable.
/// @param grounded Whether the object is on the ground or not.
function phys_friction(_hsp, _frict, _grounded) 
{

	//Friction will reduce horizontal speed. This is reduced while in the air.
	  _hsp -= (_frict * sign(_hsp)) * (1 / (power(10, !_grounded)));
	  
	/*
	if (_grounded)
	{
	    _hsp -= _frict * sign(_hsp);
	}
	*/

	//If hsp is lower than the friction value, it just sets hsp to 0.
	if (abs(_hsp) < _frict)
	{
	    return 0;
	}

	//Returns new hsp
	return _hsp;


}

/// @function phys_gravity(_vsp, _grav, _terminalVelocity)
/// @description applies gravity. Returns the new VSP value.
/// @param _vsp the vsp value gravity will be applied to.
/// @param _grav the value that will be applied to vsp.
/// @param _terminalVelocity The maximum gravity that can be applied.
function phys_gravity(_vsp, _grav, _terminalVelocity) 
{

	_vsp = min(_vsp + _grav, _terminalVelocity) 

	return _vsp;


}

/// @function bottom(ycoord, object)
/// @description Checks for an object directly under the calling object (in a line from bbox left to bbox right). returns true if the calling object is there. Otherwise returns false.
/// @param _ycoord Y coordinate of the object.
/// @param _object Block object to check for.
function bottom(_ycoord, _object) 
{

	//Checks every pixel directly under the object's bounding box.
	for (var i = bbox_left; i <= bbox_right; i++)
	{
	    if (instance_position(i, _ycoord, _object))
	    {
	        return true;
	    }
	}

	return false;
}


/// @function phys_floor_collison_bounce(vsp)
/// @description Makes the object bounce if it would touch a block vertically
/// @param vsp object's vertical speed.
function phys_floor_collision_bounce(_vsp) 
{

	//Checks every pixel in the player's path for collision.
	for (var _i = 0; (abs(_i) < abs(_vsp)) || (place_meeting(x, y + _i, BLOCK)); _i += sign(_vsp))
	{

	    //If there is a collision, it will move the player as close to the object as possible and then stop.
	    //This is the check for collision with blocks.
	    if (place_meeting(x, y + _i, BLOCK))
	    {
	        y += _i - sign(_vsp);
	        return -_vsp;
	    }
    
	    //This is the collision for one-way platforms.
	    if (sign(_vsp) >= 0)
	    {	
	        if (bottom(bbox_bottom + (_i + 1), obj_oneWay))
	        {
	                y += _i;
	                return -_vsp;
	        }	
	    }
		
	}
	
	return _vsp;
}



/// @function phys_step()
/// @description Place in the step event to activate physics.
function phys_step() 
{

	//grav increases the object's downwards speed by raising vsp. Does not do so past the terminal velocity.
	vsp = phys_gravity(vsp, grav, TERMINAL_VELOCITY);

	//Friction will reduce horizontal speed. This is reduced while in the air.
	hsp = phys_friction(hsp, frict, grounded);

	//Collision with walls. The object's position is changed after each collision function.
	if (collision)
	{
	    vsp = phys_floor_collision(vsp);
	    hsp = phys_wall_collision(hsp);
	}

	y += vsp;
	x += hsp;

	//Checks if the object is on the ground.
	grounded = (place_meeting(x, y + 1, BLOCK)) || (bottom(bbox_bottom + 1, obj_oneWay));
}