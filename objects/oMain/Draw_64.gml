/// @description Insert description here
// You can write your code in this editor

if (surface_exists(fade_surf))
{
	if(fade_alpha > 0)
	{
		var s_w = surface_get_width(fade_surf);
		var s_h = surface_get_height(fade_surf);
		var _w = display_get_gui_width();
		var _h = display_get_gui_height();
		draw_surface_ext(fade_surf, 0, 0, _w/s_w, _h/s_h, 0, -1, fade_alpha);
		
		fade_alpha -= 0.1;
	}
	
	else
	{
		surface_free(fade_surf);
	}
}