/// @description inherits,  reinitializes doll variables.
event_inherited();

//Jumps
jumps = global.maxJumps;

//Initializes kaiju values. 
kaiju_initialize(global.maxHP, global.heads[global.playerHeadIndex], global.bodies[global.playerBodyIndex], global.colors[global.playerColorIndex]);