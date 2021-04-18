/// @description Inherits physics, tries to flee from player. 

var _hdir = 0;

if (distance_to_object(abs_kaiju) < 64)
{
	var _nearest = instance_nearest(x, y, abs_kaiju);
	_hdir = sign(x - _nearest.x);
}

hsp =  _hdir;

//Checks if going towards a position would make the NPC fall into a pit. If so stops it.
if (!instance_position(x + hsp, bbox_bottom + 1, GROUND))
{
	hsp = 0;
}

// Inherit the parent event
event_inherited();

