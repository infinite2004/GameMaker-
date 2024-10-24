draw_sprite_ext(spr_snowman_bg,0,0,0,1,1,0,c_white,1)

draw_set_halign(fa_left);  // Align text to the left
draw_text(10, 50, "Score: " + string(global.score)); // Display the score at the top left corner


// Check if the current room is the room where you want the text to appear
if (room == rm_game) {  
    // Set the color of the text
    draw_set_color(c_white);
    
    // Draw the text at the specified position (x = 100, y = 100, for example)
    draw_text(500, 500, "Welcome to Teleport'n");
	 draw_text(500, 550, "Press 'S' to start");// Adjust text and position as needed
}

// Optionally, you can add more conditions for other rooms:
if (room == rm_game_5) {
    draw_set_color(c_white);
    draw_text(100, 200, "This is Room 5! Watch out for falling spikes!");
}
if (room == rm_game_6) {
    // Set the color for the text
    draw_set_color(c_white);  // Set text color to white
    
    // Set the font if necessary (optional, if you want a specific font)
    // draw_set_font(your_font);  // Uncomment and set a custom font if desired
    
    // Display the final points
    var final_text = "Final Points: " + string(global.score);
    draw_text(50, 100, final_text);  // Draw the final points at position (100, 100)
}