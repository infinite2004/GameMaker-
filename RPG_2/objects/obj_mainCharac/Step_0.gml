// Handle the tilemap layer based on the current room
var tilemap_layer_id;

if (room == Room1) {  // Room1 is where the ice_room tilemap is used
    tilemap_layer_id = layer_get_id("ice_room");
} 
else if (room == Room2) {  // Room2 is where the fire_room tilemap is used
    tilemap_layer_id = layer_get_id("fire_room");
} 
else if (room == Room3) {  // Room3 is where the ground_room tilemap is used
    tilemap_layer_id = layer_get_id("ground_room");
}

// Get the tilemap ID from the layer
var tilemap = layer_tilemap_get_id(tilemap_layer_id);

// Define movement speed variables
var xspd = 0;  // Horizontal speed
var yspd = 0;  // Vertical speed
var mySpd = 2;  // Movement speed

// Boolean to track whether a key is pressed (and thus movement happens)
var key_pressed = false;  // Assume no key is pressed at first

// Handle player input and set speed accordingly

// Check if RIGHT arrow is pressed
if (keyboard_check(vk_right)) {
    xspd = mySpd;  // Move right
    sprite_index = spr_moveRight;  // Change to right movement sprite
    key_pressed = true;  // Set key_pressed to true
} 
// Check if LEFT arrow is pressed
else if (keyboard_check(vk_left)) {
    xspd = -mySpd;  // Move left
    sprite_index = spr_moveLeft;  // Change to left movement sprite
    key_pressed = true;  // Set key_pressed to true
}

// Check if UP arrow is pressed
if (keyboard_check(vk_up)) {
    yspd = -mySpd;  // Move up
    sprite_index = spr_moveUp;  // Change to up movement sprite
    key_pressed = true;  // Set key_pressed to true
} 
// Check if DOWN arrow is pressed
else if (keyboard_check(vk_down)) {
    yspd = mySpd;  // Move down
    sprite_index = spr_moveDown;  // Change to down movement sprite
    key_pressed = true;  // Set key_pressed to true
}

// Only apply movement if a key is pressed
if (key_pressed) {
    // Horizontal movement and collision check
    if (tilemap_get_at_pixel(tilemap, x + xspd, y) == 0) {  // No collision on the x-axis
        x += xspd;  // Apply horizontal movement
    }

    // Vertical movement and collision check
    if (tilemap_get_at_pixel(tilemap, x, y + yspd) == 0) {  // No collision on the y-axis
        y += yspd;  // Apply vertical movement
    }

    // Play animation while moving
    image_speed = 1;  // Set animation to normal speed
} else {
    // If no key is pressed, stop animation and keep sprite still
    image_speed = 0;  // Stop the animation (idle)
}

// Reset movement speed after applying movement
xspd = 0;
yspd = 0;

// Teleport logic based on room and obj_teleport
if (place_meeting(x, y, obj_teleport)) {
    room_goto(Room2);  // Teleport to Room2 (fire_room)
}

if (place_meeting(x, y, obj_teleport_one)) {
    room_goto(Room3);  // Teleport to Room3 (ground_room)
}