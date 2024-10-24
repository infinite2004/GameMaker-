/// @description Initialize foe movement variables

hspd_max = 2;          // Maximum left/right speed for the foe
jump_max = 8;          // Strength of upward force when jumping towards the player
grav_amt = 0.2;        // Gravity strength for natural fall
accel = 0.1;           // Horizontal movement acceleration
grounded = false;
x_remainder = 0;
y_remainder = 0;
vspd = 0;
hspd = 0;