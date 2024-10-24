// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MoveCollide_two(){
// Apply horizontal and vertical movement using remainders
var total_hspd = hspd + x_remainder;    // Apply horizontal speed and leftover movement
var total_vspd = vspd + y_remainder;    // Apply vertical speed and leftover movement

// Move horizontally
var move_horiz = sign(total_hspd);  // Determine the direction (-1, 0, 1)
while (abs(total_hspd) >= 1) {
    if (!place_meeting(x + move_horiz, y, obj_solid)) {
        x += move_horiz;
    }
    total_hspd -= move_horiz;
}

// Save the remaining fractional horizontal movement
x_remainder = total_hspd;

// Move vertically
var move_vert = sign(total_vspd);  // Determine the direction (-1, 0, 1)
while (abs(total_vspd) >= 1) {
    if (!place_meeting(x, y + move_vert, obj_solid)) {
        y += move_vert;
    }
    total_vspd -= move_vert;
}

// Save the remaining fractional vertical movement
y_remainder = total_vspd;
}