// In the obj_camera Create Event:

// The target is the object the camera will follow, in this case, the player object
target =obj_mainCharac;  // Replace `obj_player` with your player object name, e.g., `obj_mainCharac`

// Get the active camera in the current view
cam = view_get_camera(view_current);

// Get the dimensions of the camera view (width and height)
cam_width = camera_get_view_width(cam);
cam_height = camera_get_view_height(cam);

// Set the camera's smoothing speed (the lower the value, the smoother the camera)
lerp_spd = 0.1;  // Adjust this for how smooth you want the camera to follow the player

// Set the initial position of the camera to match the player's position
x = target.x;
y = target.y;