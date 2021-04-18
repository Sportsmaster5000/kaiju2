/// @function power_struct(_cost, _caster, _delay, _name, _alt)
/// @description Constructor for power structs. Has variables needed to cast powers.
/// @param _cost How much the power costs.
/// @param _caster The caster object used to cast the power.
/// @param _delay The number of frames to wait before casting the power.
/// @param _alt struct representing the alt form of this power. If it does not have an alt, this is noone.
function power_struct(_cost, _caster, _delay, _name, _alt)
{
	var _myStruct = 
	{
		cost : _cost,
		caster : _caster,
		delay : _delay,
		name : _name,
		alt : _alt
	}
	
	return _myStruct;
}

/// @function power_cast(_angle, _struct)
/// @description creates a caster for the given power, linking it to the instance calling this function.
/// @param _angle the angle the power will be cast towards.
/// @param _struct a power struct as defined above.
function power_cast(_angle, _struct)
{
	
	//If the caster in the struct is empty just exits the event.
	if (_struct.caster == noone)
	{
		return noone;
	}
	
	var _cost = _struct.cost;
	
	//Checks if the caster has enough SP to cast. Otherwise returns.
	if (pp >= _cost) && (delayTimer <= 0)
	{
		delayTimer = _struct.delay;
	}
	else
	{
		return noone;
	}


	//ID of the instance casting the power
	var _id = id;

	//Creates the caster, sets some of its variables.
	//Makes sure the caster is created at the right positon.
	var _caster = instance_create_depth(x + dsin(_angle) * 10, y + dcos(_angle) * 10, depth, _struct.caster);
	


	with (_caster)
	{
		cost = _cost;
		angle = _angle;
		creator = _id;
	}


	return _caster;
}