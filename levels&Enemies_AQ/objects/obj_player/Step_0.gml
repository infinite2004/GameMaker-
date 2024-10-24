#region base movement and animation related to keypress

// Apply gravity
vspd += grav_amt;

// Check if movement is allowed
if (can_move) {
    if keyboard_check(ord("A")) {							// if pressing A..
        if (hspd > -hspd_max) {
            hspd -= accel;	                                // accelerate if not at max speed left
        } else { 
            hspd = -hspd_max;
        }
        image_xscale = -1;									// flip the sprite to face left
        if grounded {
            sprite_index = spr_snowman_run;
        }
    } else if keyboard_check(ord("D")) {                    // otherwise if D same deal in other direction...
        if (hspd < hspd_max) {
            hspd += accel;
        } else {
            hspd = hspd_max;
        }
        image_xscale = 1;									// flip the sprite to face right
        if grounded {										// only change to walking sprite if on the ground
            sprite_index = spr_snowman_run;
        }
    } else {		
        // if not pressing either direction..
        if grounded {
            hspd = lerp(hspd, 0, .05);						// ..and on the ground.. slow me down
            sprite_index = spr_snowman_idle;				// ..show idle animation!
        }
    }
}

#endregion

#region jumping and falling

if can_move {
    if keyboard_check_pressed(vk_space) {	// "input caching"
        jump_pressed = true;
        alarm[1] = jump_pressed_timer;		// saves the key press for some frames
    }

    if grounded {							// if player is touching the ground or platform
        vspd = 0;							// set our jump value to 0 so we don't move
    } else {									
        // if player is NOT on the ground..
        if just_jumped {
            if keyboard_check(vk_space) {	// ..allow player to hold the jump button for increased height
                jump_pressed = false;
                vspd = -jump_max;
            } else {
                just_jumped = false;
                alarm[0] = 0;
            }
        }

        if vspd > 0 {						// use jump sprite for jump, fall sprite for fall!
            sprite_index = spr_snowman_jump;
        } else {
            sprite_index = spr_snowman_fall;
        }
    }

    if jump_pressed && jumps_spent < num_jump {	//check for jump key only if we have jumps left to use
        jump_pressed = false;				// turn off our jump key, because we used it
        vspd = -jump_max;					// set our jump value to its max to start the jump
        if grounded == false {				// if not on the ground..
            jumps_spent += 1;				// .. use an air jump
        }
        if jump_hold > 0 {
            just_jumped = true;
            alarm[0] = jump_hold;
        }
        grounded = false;					// we're not on the ground anymore! we jumped!
    }
}

#endregion

#region Check for "S" key press to go to rm_start

// Check if "S" key is pressed to go back to the start room
if keyboard_check_pressed(ord("S")) {
    room_goto(rm_start);  // Go to the start room when "S" is pressed
}

#endregion

#region movement and collisions

MoveCollide(); // < - wow, big script!

// Check if player is on the ground
if (place_meeting(x, y+1, obj_platform)) {
    alarm[2] = coyote_time;				// while on a platform, hold this timer at maximum
    grounded = true;
    jumps_spent = 0;
} else {
    grounded = false;
}

// Check if touching obj_teleport_1

if (place_meeting(x, y, obj_teleport_1)) {
    room_goto(rm_game_2);
}

if (place_meeting(x, y, obj_teleport_2)) {
    room_goto(rm_game_3);
}

if (place_meeting(x, y, obj_teleport_3)) {
    room_goto(rm_game_4);
}

if (place_meeting(x, y, obj_teleport_4)) {
    room_goto(rm_game_5);
}

if (place_meeting(x, y, obj_teleport_5)) {
    room_goto(rm_game_6);
}

#endregion

#region Check for collisions with collectibles

// Check if the player is touching the collectible
if (place_meeting(x, y, collectible_obj)) {
    // Increase the score
    global.score += 1;

    // Destroy the collectible object
    with (instance_place(x, y, collectible_obj)) {
        instance_destroy();  // Destroy the collectible when collected
    }

}

#endregion


#region Check for collisions with collectibles

// Check if the player is touching the collectible
if (place_meeting(x, y, collectible_obj_1)) {
    // Increase the score
    global.score += 100;

    // Destroy the collectible object
    with (instance_place(x, y, collectible_obj_1)) {
        instance_destroy();  // Destroy the collectible when collected
    }

}

#endregion

#region Collision with fireball (obj_fireballl)

// Check if the player is touching the fireball
if (place_meeting(x, y, obj_fireballl)) {
    // Play the melting animation
    sprite_index = spr_snowman_melt;
	
	audio_play_sound(death_sound, 1, false)

    // Optionally, reset the animation to start from the first frame
    image_index = 0;

    // Stop player movement so the player stays still while melting
    hspd = 0;
    vspd = 0;

    // Disable player control temporarily during the melting animation
    can_move = false;  // Prevent movement

    // Optionally, destroy the fireball after the collision
    with (instance_place(x, y, obj_fireballl)) {
        instance_destroy();
    }
}

#endregion


#region Collision with fireball (Devil_1_obj)

// Check if the player is touching the fireball
if (place_meeting(x, y,	Devil_1_obj)) {
    // Play the melting animation
    sprite_index = spr_snowman_melt;
	
	audio_play_sound(death_sound, 1, false)

    // Optionally, reset the animation to start from the first frame
    image_index = 0;

    // Stop player movement so the player stays still while melting
    hspd = 0;
    vspd = 0;

    // Disable player control temporarily during the melting animation
    can_move = false;  // Prevent movement

    // Optionally, destroy the fireball after the collision
    with (instance_place(x, y, Devil_1_obj)) {
        instance_destroy();
    }
}

#endregion


#region Collision with fireball (Devil_1_obj)

// Check if the player is touching the fireball
if (place_meeting(x, y,	Devil_2_obj)) {
    // Play the melting animation
    sprite_index = spr_snowman_melt;
	
	audio_play_sound(death_sound, 1, false)

    // Optionally, reset the animation to start from the first frame
    image_index = 0;

    // Stop player movement so the player stays still while melting
    hspd = 0;
    vspd = 0;

    // Disable player control temporarily during the melting animation
    can_move = false;  // Prevent movement

    // Optionally, destroy the fireball after the collision
    with (instance_place(x, y, Devil_2_obj)) {
        instance_destroy();
    }
}

#endregion
#region Check if the melting animation is complete

// Check if the current sprite is spr_snowman_melt and if the animation has finished
if (sprite_index == spr_snowman_melt && image_index >= image_number - 1) {
    // After melting animation completes, restart the level or respawn
    room_restart(); // Restart the room or respawn the player
}

#endregion

#region Collision with spikes (spikes_obj)

// Check if the player is touching the spikes
if (place_meeting(x, y, spikes_obj)) {
    // Decrease the player's score
    global.score -= 1;  // Decrease points by 1, or adjust the value as needed
    
	audio_play_sound(ooofpgh_sound, 1, false)
    // Optional: Knock the player back or show damage effect
    hspd = -hspd_max * 0.5;  // Example of knocking the player back
    vspd = -jump_max * 0.5;  // Example of making the player jump back
	
	x = start_x;  // Replace with the desired x position for respawn
    y = start_y;  // Replace with the desired y position for respawn
    hspd = 0;  // Reset horizontal speed
    vspd = 0;  // Reset vertical speed
}

#endregion