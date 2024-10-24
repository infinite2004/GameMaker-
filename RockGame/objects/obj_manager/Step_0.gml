// Room: rm_start
if room == rm_start {
    PLAYER_LIVES = maxlives;

    if keyboard_check_pressed(vk_space) {
        room_goto(rm_game);
    }
	
}

// Room: rm_game
if room == rm_game {
    // If pl ayer's lives drop to 0, move to rm_end
    if PLAYER_LIVES <= 0 {
        room_goto(rm_end);
    } 
  
	if keyboard_check_pressed(vk_backspace)  {
		room_goto(rm_gametwo);
	}
}

// Room: rm_end
if room == rm_end {
    if keyboard_check_pressed(vk_space) {
        room_goto(rm_start);
    }
}

// Room: rm_gametwo
if room == rm_gametwo {
    // If player's lives drop to 0, move to rm_end
    if PLAYER_LIVES <= 0 {
        room_goto(rm_end);
    }
}