/// Step event for spikes_obj

// Room-specific falling behavior
if (room == rm_game_2) {
    fall_interval = 10 * room_speed;  // Set fall interval to 10 seconds for room 2
} else if (room == rm_game_4 || room == rm_game_5) {
    fall_interval = 20 * room_speed; 
} else {
    fall_timer = 0;    // Reset the timer in other rooms
    vspd = 0;          // Prevent spikes from moving in other rooms
    exit;              // Exit the Step event to prevent further execution in other rooms
}
// Set fall interval to 20 seconds for rooms 4 and 5

// Increment the fall timer
fall_timer += 1;

// Check if the fall timer has reached the interval
if (fall_timer >= fall_interval) {
    // Apply vertical movement (falling)
    vspd += grav_amt;  // Apply gravity to make spikes fall
    y += vspd;         // Apply vertical speed

    // Reset spikes to the top of the room if they fall off the screen
    if (y > room_height) {
        y = 0;  // Reset spikes to the top of the room
        fall_timer = 0;  // Reset the timer after spikes have fallen
        vspd = 0;  // Reset vertical speed
    }
} else {
    // If the timer hasn't reached the interval, keep spikes in place
    vspd = 0;
}