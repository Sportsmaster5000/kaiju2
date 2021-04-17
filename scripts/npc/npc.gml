/// @function npc_create(_name, _Text)
/// @description initializes NPC variables.
/// @param _name the name of the NPC. Will also be put in the text box.
/// @param _text the text that will be put in the npcs speech balloon.
function npc_create(_name, _text)
{

	name = _name;
	text = _text;

	//This will contain a reference to any dialogue balloon the NPC creates.
	//If it equals noone the NPC has no created dialogue balloons.
	myBalloon = noone;
	
	//What the NPC is trying to do. Think of it as what they have instead of controller input.
	state = npcState.stand;
	
	passiveTimer = 0;
	aggroTimer = 0;
}

/// @function npc_behavior()
/// @description Changes NPC state based on the character being targetted. Returns the final state.
function npc_behavior()
{
	
	if !(instance_exists(target))
	{
		target = noone;
	}
	
	if (target == noone)
	{
		npc_idle();
	}
	else
	{
		npc_aggro(target);
	}
	
	return state;
}

/// @function npc_idle()
/// @description NPC behavior when they're not targetting anyone.
function npc_idle()
{
	if (passiveTimer > 0)
	{
		passiveTimer--;
	}
	else
	{
		facing = -facing;
		passiveTimer = PASSIVE_TIME;
		state = choose(npcState.stand, npcState.move);
	}
}

/// @function npc_aggro(_target)
/// @description NPC behavior when they're targetting an enemy. Causes them to pursue and cast spells at the target.
/// @param _target The target the npc is casting spells at.
function npc_aggro(_target)
{
	var _dist = distance_to_object(_target);
	var _angle = point_direction(x, y, _target.x, _target.y) + 90;
	
	var _hdir = sign(_target.x - x);
	var _hdist = abs(_target.x - x);
	var _vdir = sign(_target.y - y);
	var _vdist = abs(_target.y - y);
	
	if (_dist < MID_RANGE)
	{
		state = npcState.stand;		
		power_cast(_angle, powerSet[powerIndex]);
	}	
	else if (_dist < LONG_RANGE)
	{
		//Faces direction of target  and tries to move towards them.
		if (_hdir != 0)
		{
			facing = _hdir;
		}
		
		state = npcState.move;
	}
	else
	{
		npc_idle();
	}
}


function npc_state_machine(_state)
{
	switch(_state)
	{
		//The NPC isn't trying to move.
		case npcState.stand:
			hdir = 0;
		break;
	
		//The NPC is trying to move
		case npcState.move:
			//TODO: Make this check along a path instead of just 64 pixels ahead.
			if (place_meeting(x + (facing * 64), y, BLOCK))
			{
				if (grounded)
				{
					vsp = -6;
				}
			}
			doll_movement(facing);
		break;
	}
}


/// @function npc_speak(_text)
/// @description generates a speech balloon for the npc.
/// @param _text The text to be put in the balloon.
function npc_speak(_text)
{

	//Creates speech balloon object.
	var _name = name;
	
	draw_set_font(fnt_speech);
	var _balloonHeight = string_height_ext(_text, string_height(_text), TEXT_BALLOON_MAXW);
	draw_set_font(fnt_default)
	
	;
	var _balloon = instance_create_layer(x, y - 32 - _balloonHeight, layer, obj_speechBalloon);
	with (_balloon)
	{
		speechBalloon_create(_text, string_length(_text) * TEXT_BALLOON_SPEED, other, _name);
	}
	
	return _balloon;
}

/// @function speechBalloon_create(text, time, owner, name)
/// @description Creates a specch balloon object.
/// @param _text The text that will be displayed.
/// @param _time The amount of time for which the balloon will exist.
/// @param _owner The instance that created this object.
/// @param _name The name of the npc that created this balloon.
function speechBalloon_create(_text, _maxTime, _owner, _name) 
{

	text = _text;
	maxTime = _maxTime;
	time = maxTime;
	owner = _owner;
	name = _name;
}
