/// @description Handle mouse hover, left-click for toggling, and right-click for lerp

// Check if the left mouse button (trackpad press) is clicked on the apple object
if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
    // Toggle between the two sprites on left-click
    if (sprite_index == spr_apple) {
        sprite_index = spr_cut_apple; 
		audio_play_sound(apple_sound, 1, false);
		audio_play_sound(_knife_sound, 1, false);// Switch to the cut apple sprite
    } else {
        sprite_index = spr_apple;  // Switch back to the normal apple sprite
    }

    image_speed = 0;  // Stop any animation if sprites are not animated
	audio_play_sound(apple_sound, 1, false);
	audio_play_sound(_knife_sound, 1, false);
}

// Check if the right mouse button is clicked on the apple object
if (mouse_check_button_pressed(mb_right) && position_meeting(mouse_x, mouse_y, id)) {
    // Start lerping (smooth scaling) on right-click

	
	target_scale = 0.8;  // Shrink to 80% of the original size (adjust as needed)

}

// Check if the mouse is hovering over the apple object
if (position_meeting(mouse_x, mouse_y, id)) {
    // Trigger particles (juice splash) when the mouse hovers over the apple
    part_particles_create(particle_system, x, y, particle_type, 5);  // Create 5 particles at the apple's position
}

// Apply lerp (smooth transition) to scale the apple
apple_scale = lerp(apple_scale, target_scale, 0.1);  // Smoothly transition towards the target scale