/// @description Insert description here
// You can write your code in this editor

if (keyboard_check(vk_right)){
	x +=5
} else if (keyboard_check(vk_left)){
	x-=5
} else if (keyboard_check(vk_up)) {
	y-=5
} else if (keyboard_check(vk_down)) {
	y+=5
}

if x > room_width{
	x = 0
}

if x < 0 {
	x = room_width
}

if y < 0 {
	y = 0
}

if y > room_height{
	 y = room_height
}

if collision_circle(x,y,20,obj_rock,false,false){
	got_hit =  true
	hit_timer = hit_timer_max
	
	x = start_x
	y = start_y
	
}

if got_hit{
	hit_timer
	