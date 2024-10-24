/// Step event - Fireball movement and collision

// Move the fireball based on its speed
x += hspd;
y += vspd;

// Check for collision with the player
if (place_meeting(x, y, obj_player)) {
    // Decrease the player's score
    global.score -= 1;

    // Destroy the fireball after hitting the player
    instance_destroy();
}

// Destroy fireball if it goes out of bounds (off-screen)
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}