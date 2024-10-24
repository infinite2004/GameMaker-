/// @description Insert description here
// You can write your code in this editor

if image_index>15 {
	image_speed = 0
	count += 1
	if count >= 60 {
		instance_destroy()
			instance_create_layer(64,736,"Player",obj_player);
	}
}