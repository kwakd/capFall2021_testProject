/// @description Insert description here
// You can write your code in this editor
randomize();

//inventory
global.inv = ds_list_create();

//pause
global.pause = false;

//items
enum item{
	mushroom,
	waffle
}

//numbers
globalvar item_num;
item_num = 2;

//sprites
globalvar item_spr;
//item_spr[item.diamond] = sDiamond;
item_spr[item.mushroom] = sMush;
item_spr[item.waffle] = sWaf;

fade_surf = -1;
fade_alpha = 0;

lives = 3;
globalvar coins;
coins = 0;

