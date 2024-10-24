/// @description Initialize the apple object with variables for juice effects

// Set the initial sprite to the regular apple
sprite_index = spr_apple;  // Set the initial sprite as the normal apple

// Variables for lerp (linear interpolation)
apple_scale = 1;  // Initial scale of the apple (normal size)
target_scale = 1;  // Target scale (used for lerp)

// Particle system setup (for juice splash)
particle_system = part_system_create();
particle_type = part_type_create();
part_type_shape(particle_type, pt_shape_circle);  // Set shape to circle
part_type_size(particle_type, 0.1, 0.5, 0, 0);  // Particle size range
part_type_color1(particle_type, c_red);  // Red particles for juice
part_type_life(particle_type, 30, 60);  // Life of the particles
part_type_speed(particle_type, 2, 4, 0, 0);  // Speed of the particles