room_speed = 60
randomize();
global.BLOCK_WIDTH = sprite_get_width(spr_block)
global.BLOCK_HEIGHT = sprite_get_height(spr_paddle)
global.padding = 8

x= room_width * 0.5
y= room_height * 0.05

num_rows = 6
num_columns = 10


for (c = -(num_columns/2);c < num_columns/2; c+=1){
	for (r = 0;r < num_rows; r+=1){
		
		instance_create_depth(x+(c*global.BLOCK_WIDTH) + (c*global.padding),y+(r*global.BLOCK_HEIGHT)+(r*global.padding),0,obj_block)

	}
}


