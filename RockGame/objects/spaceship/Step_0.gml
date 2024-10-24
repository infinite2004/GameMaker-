/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if !got_hit{
	if keyboard_check( vk_right){
	    x +=5
	} else if keyboard_check( vk_left){
	    x -=5
	} else if keyboard_check( vk_up){
	    y -=5
	} else if keyboard_check( vk_down){
	    y +=5
	}

	if x > room_width{
		x = 0
	}
	if x < 0{
		x = room_width
	}
	if y < 0{
		y = 0
	}
	if y > room_height{
		y = room_height
	}
	if y <= 0 {
        // Go to the end room
        room_goto(rm_end);
    }
	
	if collision_circle(x,y,20,obj_rock,false,false){
		var nearest_rock = instance_nearest(x,y,obj_rock)
		nearest_rock.rock_reset = true
		
		got_hit = true
		PLAYER_LIVES -= 1
		hit_timer = hit_timer_max
	
		x = start_x
		y = start_y
	}
	
	if collision_circle(x, y, 20, meteroite_one, false, false) {
       var nearest_meteroite = instance_nearest(x, y, meteroite_one);
        nearest_meteroite.rock_reset = true;  // Assuming meteorite_one has similar logic

        got_hit = true;
        PLAYER_LIVES -= 1;
        hit_timer = hit_timer_max;

        // Reset player to starting position
        x = start_x;
        y = start_y;
    }
	
	if collision_circle(x, y, 20, meteroite_two, false, false) {
       var nearest_meteroite = instance_nearest(x, y, meteroite_two);
        nearest_meteroite.rock_reset = true;  // Assuming meteorite_one has similar logic

		image_xscale = 4/3;  // Scale width
        image_yscale = 4/3; // Scale height
		
		
        got_hit = true;
        PLAYER_LIVES -= 5;
        hit_timer = hit_timer_max;
		
		POINTS -= 9;

        // Reset player to starting position
        x = start_x;
        y = start_y;
    }
	
	if collision_circle(x, y, 20, meteroite_three, false, false) {
        // Scale the player to 2 times its size
        image_xscale = 4;  // Scale width
        image_yscale = 4;  // Scale height

        // Increase the player's health by 1
        PLAYER_LIVES += 1;
		
		POINTS += 10;

        // Reset player to starting position
        x = start_x;
        y = start_y;
    }
	
}

if got_hit{
	
	hit_timer -=1
	if hit_timer < 0 {
		got_hit = false
	}
	
	
}