
function MoveCollide(){

	var full_xspd = xspd + x_remainder
	var full_yspd = yspd + y_remainder
	
	x_remainder = full_xspd % 1;
	y_remainder = full_yspd % 1;
	
	var xspd_floored = floor(abs(full_xspd)) * sign(full_xspd)
	
	if (xspd_floored != 0){
		for (var i=0; i < abs(xspd_floored); i++) {
			if(place_meeting(x+sign(xspd_floored),y,obj_collidable)){
				hitThing = instance_place(x+sign(xspd_floored),y,obj_collidable)
				hitThing.hit = true
				xspd *= -1
				x_remainder = 0
				break;
			}
			x+= sign(xspd_floored)
		}
	}
	
	var yspd_floored = floor(abs(full_yspd)) * sign(full_yspd)
	
	if (yspd_floored != 0){
		for (var i=0; i < abs(yspd_floored); i++) {
			if(place_meeting(x,y+sign(yspd_floored),obj_collidable)){
				hitThing = instance_place(x,y+sign(yspd_floored),obj_collidable)
				hitThing.hit = true
				yspd *= -1
				y_remainder = 0
				break;
			}
			y+= sign(yspd_floored)
		}
	}
	
	
	if x > room_width
	or x < 0{
		xspd *= -1	
		x_remainder = 0
	}

	if y > room_height
	or y < 0{
		yspd *= -1	
		y_remainder = 0
	}

}