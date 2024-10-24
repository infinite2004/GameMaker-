#region base movement and animation related to keypress

vspd += grav_amt                                        //apply gravity

if is_player{
	
	if keyboard_check(ord("A")){
		pressed_left = true
	}else {
		pressed_left = false
	}

	if keyboard_check(ord("D")){
		pressed_right = true
	}else {
		pressed_right = false
	}
	
	if keyboard_check_pressed(vk_space){
		pressed_jump = true
	}
	
	if keyboard_check(vk_space){
		hold_jump = true
	}else{
		hold_jump = false
	}
}


if pressed_left{							// if pressing A..
    if (hspd > -hspd_max){
		hspd -= accel	                                //accelerate if not at max speed left
	} else { 
		hspd = -hspd_max 
	}
    image_xscale = -1									//flip the sprite to face left
    if grounded{
        sprite_index= spr_snowman_run
    }
}else if pressed_right{                     //otherwise if D same deal in other direction...
        if (hspd < hspd_max){
			hspd += accel	
		} else {
			hspd = hspd_max
		}
    image_xscale = 1									//flip the sprite to face right
    if grounded{										//only change to walking sprite if on the ground
        sprite_index= spr_snowman_run
    }
}else{		
	//if not pressing either direction..
    if grounded{
		hspd = lerp(hspd, 0, .05)						//..and on the ground.. slow me
        sprite_index= spr_snowman_idle					//..show idle animation!
    }
}



#endregion

#region jumping and falling

if pressed_jump{	// "input caching"
	jump_pressed = true
	alarm[1] = jump_pressed_timer		// saves the key press for some frames
}

if grounded {							// if player is touching the ground or platform
	vspd = 0							// set our jump value to 0 so we don't move
	
}else{									
										// if player is NOT on the ground..
	if just_jumped{
		if hold_jump{					// ..allow player to hold the jump button for increased height
			jump_pressed = false
			vspd = -jump_max
		} else {
			just_jumped = false
			alarm[0] = 0
		}
	}
	
    if vspd > 0{						// use jump sprite for jump, fall sprite for fall!
        sprite_index= jump_animation
    }else{
        sprite_index= spr_snowman_fall
    }
}

if jump_pressed
and jumps_spent < num_jump {			//check for jump key only if we have jumps left to use
    jump_pressed = false				// turn off our jump key, because we used it
	vspd = -jump_max					// set our jump value to its max to start the jump
    								      
	if grounded == false{				// if not on the ground..
		jumps_spent += 1				// .. use an air jump
	}
	if jump_hold > 0{
		just_jumped = true
		alarm[0] = jump_hold
	}
		
	grounded=false						// we're not on the ground anymore! we jumped!
}

#endregion


#region movement and collisions

MoveCollide() // < - wow, big script!

//are we on the ground?
if(place_meeting(x, y+1, obj_platform)){
	alarm[2] = coyote_time				// while on a platform, hold this timer at maximum
	grounded = true
	jumps_spent = 0
} else {
	//grounded = false
}
#endregion

pressed_jump = false

if is_player{
	if collision_circle(x,y,8,obj_foe,false,true){
		instance_create_layer(self.x,self.y,"Player",obj_playerdie);
		instance_destroy(self)
	}
	
	if collision_circle(x,y,8,obj_foespike,false,true){
		instance_create_layer(self.x,self.y,"Player",obj_playerdie);
		instance_destroy(self)
	}
	
	if collision_circle(x,y,8,obj_foebird,false,true){
		instance_create_layer(self.x,self.y,"Player",obj_playerdie);
		instance_destroy(self)
	}
	
	if collision_circle(x,y,8,obj_foecar,false,true){
		instance_create_layer(self.x,self.y,"Player",obj_playerdie);
		instance_destroy(self)
	}
	
	if collision_circle(x,y,8,obj_next_room,false,true){
		room_goto_next()
	}
	
	if keyboard_check_pressed(vk_escape) {
		room_goto_next()
	}

}
