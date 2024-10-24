/// Step event - Foe follows the player

// Assume obj_player is the object we are following
if (instance_exists(obj_player)) {
    // Get the player's position
    var player_x = obj_player.x;
    var player_y = obj_player.y;
    
    // Calculate the distance to the player
    var x_distance = player_x - x;
    var y_distance = player_y - y;
    
    // Horizontal movement (move towards the player)
    if (x_distance > 0) {
        // Move right if player is to the right
        hspd = min(hspd_max, hspd + accel);  // Accelerate towards player
        image_xscale = 1;  // Flip sprite to face right
    } else if (x_distance < 0) {
        // Move left if player is to the left
        hspd = max(-hspd_max, hspd - accel);  // Accelerate towards player
        image_xscale = -1;  // Flip sprite to face left
    } else {
        // Slow down if directly aligned with the player
        hspd = lerp(hspd, 0, .1);
    }
    
    // Vertical movement (simple tracking)
    if (y_distance > 0) {
        // Move down if player is below
        vspd += grav_amt;  // Apply gravity
    } else if (y_distance < 0) {
        // Move up if player is above
        vspd = -jump_max;  // Apply jump strength to move up
    }
    
    // Basic collision and movement logic
    MoveCollide();  // This function handles movement and collisions with the environment
}

// Ground check (similar to your player)
if (place_meeting(x, y + 1, obj_platform)) {
    grounded = true;
    vspd = 0;
} else {
    grounded = false;
}

// Apply horizontal speed
//x += hspd;

//// Apply vertical speed
//y += vspd;