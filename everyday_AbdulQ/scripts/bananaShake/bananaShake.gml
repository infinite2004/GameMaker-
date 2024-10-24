// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bananaShake(){

var _amt = argument0;  // Amount of shake
var _dur = argument1;  // Duration of shake

// Set the shake variables in the obj_banana
if (instance_exists(obj_banana)) {
    with (obj_banana) {
        shake_strength = _amt;
        shake_time = _dur;
        shaking = true;
		 }
	}

}