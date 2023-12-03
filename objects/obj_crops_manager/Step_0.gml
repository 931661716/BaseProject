/// @description This is a helper function that plant the crop on the mouse location and only used for testing
// Shoud be modifed to match game mechanic
// Call the instance_create_crop() to plant the crop in a specific location

if (keyboard_check_pressed(ord("P"))) {is_planting = !is_planting}

if(is_planting) {
	mx = mouse_x
	my = mouse_y
	
	if(mouse_wheel_up()) {selected_crop +=1}
	if(mouse_wheel_down()) {selected_crop -=1}
	if selected_crop > num_fantasy_crop - 1 {selected_crop = 0}
	if selected_crop < 0 {selected_crop = num_fantasy_crop - 1}

	
	if mouse_check_button_pressed(mb_left) {
		instance_create_crop(mx, my, selected_crop)
	}
}

//Testing grow_state
if (instance_exists(obj_fantasy_crop) and keyboard_check_pressed(ord("G"))) {
	with(obj_fantasy_crop) {
		if growth_stage < max_growth_stage {
			days_old += 1
			growth_stage = days_old div growth_stage_duration
		} else {
			growth_stage = max_growth_stage
			fully_grown = true
		}
	}
	
}




