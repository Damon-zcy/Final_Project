#include <stdio.h>
#include <string.h>
#include "bullet.h"

void pbulletcreate(struct PlayerBullet *pbobj){
	pbobj->x = 0;
	pbobj->y = 0;
	pbobj->Xmotion = 0;
	pbobj->Ymotion = 0;
	pbobj->lifetime = 0;
	pbobj->index = getpbulletindex;
	pbobj->playerBulletType = 0;
	pbobj->actionFrame = 0;
	pbobj->actionLogicIndex = 0;
	pbobj->collideSize = 2;
}

void ebulletcreate(struct EnemyBullet *ebobj){
	ebobj->x = 0;
	ebobj->y = 0;
	ebobj->Xmotion = 5;
	ebobj->Ymotion = 5;
	ebobj->lifetime = 0;
	ebobj->index = getebulletindex;
	ebobj->enemyBulletType = 0;
	ebobj->actionFrame = 0;
	ebobj->actionLogicIndex = 0;
	ebobj->collideSize = 2;
}


unsigned getpbulletindex(){

}

unsigned getebulletindex(){

}
