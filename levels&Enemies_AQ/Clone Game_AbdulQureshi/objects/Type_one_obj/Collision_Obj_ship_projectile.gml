/// @description Insert description here
// You can write your code in this editor
// Destroy the object that was hit (type_one_obj)
with (other) {
    instance_destroy();
}

// Increase the score by 1 point
global.score += 1;

// Destroy the projectile
instance_destroy();