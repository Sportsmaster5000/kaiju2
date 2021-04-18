/// @function globas();
/// @description Initializes global variables.
function globals() 
{
	
	//Player stats.
	global.maxHP = 5;
	global.hp = global.maxHP;
	
	global.peopleEaten = 0;
	global.peopleCount = 0;
	global.scale = 1;


	//The room the player will be sent t after visiting the character creator.
	global.roomTo = room_level1;

	//Indexes for player clothing options.
	global.playerHeadIndex = 0;
	global.playerBodyIndex = 0;
	global.playerColorIndex = 0;
	
	//Color indexes.
	global.colors[0] = c_orange;
	global.colors[1] = c_lime;
	global.colors[2] = c_red;
	global.colors[3] = c_blue;
	global.colors[4] = c_yellow;
	global.colors[5] = c_white;
	global.colors[6] = c_gray;
	global.colors[7] = c_dkgray;
	global.colors[8] = c_green;

	
	//Bodies.
	var _index = 0;
	while  (asset_get_index("spr_kaijuBody" + string(_index)) != -1)
	{
		global.bodies[_index] = asset_get_index("spr_kaijuBody" + string(_index));
		_index++;
	}
	
	//heads.
	var _index = 0;
	while  (asset_get_index("spr_kaijuHead" + string(_index)) != -1)
	{
		global.heads[_index] = asset_get_index("spr_kaijuHead" + string(_index));
		_index++;
	}
	
	//Particle system.
	global.particleSystem = part_system_create();
	
	//Background music.
	global.bgm = noone;
	
	global.maxJumps = 1;
}
