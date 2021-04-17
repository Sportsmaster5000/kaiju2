/// @function menu_create(array)
/// @description initializes menu variables.
/// @param array an array of strings to use as menu options.
function menu_create(argument0) 
{
	options = argument0;
	optionSelected = 0;
}

/// @function menu_draw(x, y, array, color1, color2, height, select)
/// @description Draws a menu from the given array.
/// @param x x coordinate to draw the menu at.
/// @param y y coordinate to draw the menu at.
/// @param array array to draw.
/// @param color1 color for unselected items.
/// @param color2 color for the selected item.
/// @param height height of the menu.
/// @param select selected item in the array.
function menu_draw(argument0, argument1, argument2, argument3, argument4, argument5, argument6) 
{
	
	var _x = argument0;         
	var _y = argument1;         
	var _array = argument2;     
	var _color1 = argument3;    
	var _color2 = argument4;    
	var _height = argument5;    
	var _select = argument6;  

	draw_set_colour(_color1);

	for (var _i = 0; _i < array_length_1d(_array); _i++)
	{
	    if (_i != _select)
	    {
	        draw_set_colour(_color2);
	    }
    
	    draw_text(_x, _y + ((_height * _i)/array_length_1d(_array)), string(_array[_i]));
    
	    draw_set_colour(_color1);
	}


}
