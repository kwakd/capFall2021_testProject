// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tile_ver_coll(){
	var side_to_check;
	if(argument0 > 0) side_to_check = bbox_bottom;
	else side_to_check = bbox_top;
	
	return tilemap_get_at_pixel(global.tilemap, bbox_left, side_to_check + argument0) || tilemap_get_at_pixel(global.tilemap, bbox_right, side_to_check + argument0) || place_meeting(x, y + argument0, oCollision);
}