/// @description Insert description here
// You can write your code in this editor

y += rock_spd

if y > room_height+200 {
	rock_reset = true	
}

if rock_reset{
	rock_spd = random_range(3, 10)
	y = -200
	x = random_range(0,room_width)
	
	rock_reset = false
}

