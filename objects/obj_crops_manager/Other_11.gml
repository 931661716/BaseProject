/// @description call this function to make the crop grow by a day
// You can write your code in this editor
if (instance_exists(obj_fantasy_crop)) {
	with(obj_fantasy_crop) {
		if growth_stage < max_growth_stage {
			days_old += 1
			growth_stage = days_old div growth_stage_duration
		} else {
			growth_stage = max_growth_stage
			fully_grown = true
		}
	}
	
} else if (ds_crops_data[# 0, 0] != -1) {
	var _h = ds_grid_height(ds_crops_data)
	var _i = 0; repeat(_h) {
		ds_crops_data[# 3, _i] += 1
		_i += 1
	} 

}



