/// @description Insert description here
// You can write your code in this editor
var _w = surface_get_width(application_surface);
var _h = surface_get_height(application_surface);
pause_surf = surface_create(_w, _h);

surface_copy(pause_surf, 0, 0, application_surface);