#include <stdio.h>
#include <string.h>
#include "player.h"


void playercreate(struct Player *pobj){
	pobj->x = 0;
	pobj->y = 0;
	pobj->Xmotion = 0;
	pobj->Ymotion = 0;
	pobj->lifetime = 0;
	pobj->bulletSwitch = 0;
	pobj->bulletType = 0;
	//pobj->bulletSpeed = 5;
	pobj->actionFrame = 0;
	pobj->collideSize = 5;
	pobj->HP = 20;
}

void pnext(){
	player.lifetime++;
	player.x += player.Xmotion;
	player.y += player.Ymotion;

};




