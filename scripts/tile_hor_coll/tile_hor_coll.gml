// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tile_hor_coll(){
	var side_to_check;
	if(argument0 > 0) side_to_check = bbox_right;
	else side_to_check = bbox_left;
	
	return tilemap_get_at_pixel(global.tilemap, side_to_check + argument0, bbox_top) || tilemap_get_at_pixel(global.tilemap, side_to_check + argument0, bbox_bottom) || place_meeting(x+argument0, y, oCollision);
}