/// @description Insert description here
// You can write your code in this editor

//pause
if(keyboard_check_pressed(vk_escape))
{
	global.pause = !global.pause;
	
	//if paused
	if(global.pause)
	{
		//dark
		instance_create_layer(0,0, btn_layer, oDark);	
		
		//buttons
		var w = 0;
		var h = 0;
		
		var margin = 150;
		var size = 16;
		var dist = 70;
		
		for(var i = 0; i<ds_list_size(global.inv); i++)
		{
			//create buttons
			var _x = margin + (w*(size + dist));
			var _y = margin + (h*(size + dist));
			var _cam_x = camera_get_view_x(view_camera);
			var _cam_y = camera_get_view_y(view_camera);
			var btn = instance_create_layer(_cam_x + _x, _cam_y + _y, btn_layer, oButton);
			
			btn.item_id = i;
			btn.item_type = global.inv[|i];
			
			//placement
			w++;
			
			var _w = display_get_gui_width();
			
			if(w *(size + dist) > _w - margin * 2)
			{
				w = 0;
				h++;
			}
			
			
		}
	}
	
	//if resumed
	else
	{
		instance_destroy(oButton);
		instance_destroy(oDark);
	}
}