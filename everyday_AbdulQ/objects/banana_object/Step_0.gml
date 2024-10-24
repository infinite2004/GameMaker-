/// @description Handle banana clicking and screen shake

// Store the camera reference (once)
if (!camera_initialized) {
    camera = view_camera[0];  // Get the current camera used by the view
    camera_original_x = camera_get_view_x(camera);  // Store the original camera x position
    camera_original_y = camera_get_view_y(camera);  // Store the original camera y position
    camera_initialized = true;
}

// 1. Trigger screen shake when the banana is clicked
if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
    // Trigger screen shake with intensity 10 and duration 20 frames
    audio_play_sound(banana_sound, 1, false);
	// Play sound (priority 1, not looping)
    shake_strength = 10;  // Set the intensity of the shake
    shake_time = 20;  // Set the duration of the shake
    shaking = true;  // Set the shaking flag to true
	audio_play_sound(banana_sound, 1, false);  // Play sound (priority 1, not looping)

}

// 2. Apply screen shake by adjusting the camera position
if (shaking) {
    // Randomly adjust the camera position for the shake effect
    var shake_x = random_range(-shake_strength, shake_strength);  // X-axis shake
    var shake_y = random_range(-shake_strength, shake_strength);  // Y-axis shake

    // Apply the shake to the camera
    camera_set_view_pos(camera, camera_original_x + shake_x, camera_original_y + shake_y);

    // Decrease the shake time
    shake_time -= 1;

    // Stop shaking when the time runs out
    if (shake_time <= 0) {
        shaking = false;  // Stop the shake
        shake_strength = 0;  // Reset shake strength

        // Reset the camera position to its original state
        camera_set_view_pos(camera, camera_original_x, camera_original_y);
    }
}