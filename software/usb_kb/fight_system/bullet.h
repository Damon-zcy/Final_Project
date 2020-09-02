#ifndef BULLET_H_
#define BULLET_H_

#include <stdio.h>

struct EnemyBullet{
	int x;						// location
	int y;
	int Xmotion;				// x axis speed
	int Ymotion;				// y axis speed
	int lifetime;				// lifetime of the enemy bullet
	int index;					// enemy index in enemy bullet array
	unsigned char enemyBulletType;
	int actionFrame;			// action frame, number means different animation
	unsigned char actionLogicIndex;
	int collideSize;
};


struct EnemyBulletType{
	unsigned char pic;
	unsigned char actionLogic;	// action logic of different types of enemy bullet
	unsigned char ATK;			// bullet attack
};

struct PlayerBullet{
	int x;						// location
	int y;
	int Xmotion;				// x axis speed
	int Ymotion;				// y axis speed
	int lifetime;				// lifetime of the enemy bullet
	int index;					// enemy index in enemy bullet array
	unsigned char playerBulletType;
	int actionFrame;			// action frame, number means different animation
	unsigned char actionLogicIndex;
	int collideSize;

//	PlayerBullet(){
//		this->x = 0;
//		this->y = 0;
//	}
};

struct PlayerBulletType{
	unsigned char pic;
	unsigned char actionLogic;	// action logic of different types of enemy bullet
	unsigned char ATK;			// bullet attack
};

//static struct PlayerBulletType pb_type = {.pic='1', .actionLogic='2', '3'};

unsigned getpbulletindex();
unsigned getebulletindex();
void pbulletcreate();
void ebulletcreate();

#endif
