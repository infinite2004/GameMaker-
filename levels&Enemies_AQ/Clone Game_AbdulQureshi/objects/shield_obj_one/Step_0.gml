/// @description Insert description here
// You can write your code in this editor
// Check collision with ship projectile
if (place_meeting(x, y, Obj_ship_projectile)) {
    var proj = instance_place(x, y, Obj_ship_projectile);  // Get the projectile
    if (proj != noone) {
        instance_destroy(proj);  // Destroy the projectile
        hit_count += 1;  // Increase hit count
    }
}

// Check collision with alien projectile
if (place_meeting(x, y, Obj_alien_projectile)) {
    var proj = instance_place(x, y, Obj_alien_projectile);  // Get the projectile
    if (proj != noone) {
        instance_destroy(proj);  // Destroy the projectile
        hit_count += 1;  // Increase hit count
    }
}

// Check if the shield has been hit three times
if (hit_count >= 3) {
    instance_change(shield_obj_two, true);  // Switch to shield_obj_two
}