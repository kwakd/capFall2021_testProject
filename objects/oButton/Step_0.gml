/// @description Insert description here
// You can write your code in this editor
if(position_meeting(mouse_x, mouse_y, id))
{
	image_index = 1;
	
	if(mouse_check_button_pressed(mb_left))
	{
		//remove from ds lsit
		ds_list_delete(global.inv, item_id);
		
		//item effect
		switch(item_type)
		{
			case item.mushroom:
				lives += 1;
			break;
			
			case item.waffle:
				lives += 2;
			break;
		}
		instance_destroy(oButton);
		instance_destroy(oDark);
		global.pause = false;
	}
}
else
{
	image_index = 0;
}