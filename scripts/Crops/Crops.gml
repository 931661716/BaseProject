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
/// @description instance_create_crop, auto snap the crop placement into a cell, may need to move the snap logic
/// to the part that call this 
function instance_create_crop(_xx, _yy, _crop_type) {
	
	//snap the location to a cell
	var _cs = obj_crops_manager.cell_size
	var _i_grid = obj_crops_manager.ds_crops_instances
	
	_xx = _xx div _cs
	_yy = _yy div _cs
	
	var _gx = _xx
	var _gy = _yy
	var _cell = _i_grid[# _gx, _gy]
	if (_cell == 0) {
		_xx = _xx * _cs
		_yy = _yy * _cs
	
		//TODO:Check for if the location for if is soil tile. Dont know it we have soil tile yet ?
		//var _lay_id = layer_get_id("nameOfSoilTile")
		//var _map_id = layer_tilemap_get_id(_lay_id)
		//var _data = tilemap_get_at_pixel(_map_id, _xx, _yy)
		//if _data == 0 { return false }
	
		//save the newly created crop's id to the ds_crops_instances
		var _ist = instance_create_layer(_xx , _yy,"Instances", obj_fantasy_crop)
		_i_grid[# _gx, _gy] = _ist
	
		with(_ist) {
			crop_type = _crop_type
			growth_stage_duration = obj_crops_manager.ds_crops_types[# 0, _crop_type]
		}
		return _ist;
	} else {
		show_debug_message("There is already something here")
		return false
	}
	
}