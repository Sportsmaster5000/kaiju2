/// @description Initializes menu options.
var _array;
_array[0] = "< HEAD >"
_array[1] = "< BODY >"
_array[2] = "< COLOR >"
_array[3] = "FINISHED"

//Initializes kaiju variables so it can display a preview of the player's kaiju.
kaiju_initialize(1, global.heads[global.playerHeadIndex], global.bodies[global.playerBodyIndex], global.colors[global.playerColorIndex]);

menu_create(_array);