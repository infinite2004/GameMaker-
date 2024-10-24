/// @description Insert description here
// You can write your code in this editor

if (room == rm_space_invader_intro) {  
    // Set the color of the text
    draw_set_color(c_white);
    // Draw the text at the specified position (x = 100, y = 100, for example)
    draw_text(550, 100, "SPACE INVADER'n");
	  // Set the color of the text
	draw_set_color(c_green);
	  // Draw the text at the specified positio
	draw_text(550, 200, "PLAY SPACE INVADERS");// Adjust text and position as needed
	
	// Bug 1 
	
	draw_set_color(c_white);
    // Draw the text at the specified position (x = 100, y = 100, for example)
    draw_text(550, 250, "= 10 PTS ");
	
	// Bug 2 
		
	draw_set_color(c_white);
    // Draw the text at the specified position (x = 100, y = 100, for example)
    draw_text(550, 350, "= 20 PTS ");
	
	// Bug 3
	
		
	draw_set_color(c_white);
    // Draw the text at the specified position (x = 100, y = 100, for example)
    draw_text(550, 450, "= 40 PTS ");
	
	// SHIP
	
		
	draw_set_color(c_white);
    // Draw the text at the specified position (x = 100, y = 100, for example)
    draw_text(550, 550, "= ??? PTS ");
}

   if (keyboard_check_pressed(vk_enter)) {
        room_goto(rm_space_invader_lvl_one);  // Switch to the game room
 
   }
   
 if (room == rm_space_invader_lvl_one){
	 
	   // Set the color of the text
	draw_set_color(c_white);
	  // Draw the text at the specified positio
	 var final_text = "SCORE: " + string(global.score);
	 draw_text(90, 20, final_text);// Adjust text and position as needed
	
	
	draw_set_color(c_white);
	  // Draw the text at the specified position
	  
	draw_text(1000, 20, "LIVES:");// Adjust text and position as needed
 }