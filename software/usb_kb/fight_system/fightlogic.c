#include <stdio.h>
#include "fightlogic.h"
#include "bullet.h"
#include "usb.h"
#include <unistd.h>  // usleep



void getkeycode(unsigned char* keycode){
	int pressed_up, pressed_left, pressed_down, pressed_right, vparm = 0;
	short keycode1 = UsbRead(0x051e);
	usleep(200);
	short keycode2 = UsbRead(0x0520);
	keycode[0] = keycode1 & 0x00FF;
	keycode[1] = keycode1 & 0xFF00;
	keycode[2] = keycode2 & 0x00FF;
	keycode[3] = keycode2 & 0xFF00;
	for (int i = 0; i <= 3; i++){
		switch(keycode[i]){
			case 0x1A:			// w
				pressed_up = 1;
				player.Xmotion = 2;
				break;
			case 0x04:			// a
				pressed_left = 1;
				player.Ymotion = 2;
				break;
			case 0x16:			// s
				pressed_down = 1;
				player.Xmotion = -2;
				break;
			case 0x07:			// d
				pressed_right = 1;
				player.Ymotion = -2;
				break;
			case 0x:			// j, shoot switch
				player.bulletSwitch = 1;
				break;
			case 0x:			// k, skill
				break;
			case 0x:			// j, slow speed
				vparm = 0.5;	// speed parameter
				break;
		}
	}
	player.Xmotion *= vparm;
	player.Ymotion *= vparm;
}

void collision(){

}

void shootbullet(){
	if(player.bulletSwitch == 1){
		struct PlayerBullet bullet;
		ebulletcreate(&bullet);
		bullet.x = player.x + 1;
		bullet.y = player.y + 1;

	}
}

