/// @description Insert description here
// You can write your code in this editor

num_rocks = 9

for (i=0; i<num_rocks; i+=1){
	instance_create_depth(0,0,0,meteroite_one)
}

instance_create_depth(0,0,0,meteroite_two)

for (i=0; i<num_rocks; i+=1){
	instance_create_depth(0,0,0,meteroite_three)
}