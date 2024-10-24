
// Check if the current room is rm_gametwo
if (room == rm_gametwo) {
    // Allow the rock to fall only in rm_gametwo
    y += rock_spd;

    // Reset the rock's position if it goes below the room height
    if (y > room_height + 200) {
        rock_reset = true;
    }

    // Reset rock position logic
    if (rock_reset) {
        rock_spd = random_range(2, 9);
        y = -200;  // Reset above the room
        x = random_range(0, room_width);  // Random X position within room width

        rock_reset = false;
    }
}