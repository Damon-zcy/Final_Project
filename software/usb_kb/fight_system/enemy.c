#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "enemy.h"

void enemycreate(struct Enemy *eobj){
	eobj->x = 0;
	eobj->y = 0;
	eobj->Xmotion = 0;
	eobj->Ymotion = 0;
	eobj->lifetime = 0;
	eobj->index =
	eobj->enemyType = 0;
	eobj->actionFrame = 0;
	eobj->actionLogicIndex = 0;
	eobj->collideSize = 5;
	eobj->HP = 5;
}

void enext(){

}

unsigned geteindex(){

}
