/// @description Sends the building flying upon collision with a kaiju.

if (hsp == 0)
{
	var _hdir = sign(x - other.x);
	
	hsp = 5 * _hdir;
	vsp = -5;
	angleSpeed = 1;
}