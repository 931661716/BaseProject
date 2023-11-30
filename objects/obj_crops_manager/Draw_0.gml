/// @description Insert description here
// You can write your code in this editor
//draw the crop image near the mouse to indicate which crop is being selected, for debuging purpose
if !is_planting {exit}

var _xx = mx div cell_size
var _yy = my div cell_size

var _gx = _xx
var _gy = _yy

_xx = _xx * cell_size
_yy = _yy * cell_size

var _c = c_green

//TODO:Check for if the location for if is soil tile. Dont know it we have soil tile yet ?
//var _lay_id = layer_get_id("nameOfSoilTile")
//var _map_id = layer_tilemap_get_id(_lay_id)
//var _data = tilemap_get_at_pixel(_map_id, _xx, _yy)
//if _data != 0 _c = c_white
if ds_crops_instances[# _gx, _gy] != 0 {
	_c = c_red
}  
draw_rectangle_color(_xx,_yy,_xx + cell_size, _yy + cell_size, _c,_c,_c,_c, true)

draw_sprite_part(
	spr_fantasy_crops, 
	0, 
	16 * 6,
	selected_crop * 16,
	16,
	16,
	_xx,
	_yy
)
