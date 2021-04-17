/// @description Takes damage.

//You can't be damaged by your own hurtbox.
//TODO: Maybe something that distinguishes between enemies and friends better?
if (other.creator == id)
{
	exit;
}

//Temp variables to be applied.
var _hDir = sign(x - other.x);
var _vDir = sign(y - other.y);
var _damage = other.damage;
var _hKnockback = other.hKnockback;
var _vKnockback = other.vKnockback;

if (flicker <= 0)
{
	hp -= _damage;
	
	hsp += _hKnockback * _hDir;
	vsp += _vKnockback * _vDir;
	
	flicker = game_get_speed(gamespeed_fps) / 2;
}

//Dies
if (hp <= 0)
{
	instance_destroy();
}