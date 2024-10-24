// Movement controls for left and right arrows
if (keyboard_check(vk_left)) {
    x -= 5;  // Move left by 5 pixels
} 
if (keyboard_check(vk_right)) {
    x += 5;  // Move right by 5 pixels
}

// Fire a projectile when up arrow is pressed
if (keyboard_check_pressed(vk_up)) {
    var proj = instance_create_layer(x, y, "Instances", Obj_ship_projectile);  // Create the projectile
    if (proj != noone) {  // Ensure the projectile was created successfully
        proj.direction = 90;  // Set direction to upwards
        proj.speed = 10;      // Set the speed to 10 (moving up)
    }
}


// Check for collision with type_one_obj
if (place_meeting(x, y, Type_one_obj)) {
    var obj = instance_place(x, y, Type_one_obj);  // Find the object
    if (obj != noone) {
        instance_destroy(obj);  // Destroy the type_one_obj
        global.points += 1;     // Increase points by 1 for type_one_obj
        instance_destroy();     // Destroy the projectile itself
    }
}

// Check for collision with type_two_obj
if (place_meeting(x, y, Type_two_obj)) {
    var obj = instance_place(x, y, Type_two_obj);  // Find the object
    if (obj != noone) {
        instance_destroy(obj);  // Destroy the type_two_obj
        global.points += 2;     // Increase points by 2 for type_two_obj
        instance_destroy();     // Destroy the projectile itself
    }
}

// Check for collision with type_three_obj
if (place_meeting(x, y, Type_three_ob)) {
    var obj = instance_place(x, y, Type_three_ob);  // Find the object
    if (obj != noone) {
        instance_destroy(obj);  // Destroy the type_three_obj
        global.points += 3;     // Increase points by 3 for type_three_obj
        instance_destroy();     // Destroy the projectile itself
    }
}

// Check if invader_obj is underneath shield_obj_one, shield_obj_two, or shield_obj_three
if (place_meeting(x, y, invader_obj)) {
    // If invader_obj is beneath any of the shield objects, destroy the alien projectile
    if (place_meeting(x, y, shield_obj_one) || 
        place_meeting(x, y, shield_obj_two) || 
        place_meeting(x, y, shield_obj_three)) {
        var alien_proj = instance_place(x, y, Obj_alien_projectile);  // Find the alien projectile
        if (alien_proj != noone) {
            instance_destroy(alien_proj);  // Destroy the alien projectile
        }
    }
}