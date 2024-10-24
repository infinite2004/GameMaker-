/// @description Insert description here
// You can write your code in this editor

if !global.GAME_BEGIN{
	if keyboard_check_pressed(vk_space){
		global.GAME_BEGIN = true
		instance_create_depth(x,y-32,0,obj_ball)
	}
}


if keyboard_check(vk_right){
	xspd = mspd	
	image_yscale = lerp(image_yscale,0.7,0.7)
	
}
if keyboard_check(vk_left){
	xspd = -mspd
	image_yscale = lerp(image_yscale,0.7,0.7)
}

if (!keyboard_check(vk_right) and !keyboard_check(vk_left)){
	xspd = 0
	image_yscale = lerp(image_yscale,2,0.1)
}

MoveCollide()

