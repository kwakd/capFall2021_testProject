/// @description Insert description here
// You can write your code in this editor
var draw_x = 40;
var draw_y = 40;

var h_dist = 100;

for(var i = 0; i < lives; i++)
{
	draw_sprite(sHeart, 0, draw_x + (i*h_dist), draw_y);
}

/*
//draw coin gui
draw_set_font(ft_gui);

var _w = display_get_gui_width();

//draw coin sprite
draw_sprite(sCoin, 0, _w - draw_x, draw_y + 7);

//draw coin text
draw_set_halign(fa_right);
draw_text(_w-draw_x*2, draw_y, coins);
draw_set_halign(fa_left);
*/