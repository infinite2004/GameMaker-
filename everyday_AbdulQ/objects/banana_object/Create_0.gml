

/// @description Initialize variables for screen shake using the camera

shake_strength = 0;  // No shake initially
shake_time = 0;  // Time for the screen shake
shaking = false;  // Initially, the screen isn't shaking

camera_initialized = false;  // Flag to check if the camera has been initialized
camera_original_x = 0;  // Original x position of the camera
camera_original_y = 0;  // Original y position of the camera