/// @description Insert description here
// You can write your code in this editor
ds_crops_types = -1; //this is the table that hold information for each type of crop
ds_crops_instances = -1 // save the location of cell that already have a crop planted, so that another crop cant be planted on top of that 
is_planting = false
//the order of this enum should correspond to the order in the sprite
enum FANTASY_CROP {
	CARROT,
	CROP2, //dont know the name of the crop yet
	CROP3,
	CROP4,
	CROP5,
	CROP6,
	CROP7,
	CROP8
}
num_fantasy_crop = 8
selected_crop = 0 //correspond to enum above
//insert the info of a crop to the table
//again, the order is important, should correspond to the order of crop in the sprite
create_crop_type(4)  //this is the info of the carrot
create_crop_type(4)  
create_crop_type(4)  
create_crop_type(4)  
create_crop_type(4)  
create_crop_type(4)  
create_crop_type(4)  
create_crop_type(4) 
mx = 0;
my = 0;

cell_size = 16