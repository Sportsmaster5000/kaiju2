///Macros and enums

	//player constants
#macro FLICKER (game_get_speed(gamespeed_fps) * 2)


//Kaiju constants.
#macro KAIJU_ANIM_SPEED 0.1
#macro KAIJU_ACCEL 2
#macro KAIJU_MAX_SPEED 6
#macro KAIJU_JUMP_HEIGHT 5
#macro KAIJU_GRAV_OFFSET  grav/2

	//numeric game values.
#macro NPC_FLICKER (game_get_speed(gamespeed_fps) * 2)
#macro MELEE_RANGE 10
#macro CLOSE_RANGE 50
#macro MID_RANGE 150
#macro LONG_RANGE 200
#macro TEXT_SPEED 10
#macro TEXT_BALLOON_SPEED 5
#macro TEXT_BALLOON_MAXW 200


	//static resource pointers
#macro GROUND abs_ground //parent object for block and oneway platforms.
#macro BLOCK obj_block //Wall objects.
#macro PLAYER obj_player //Pointer to player object. There should only be one on the map at once.
#macro ROOM_TITLE_SCREEN room_characterCreationMenu //Title screen room.
#macro ROOM_CHARACTER_CREATOR noone
#macro ROOM_INTRO_SCREEN noone //Title screen room.
#macro ROOM_START_GAME room_level1//Points to starting room.
#macro CURSOR noone //Points to cursor sprite.

	//views
#macro VIEW 0 //The index of the view that will be used in the game.

//Layers
#macro LAYER_PARALLAX "Parallax"
#macro LAYER_SKYBOX "Skybox"


	//Physics values.
#macro TERMINAL_VELOCITY 6 //The highest an object's vertical speed can be.
#macro GRAVITY_OFFSET (grav / 2) //This value is added to the player's gravity while they're holding the jump button. This allows jump cancelling.


	//Controls.
#macro ANY_BUTTON (keyboard_check(vk_anykey))
#macro RIGHT_BUTTON (keyboard_check(vk_right) || keyboard_check(ord("D")) || gamepad_button_check(0, gp_padr))
#macro DOWN_BUTTON (keyboard_check(vk_down) || keyboard_check(ord("S")) || gamepad_button_check(0, gp_padd))
#macro LEFT_BUTTON (keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_button_check(0, gp_padl))
#macro UP_BUTTON (keyboard_check(vk_up) || keyboard_check(ord("W")) || gamepad_button_check(0, gp_padu))
#macro A_BUTTON (keyboard_check(vk_space) || gamepad_button_check(0, gp_face1))
#macro B_BUTTON (keyboard_check(ord("Q")) || gamepad_button_check(0, gp_face2))
#macro X_BUTTON (keyboard_check(ord("E")) || gamepad_button_check(0, gp_face3))
#macro Y_BUTTON (keyboard_check(ord("C")) || gamepad_button_check(0, gp_face4))
#macro FACE_BUTTON (A_BUTTON || B_BUTTON || X_BUTTON || Y_BUTTON) 
#macro START_BUTTON ((gamepad_button_check(0, gp_start)) || (keyboard_check(vk_enter)))
#macro MOUSE_LEFT_BUTTON mouse_check_button(mb_left)
#macro MOUSE_RIGHT_BUTTON mouse_check_button(mb_right)

#macro ANY_BUTTON_PRESSED (keyboard_check_pressed(vk_anykey))
#macro RIGHT_BUTTON_PRESSED (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")) || gamepad_button_check_pressed(0, gp_padr))
#macro DOWN_BUTTON_PRESSED (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(0, gp_padd))
#macro LEFT_BUTTON_PRESSED (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")) || gamepad_button_check_pressed(0, gp_padl))
#macro UP_BUTTON_PRESSED (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(0, gp_padu))
#macro A_BUTTON_PRESSED (keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1))
#macro B_BUTTON_PRESSED (keyboard_check_pressed(ord("Q")) || gamepad_button_check_pressed(0, gp_face2))
#macro X_BUTTON_PRESSED (keyboard_check_pressed(ord("E")) || gamepad_button_check_pressed(0, gp_face3))
#macro Y_BUTTON_PRESSED (keyboard_check_pressed(ord("C")) || gamepad_button_check_pressed(0, gp_face4))
#macro MOUSE_LEFT_BUTTON_PRESSED mouse_check_button_pressed(mb_left)
#macro MOUSE_RIGHT_BUTTON_PRESSED mouse_check_button_pressed(mb_right)

#macro ANY_BUTTON_RELEASED (keyboard_check_released(vk_anykey))
#macro START_BUTTON_RELEASED ((gamepad_button_check_released(0, gp_start)) || (keyboard_check_released(vk_enter)))
#macro RIGHT_BUTTON_RELEASED (keyboard_check_released(vk_right) || keyboard_check_released(ord("D")) || gamepad_button_check_released(0, gp_padr))
#macro DOWN_BUTTON_RELEASED (keyboard_check_released(vk_down) || keyboard_check_released(ord("S")) || gamepad_button_check_released(0, gp_padd) || mouse_wheel_down())
#macro LEFT_BUTTON_RELEASED (keyboard_check_released(vk_left) || keyboard_check_released(ord("A")) || gamepad_button_check_released(0, gp_padl))
#macro UP_BUTTON_RELEASED (keyboard_check_released(vk_up) || keyboard_check_released(ord("W")) || gamepad_button_check_released(0, gp_padu) || mouse_wheel_up())
#macro A_BUTTON_RELEASED (keyboard_check_released(vk_space) || gamepad_button_check_released(0, gp_face1))
#macro B_BUTTON_RELEASED (keyboard_check_released(ord("Q")) || gamepad_button_check_released(0, gp_face2))
#macro X_BUTTON_RELEASED (keyboard_check_released(ord("E")) || gamepad_button_check_released(0, gp_face3))
#macro Y_BUTTON_RELEASED (keyboard_check_released(ord("C")) || gamepad_button_check_released(0, gp_face4))
#macro FACE_BUTTON_RELEASED (A_BUTTON_RELEASED || B_BUTTON_RELEASED || X_BUTTON_RELEASED || Y_BUTTON_RELEASED) 
#macro MOUSE_LEFT_BUTTON_RELEASED mouse_check_button_pressed(mb_left)
#macro MOUSE_RIGHT_BUTTON_RELEASED mouse_check_button_pressed(mb_right)

//NPC behavior constants.
#macro PASSIVE_TIME (game_get_speed(gamespeed_fps) * 3)
#macro AGGRO_TIME (game_get_speed(gamespeed_fps) * 3)


//enums
enum npcState
{
	stand, move
}