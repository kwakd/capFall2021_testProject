/// @description Insert description here
// You can write your code in this editor

if(global.pause) exit;

switch(state)
{
	case st.normal:
		sprite_index = sBoss;
		
		//fall
		if(!tile_ver_coll(4))
		{
			y += 4;
		}
		else
		{
			while(!tile_ver_coll(1))
			{
				y++;	
			}
		}
		
		
		//wall detection
		if(tile_hor_coll(hsp))
		{
			hsp = -hsp;
		}
		
		
		if(tile_ver_coll(1))
		{
			//flip
			image_xscale = sign(hsp);
			x += hsp;
		}
		
		//hurt
		if(place_meeting(x,y,oPlayer) && oPlayer.state == st.attack)
		{
			kb_x = sign(x - oPlayer.x);
			image_xscale = -kb_x;
			hp--;
			state_set(st.hurt);
		}
		
		//dead
		if(hp <= 0)
		{
			state_set(st.dead);	
		}
	break;
	
	case st.hurt:
		sprite_index = sBossHurt;
		x += kb_x * kb_speed;
		
		//hurt time
		hurt_time++;
		if(hurt_time > 4 || tile_hor_coll(kb_x * kb_speed))
		{
			state_set(st.angry);
			
			//face the player
			hsp = abs(hsp) * sign(oPlayer.x - x);
			
			hurt_time = 0;
		}
	break;
	
	case st.angry:
		sprite_index = sBossAngry;
		
		x += hsp * 2;
		
		//wall detection
		if(tile_hor_coll(hsp))
		{
			state_set(st.normal);
		}
		
		//ledge detection
		if(!tilemap_get_at_pixel(global.tilemap, x + hsp, y + 100))
		{
			state_set(st.normal);
		}
	break;
	
	case st.dead:
		sprite_index = sBossDead;
		if(floor(image_index) == image_number - 1)
		{
			//item
			if(irandom(1) == 0)
			{
				var _type = irandom(item_num - 1);
				var _inst = instance_create_layer(x, y, "Items", oItems);
				
				_inst.item_type = _type;
				_inst.hsp = sign(x - oPlayer.x);
				
			}
			
			//unlock stage
			oLock.image_speed = 1;
			
			instance_destroy();

		}
	break;
}