/// @description Insert description here
// You can write your code in this editor
menu_selected += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

var arr_size = array_length_1d(menu_items);

if(menu_selected >= arr_size) menu_selected = 0;
if(menu_selected < 0) menu_selected = arr_size - 1;

//Input
if (keyboard_check_pressed(vk_enter))
{
	switch(menu_selected)
	{
		case 0: 
			game_end();
		break;
	}
}