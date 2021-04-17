/// @function view_control()
/// @description controls the camera as it follows the player.
function view_control() 
{
	
	//Follows calling instance with camera.
	camera_set_view_pos(view_camera[VIEW], x - 200, y - 200);

	//Moves parallax.
	if (layer_exists("Parallax"))
	{
		layer_x("Parallax", x/2);
	}
	
	//Moves skybox
	if (layer_exists("Skybox"))
	{
		global.time += 0.05;
		layer_y("Skybox", y + global.time);
	}
	
}
