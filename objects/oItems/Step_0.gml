/// @description Insert description here
// You can write your code in this editor

//sprite
sprite_index = item_spr[item_type];

//collect
if(place_meeting(x,y, oPlayer))
{
	ds_list_add(global.inv, item_type);
	instance_destroy();
}

//gravity
if(!tile_ver_coll(1))
{
	y += 2;
}

//hsp
if(hsp != 0) hsp -= 0.2 * sign(hsp);
x += hsp;

