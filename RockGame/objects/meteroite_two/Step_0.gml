/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// Inherit the parent event
event_inherited();

// Check if the current room is rm_gametwo
if (room == rm_gametwo) {
    // Check if the object falls below a certain height
    if (y > room_height / 2) {
        rock_spd = 20;
        sprite_index = meteorite_two;
    } else {
        sprite_index = meteorite_one;
    }

    // Move the object downwards with speed rock_spd
    y += rock_spd;
}