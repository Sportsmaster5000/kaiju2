/// @description Destroys star, increments star counter.

global.stars++;

//Adds the id of the collected star to the list.
with (other)
{
	ds_list_add(global.starsCollected, id);
}

instance_destroy(other, true);