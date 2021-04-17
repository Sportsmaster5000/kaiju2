/// @function game_initialize()
/// @desctription Initialize the game.
function game_initialize() 
{

	//Randomize.
	randomize();

	//Set gamespeeed to 60fps
	game_set_speed(60, gamespeed_fps);
	
	//draw_set_font(fnt_default);
	
	//Initialize globals.
	globals();
	
	//Go to first room.w
	room_goto(ROOM_TITLE_SCREEN);
	
	//set cursor.
	/*
	window_set_cursor(cr_none);
	cursor_sprite = CURSOR;
	*/
}
