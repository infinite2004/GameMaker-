/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
// Move the object left and right
x += movement_speed;

// Check if the object hits the right border
if (x >= room_width - sprite_width / 2) {
    // Reverse the direction if the object reaches the right border
    movement_speed = -movement_speed;  // Reverse the movement speed
    x = room_width - sprite_width / 2; // Keep the object within the border
}

// Check if the object hits the left border
if (x <= sprite_width / 2) {
    // Reverse the direction if the object reaches the left border
    movement_speed = -movement_speed;  // Reverse the movement speed
    x = sprite_width / 2;              // Keep the object within the border
}

// Randomly shoot a projectile
if (random(1500) < 1) {  // 1% chance to fire a projectile every step
    var proj = instance_create_layer(x, y, "Instances", Obj_alien_projectile);  // Create the projectile
    if (proj != noone) {  // Ensure the projectile was created successfully
        proj.direction = -90;  // Set direction to downwards (alien shooting down)
        proj.speed = 5;      // Set the speed to 10 (moving down)
    }
}

// Check for collision with invader_obj
if (place_meeting(x, y, invader_obj)) {
    var obj = instance_place(x, y, invader_obj);  // Find the object
    if (obj != noone) {
        instance_destroy(obj);  // Destroy the invader_obj
        global.points -= 20;    // Decrease points by 20 if hit by the invader
        instance_destroy();     // Destroy the projectile itself
    }
}