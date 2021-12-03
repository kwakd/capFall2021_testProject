/// @description Insert description here
// You can write your code in this editor

if(global.pause) exit;

switch(state)
{
	case st.normal:
		//mask
		mask_index = sPlayerMask;
	
		//input
		hsp = (keyboard_check(ord("D")) || keyboard_check(vk_right)) - (keyboard_check(ord("A")) || keyboard_check(vk_left));
		hsp *= move_speed;
		
		var jump = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
		
		var duck = keyboard_check(ord("S")) || keyboard_check(vk_down);
		
		//jump
		if(jump && tile_ver_coll(1)) 
		{
			vsp = -jump_speed;
			audio_play_sound(snd_jump, 10, false);
		}
		
		//duck
		if(duck && tile_ver_coll(1))
		{
			vsp += 10;	
		}
		
		//gravity
		if (vsp < 10) 
		{
			vsp += grav;
		}
		
		//movement
		if(tile_hor_coll(hsp))
		{
			while(!tile_hor_coll(sign(hsp)))
			{
				x += sign(hsp);
			}
			hsp = 0;
		}
		
		if(tile_ver_coll(vsp))
		{
			while(!tile_ver_coll(sign(vsp)))
			{
				y += sign(vsp);
			}
			vsp = 0;
		}
		
		x += hsp;
		y += vsp;
		
		//animation
		if(!tile_ver_coll(1))
		{
			if (vsp < 0) 
			{
				sprite_index = sPlayerJump;
			}
			else 
			{
				sprite_index = sPlayerFall;
			}
		}
		else if (hsp!= 0)
		{
			sprite_index = sPlayerRun;
			image_xscale = sign(hsp);
		}
		else if (duck)
		{
			sprite_index = sPlayerDuck;	
		}
		else
		{
			sprite_index = sPlayerIdle;
		}
		
		//attack
		if(keyboard_check_pressed(attack_key))
		{
			state_set(st.attack);
		}
		
		//hurt enemy
		var enemy_col = instance_place(x,y, oEnemy);
		if(enemy_col != noone)
		{
			kb_x = sign(x - enemy_col.x);
			image_xscale = -kb_x;
			if(image_xscale == 0) image_xscale = 1;
			lives--;
			state_set(st.hurt);
		}
		
		//hurt boss
		var boss_col = instance_place(x,y, oBoss);
		if(boss_col != noone)
		{
			kb_x = sign(x - boss_col.x);
			image_xscale = -kb_x;
			if(image_xscale == 0) image_xscale = 1;
			lives--;
			state_set(st.hurt);
		}
		
		//dead
		if(lives <= 0 || y > room_height)
		{
			state_set(st.dead);
		}
		
	break;
	
	case st.attack:
		//movement
		if(tile_hor_coll(hsp))
		{
			while(!tile_hor_coll(sign(hsp)))
			{
				x += sign(hsp);
			}
			hsp = 0;
		}
		
		if(tile_ver_coll(vsp))
		{
			while(!tile_ver_coll(sign(vsp)))
			{
				y += sign(vsp);
				vsp += grav;
			}
			vsp = 0;
		}
		
		x += hsp;
		y += vsp;
		
	//sprite/mask
		sprite_index = sPlayerAttack;
		mask_index = sPlayerMaskAttack;
		
		//to normal
		if(floor(image_index) == image_number - 1)
		{
			state_set(st.normal);
		}
		

	break;
	
	case st.hurt:
		//sprite
		sprite_index = sPlayerHurt;
		
		x += kb_x * kb_speed;
		
		//hurt time
		hurt_time++;
		if(hurt_time > 4 || tile_hor_coll(kb_x * kb_speed))
		{
			state_set(st.normal);
			hurt_time = 0;
		}
	break;
	
	case st.dead:
		sprite_index = sPlayerDead;
		if(floor(image_index) == image_number - 1)
		{
			image_speed = 0;
			hurt_time++;
			if(hurt_time > 10)
			{
				lives = 3;
				room_restart();
			}
		}
	break;
	
}