/// @description This is a helper function that plant the crop on the mouse location and only used for testing
// Shoud be modifed to match game mechanic
// Call the instance_create_crop() to plant the crop in a specific location
//TODO: if(room != rm_farm) {is_planting = false: exit};

if (keyboard_check_pressed(ord("P"))) {is_planting = !is_planting}

if(is_planting) {
	mx = mouse_x
	my = mouse_y
	
	if(mouse_wheel_up()) {selected_crop +=1}
	if(mouse_wheel_down()) {selected_crop -=1}
	if selected_crop > crop_num - 1 {selected_crop = 0}
	if selected_crop < 0 {selected_crop = crop_num - 1}

	
	if mouse_check_button_pressed(mb_left) {
		instance_create_crop(mx, my, selected_crop)
	}
}

//Testing grow_state, TODO:  this should be call each day  
if (instance_exists(obj_crop) and keyboard_check_pressed(ord("G"))) {
	var _types = obj_crops_manager.ds_crops_types
	var _max_growth_stage = obj_crops_manager.max_growth_stage
	with(obj_crop) {
		var _state_1_exp = _types[# 0, crop_type]
		var _state_2_exp = _types[# 1, crop_type]
		var _state_3_exp = _types[# 2, crop_type]
		var _state_4_exp = _types[# 3, crop_type]
		var _state_5_exp = _types[# 4, crop_type] //aka max_exp
		
		if growth_stage < _max_growth_stage { //not harvestable
			if (days_old != 0 and !is_watered) { days_not_watered += 1 }
			days_old += 1
			is_watered = true //TODO should be false when watering mechanic is added, true for debuging 
			
			var _exp = get_cur_exp(days_old, days_not_watered, bonus)
			sprite_num = get_crop_spr_num(_exp, _state_5_exp, max_sprite_num); //set sprite base on cur_exp/max_exp 
			//NOTICE!!Sprite may not reflect the current stage, this is by design (aka a feature not error)
			//Because the number of sprite per crop is not fixed across assets, and this way of doing sprite is 
			//more resource-utilized(unused sprite is wasted sprite) and more fun!
			if (_exp <_state_1_exp ) { //should not be true here, as this is called when a day pass, exp < stage 1
				growth_stage = 0
				sprite_num = 0
				show_debug_message("Exp should not be under 100 when a day passed !?")
			} else if (_exp < _state_2_exp) { // exp < stage 2
				growth_stage = 1
			} else if (_exp < _state_3_exp) { // exp < stage 3
				growth_stage = 2
			} else if (_exp < _state_4_exp) { // exp < stage 4
				growth_stage = 3
			} else if (_exp < _state_5_exp) { // exp < stage 5
				growth_stage = 4
			} else { //stage 5 aka harvestable
				growth_stage = 5
				growth_stage = _max_growth_stage
				fully_grown = true
			}
			
		} else { //harvestable, this is kindda bloated
			growth_stage = _max_growth_stage
			fully_grown = true
		}
	}
	
}




