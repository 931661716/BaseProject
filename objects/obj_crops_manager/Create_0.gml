/// @description Insert description here 
//The exp system for crop
// each crop require a certain amount of exp point to ascend to a stage
// each day watered will give them 100 exp
// depend on the fertilizer, add more exp

//How to store exp point for each crop 
// There are 3 way to do exp point
// 1. save (and update )all the var that affect exp and calculate the exp base on those var when need (choosen)
// 2. save a exp_point var, this var will be updated base on event (day pass, fetilizer)
// 3. both
ds_crops_types = -1
//this is the table that hold information for each type of crop
//Every crop have 5 stage, the different is how many exp to get to each stage
//by design, any type of crop only need 1 day(=100exp) to get to stage 1
//QUESTION: So if fertilized on the first day, effect == null ?
//Statge 0 = seed
//Statge 1 = sprout
//Statge 2 = seedling
//Statge 3 = budding
//Statge 4 = flowering
//Statge 5 = ripening (harvestable)
//The shape of the table:
//Each row is a type of crop and its info
//col 1 is the exp point to get to stage 1
//col 2 is the exp point to get to stage 2
//col 3 is the exp point to get to stage 3
//col 4 is the exp point to get to stage 4
//col 5 is the exp point to get to stage 5
//col 6 is the name of the crop
//col 7 is the seed price
//TODO: and more to came

ds_crops_instances = -1 
// save the location of cell that already have a crop planted, so that another crop cant be planted on top of that 
// this is a grid that represent the room in a 16x16 cell

ds_crops_data = ds_grid_create(7,1) 
//to save the data of existing crops on the field, for save or for room exit 
//each grop is a crop that is planted
//col 1 is the x coordinate
//col 2 is the y coordinate
//col 3 is the crop type
//col 4 is the days old
//
//ds_crops_data[# 0, 0] = -1
ds_grid_clear(ds_crops_data, -1)
is_planting = false
max_growth_stage = 5 //by design
//the order of this enum should correspond to the order in the sprite
enum FANTASY_CROP {
	CARROT,
	CROP2, //placeholder
	CROP3,
	CROP4,
	CROP5,
	CROP6,
	CROP7,
	CROP8
}
num_fantasy_crop = 8 //by sprite
selected_crop = 0 //correspond to enum above

//insert the info of a crop to the table
//again, the order is important, should correspond to the order of crop in the sprite
create_crop_type(100,200,300,400,500,"carrot", 70)  //this is the info of the carrot
create_crop_type(100,100,100,100,100,"crop2", 700)
create_crop_type(100,100,100,100,100,"crop3", 700)
create_crop_type(100,100,100,100,100,"crop4", 700)
create_crop_type(100,100,100,100,100,"crop5", 700)
create_crop_type(100,100,100,100,100,"crop6", 700)
create_crop_type(100,100,100,100,100,"crop7", 700)
create_crop_type(100,100,100,100,100,"crop8", 700)

mx = 0;
my = 0;

cell_size = 16