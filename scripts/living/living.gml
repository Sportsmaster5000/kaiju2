///Scripts for living things.

/// @function living_create(_maxHP, _hp)
/// @description initializes variables for living things.
/// @param _maxHP maximum HP the object can have.
/// @param _hp current hp the object has/
function living_create(_maxHP, _hp)
{
	maxHP = _maxHP;
	hp = _hp;
	
	//Invulnerability counter.
	flicker = 0;
}