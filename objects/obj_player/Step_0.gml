///@description Physics, control, animation

//Physics and changing sprites.
event_inherited();

kaiju_movement(RIGHT_BUTTON - LEFT_BUTTON);

player_jump();

show_debug_message("Y: " + string(y));

angle = -1;

view_control();
