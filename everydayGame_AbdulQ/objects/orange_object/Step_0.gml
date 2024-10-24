/// @description Toggle between the apple and cut apple sprite when clicked

// Check if the left mouse button (trackpad press) is clicked on the apple object
if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
    // Toggle between the two sprites
    if (sprite_index == spr_orange) {
        sprite_index = spr_cut_orange;
		 audio_play_sound(orange_sound, 1, false);
		 audio_play_sound(_knife_sound, 1, false)// Switch to the cut apple sprite
    } else {
        sprite_index = spr_orange;  // Switch back to the normal apple sprite
    }
    
    // Optional: Stop any animation for both sprites if they are not animated
    image_speed = 0;
	audio_play_sound(orange_sound, 1, false); 
	audio_play_sound(_knife_sound, 1, false)
}