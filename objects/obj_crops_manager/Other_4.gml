/// @description save the data of the crops on the current farm foom
//if (room = rm_farm) {
	ds_crops_instances = ds_grid_create(room_width div cell_size, room_height div cell_size)
	ds_grid_clear(ds_crops_instances, 0)
	
	if ds_crops_data[# 0, 0] != -1 {
		var _inst_num = ds_grid_height(ds_crops_data)
		var _slot = 0; repeat(_inst_num) {
			respawn_crop(
				ds_crops_data[# 0, _slot],
				ds_crops_data[# 1, _slot],
				ds_crops_data[# 2, _slot],
				ds_crops_data[# 3, _slot]
			)
			
			_slot +=1
		}
	}
	//because the crop grid data only contain days old, so the current state of crop need to be set explicitly
	with(obj_fantasy_crop) {
		growth_stage = days_old div growth_stage_duration
		
		if (growth_stage >= max_growth_stage) {
			growth_stage = max_growth_stage
			fully_grown = true
		}
	}
//}

 
