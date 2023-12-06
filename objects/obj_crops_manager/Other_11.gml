/// @description call this function to make the crop grow by a day
// You can write your code in this editor
if (instance_exists(obj_fantasy_crop)) {
//	with(obj_fantasy_crop) {
//		if growth_stage < max_growth_stage {
//			days_old += 1
//			growth_stage = days_old div growth_stage_duration
//		} else {
//			growth_stage = max_growth_stage
//			fully_grown = true
//		}
//	}
	var _types = obj_crops_manager.ds_crops_types
	var _max_growth_stage = obj_crops_manager.max_growth_stage
	with(obj_fantasy_crop) {
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
				//growth_stage = 5
				growth_stage = _max_growth_stage
				fully_grown = true
			}
			
		} else { //harvestable, this is kindda bloated
			growth_stage = _max_growth_stage
			fully_grown = true
		}
	}
} else if (ds_crops_data[# 0, 0] != -1) { //make crop grow if player is outside the farm_room 
	var _h = ds_grid_height(ds_crops_data)
	var _i = 0; repeat(_h) {
		ds_crops_data[# 3, _i] += 1
		_i += 1
	} 

}



	
	