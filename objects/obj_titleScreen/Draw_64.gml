/// @description Draws title screen.
draw_set_halign(fa_center);

draw_text_transformed(window_get_width()/2, window_get_height() / 4, "LOST N FOUND", 4, 4, 0);

if (time % 10 != 0)
{
	draw_text(window_get_width() / 2, window_get_height() * 3 / 4, "Press Any Key to Start!");
}

draw_set_halign(fa_left);