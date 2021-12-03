/// @description Insert description here
// You can write your code in this editor

//audio
if(!audio_is_playing(snd_music)) audio_play_sound(snd_music, 10, true);

move_speed = 9;
jump_speed = 20;
grav = 1.2;

attack_key = vk_space;

hsp = 0;
vsp = 0;



kb_x = 0;
kb_speed = 15;

hurt_time = 0;

//states
enum st
{
	normal,
	attack,
	hurt,
	dead,
	angry
}

state = st.normal;

//camera
view_enabled = true;
view_visible[0] = true;

var width = 800;
var height = 600;
var scale = 1;

var cam = camera_create_view(0, 0, width, height, 0, oPlayer, -1, -1, width/2, height/2);
view_set_camera(0, cam);

window_set_size(width * scale, height * scale);
surface_resize(application_surface, width * scale, height * scale);

//gui
display_set_gui_size(width, height);