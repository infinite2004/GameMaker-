/// @description Insert description here
// You can write your code in this editor
// Check if the current room is rm_gametwo
if (room == rm_gametwo) {
    // Allow the rock to move horizontally from left to right in rm_gametwo
    x += rock_spd;

    // Reset the rock's position if it goes beyond the room width
    if (x > room_width + 200) {
        rock_reset = true;
    }

    // Reset rock position logic
    if (rock_reset) {
        rock_spd = random_range(2, 9);  // Random speed for horizontal movement
        x = -200;  // Reset to the left, starting outside the screen
        y = random_range(0, room_height);  // Random Y position within room height

        rock_reset = false;
    }
}