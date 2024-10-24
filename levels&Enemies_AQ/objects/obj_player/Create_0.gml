/// @description Initialize player movement variables
global.score = 0; 
  // Initially, the player can move// Create a global variable for the score
if (room == rm_game_5) {
	hspd_max =5;          // Increase max speed for new room
    jump_max = 15;          // Increase jump strength
    grav_amt = 2;        // Lessen gravity for a floatier feel
    num_jump = 2;   
}
if (room == rm_game_4) {
	hspd_max =5;          // Increase max speed for new room
    jump_max = 15;          // Increase jump strength
    grav_amt = 2;        // Lessen gravity for a floatier feel
    num_jump = 2;   
}
if (room == rm_game_3) {
	hspd_max =5;          // Increase max speed for new room
    jump_max = 15;          // Increase jump strength
    grav_amt = 2;        // Lessen gravity for a floatier feel
    num_jump = 2;   
}
if (room == rm_game_2) {
    // If the player is in the new room, change the movement settings
    hspd_max =5;          // Increase max speed for new room
    jump_max = 15;          // Increase jump strength
    grav_amt = 2;        // Lessen gravity for a floatier feel
    num_jump = 2;          // Allow double jumping in the new room
} else {
    // Default movement settings for the original room
    hspd_max = 5;          // Maximum left/right speed
    jump_max = 8;          // Strength of upward force
    grav_amt = 0.2;        // Gravity strength
    num_jump = 2;          // Only single jump allowed
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
can_move = true;
start_x = x;  // Save the initial spawn x-coordinate
start_y = y;  // Save the initial spawn y-coordinate
#endregion