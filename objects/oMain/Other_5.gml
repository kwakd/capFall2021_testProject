/// @description Insert description here
// You can write your code in this editor

//surface
var _w = surface_get_width(application_surface);
var _h = surface_get_height(application_surface);
fade_surf = surface_create(_w, _h);
surface_copy(fade_surf, 0, 0, application_surface);

fade_alpha = 1;