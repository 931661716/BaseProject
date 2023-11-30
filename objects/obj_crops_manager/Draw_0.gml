/// @description Insert description here
// You can write your code in this editor

if !is_planting {exit}

draw_sprite_part(
	spr_fantasy_crops, 
	0, 
	16 * 6,
	selected_crop * 16,
	16,
	16,
	mx,
	my
)
