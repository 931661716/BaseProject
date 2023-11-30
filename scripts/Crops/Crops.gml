/// @function reate_crop_type(_growth_state_duration)
/// @param {real} _growth_state_duration the number of stage until the crop is harvestable
/// @description add a row of crop data to the grid
function create_crop_type(_growth_state_duration){
	 arg_num =  argument_count
	 height = 0;
	if !ds_exists(ds_crops_types, ds_type_grid) 
	{
		ds_crops_types = ds_grid_create(arg_num, 1)
		height = 1
	}
	else 
	{
		height = ds_grid_height(ds_crops_types)
		ds_grid_resize(ds_crops_types, arg_num, height + 1)
		height += 1
	}
	
	yy = height - 1
	i = 0 
	repeat (arg_num) 
	{
		ds_crops_types[# i, yy] = _growth_state_duration
		i +=1
	}
}

/// @function instance_create_crop()
/// @param _xx  
/// @param _yy 
/// @param _crop_type mouse_x
/// @description instance_create_crop
function instance_create_crop(_xx, _yy, _crop_type){
	var _ist = instance_create_layer(_xx, _yy,"Instances", obj_fantasy_crop)
	with(_ist) {
		crop_type = _crop_type
		growth_stage_duration = obj_crops_manager.ds_crops_types[# 0, _crop_type]
	}
	return _ist;
}