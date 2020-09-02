#ifndef PLAYER_H_
#define PLAYER_H_

#define ENEMY_BULLET_NUMBER 1000
#define PLAYER_BULLET_NUMBER 1000
#define ENEMY_NUMBER 50

struct Player{
	int x;						// location
	int y;
	int Xmotion;				// x axis speed
	int Ymotion;				// y axis speed
	int lifetime;				// lifetime of the player
	unsigned char bulletSwitch;	// bullet on for 1, 0 for not
	int bulletType;
	//int bulletSpeed;
	int actionFrame;			// action frame, number means different animation
	int collideSize;
	unsigned char HP;
}player;

void playercreate();
void pnext();


#endif