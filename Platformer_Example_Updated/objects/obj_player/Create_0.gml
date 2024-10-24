/// @description Initialize player movement variables

if (room == rm_final_ability_) {
	hspd_max =1;          // Increase max speed for new room
    jump_max = 1000;          // Increase jump strength
    grav_amt = 1;        // Lessen gravity for a floatier feel
    num_jump = 1;   
}
if (room == rm_new_ability) {
	hspd_max =1000;          // Increase max speed for new room
    jump_max = 1000;          // Increase jump strength
    grav_amt = 1000;        // Lessen gravity for a floatier feel
    num_jump = 1000;   
}
if (room == rm_try_ability) {
    // If the player is in the new room, change the movement settings
    hspd_max =10;          // Increase max speed for new room
    jump_max = 10;          // Increase jump strength
    grav_amt = 10;        // Lessen gravity for a floatier feel
    num_jump = 10;          // Allow double jumping in the new room
} else {
    // Default movement settings for the original room
    hspd_max = 4;          // Maximum left/right speed
    jump_max = 6;          // Strength of upward force
    grav_amt = 0.8;        // Gravity strength
    num_jump = 1;          // Only single jump allowed
}

accel = .1;                // Left/right movement acceleration
jump_hold = .25 * room_speed;  // Time you can hold for a higher jump
jump_pressed_timer = 60;   // Number of frames to save the "jump" input
coyote_time = 2;           // Number of frames before you fall when stepping off a platform

#region Do not change these.
hspd = 0;
vspd = 0;
grounded = false;
just_jumped = false;
jumps_spent = 0;
jump_pressed = false;
x_remainder = 0;
y_remainder = 0;
image_speed = 1;
#endregion