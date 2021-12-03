/// @description Insert description here
// You can write your code in this editor
if(global.pause) exit;

draw_self();

draw_set_font(ft_msg);

if(distance_to_object(oPlayer) < 64)
{
	msg_dynamic_multi(msg, vk_enter);
}
else
{
	msg_stop();
}