/// @description Insert description here
// You can write your code in this editor
// In the obj_camera Step Event:

// Smoothly move the camera towards the player's position using lerp (linear interpolation)
x = lerp(x, target.x - cam_width / 2, lerp_spd);  // Lerp towards the player's x-position
y = lerp(y, target.y - cam_height / 2, lerp_spd);  // Lerp towards the player's y-position

// Set the camera's position based on the newly calculated x and y
camera_set_view_pos(cam, x, y);