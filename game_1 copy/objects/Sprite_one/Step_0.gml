if keyboard_check(vk_space) 
{
 	   circ1_x += 10
	   circ1_xone += 10
	   rect_x += 10
	   
	
}

if keyboard_check(vk_backspace) 
{
 	   circ1_x -= 10
	   circ1_xone -= 10
	   rect_x -= 10
	
	  
}

if (keyboard_check(vk_up)) {
    tri_y1 -= tri_speed;
    tri_y2 -= tri_speed;
    tri_y3 -= tri_speed;
}

if (keyboard_check(vk_down)) {
    tri_y1 += tri_speed;
    tri_y2 += tri_speed;
    tri_y3 += tri_speed;
}