/// @description Insert description here
// You can write your code in this editor

if (hit)
{
	block_health -= 1
	hit = false	
	
}

if block_health<1{
	
	obj.obj_screenshake.shake_on = true
	
	instance_destroy()	
}