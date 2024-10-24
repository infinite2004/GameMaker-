/// @description Insert description here
// You can write your code in this editor

event_inherited();

image_xscale = 0.5
image_yscale = 0.5
sprite_index = spr_bird

if moving_right{
	if collision_circle(x+10,y-10,4,obj_platform,false,true){
		moving_right = !moving_right
	}
	image_xscale = 0.5
}else{
	if collision_circle(x-10,y-10,4,obj_platform,false,true){
		moving_right = !moving_right
	}
	image_xscale = -0.5
} 

if count <= 60 {
	self.y += 1	
}
if count > 60 {
	self.y -= 1	
}
if count > 120 {
	count = 0
}

count += 1