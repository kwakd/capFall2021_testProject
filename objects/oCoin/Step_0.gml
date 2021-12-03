/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x, y, oPlayer) && !collected)
{
	oPlayer.coins++;
	image_index = 0;
	collected = true;
	
	audio_play_sound(snd_coin, 10, false);
}

//collected
if(collected)
{
	if(floor(image_index) >= image_number - 1)
	{
		instance_destroy();	
	}
}