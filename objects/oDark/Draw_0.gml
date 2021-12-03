/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black);
draw_rectangle(0,0, room_width, room_height, false);
draw_set_color(c_white);

if(surface_exists(pause_surf))
{
	var cam_x = camera_get_view_x(view_camera);
	var cam_y = camera_get_view_y(view_camera);
	
	var gui_w = display_get_gui_width();
	var gui_h = display_get_gui_height();
	var _w = surface_get_width(pause_surf);
	var _h = surface_get_height(pause_surf);
	
	draw_surface_ext(pause_surf, cam_x, cam_y, gui_w/_w, gui_h/_h, 0, c_gray, 1);
}