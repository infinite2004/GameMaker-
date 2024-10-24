/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if moving_right{
	pressed_right = true
	pressed_left = false
	
}else{
	pressed_left = true
	pressed_right = false
}

if moving_right{
	if collision_circle(x+8,y-8,4,obj_platform,false,true){
		moving_right = !moving_right
	}
}else{
	if collision_circle(x-8,y-8,4,obj_platform,false,true){
		moving_right = !moving_right
	}
}

sprite_index = spr_fire_enemy

