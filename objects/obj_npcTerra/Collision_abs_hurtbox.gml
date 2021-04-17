/// @description Sets the target as the hurtbox's creator.
event_inherited();

if (other.creator != id)
{
	target = other.creator;
}