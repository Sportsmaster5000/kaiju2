/// @description Inherits, initialize variables for specific npc.
event_inherited();

npc_create("Wizard", "If you find all 100 stars I'll grant you a wish.");

//Randomly generates some of them.
var _face = global.faces[15];
var _hair = global.hairs[21];
var _undershirt =  global.undershirts[1];
var _overshirt =  global.overshirts[7];
var _sleeves = global.sleeves[1];
var _pants = global.pants[0];

var _skinColor =  global.npcSkinColorsTerra[3];
var _hairColor =   make_color_rgb(0, 0, 255);
var _undershirtColor =   make_color_rgb(0, 0, 255);
var _overshirtColor =   make_color_rgb(0, 0, 255);
var _sleevesColor =  make_color_rgb(0, 0, 255);;
var _pantsColor =  c_blue;

doll_create(1000, 1000, _face, _hair, _undershirt, _overshirt, _sleeves, _pants, _skinColor, _hairColor, _undershirtColor, _overshirtColor, _sleevesColor, _pantsColor );
