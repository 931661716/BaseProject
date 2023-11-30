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
		instance_create_crop(mouse_x, mouse_y, selected_crop)
	}
}
