#ifndef FRAME_BUFFER_H_
#define FRAME_BUFFER_H_

#include "pics.h"
#include "system.h"

#define SCREEN_WIDTH		640/2
#define SCREEN_HEIGHT		480/2

#define output_base			(volatile unsigned int*)  DATA_REQUEST_BASE
#define input_base			(volatile unsigned char*) WDONE_BASE
#define ws_base				(volatile unsigned char*) WRITE_SWITCH_BASE

//unsigned char buffer[SCREEN_WIDTH*SCREEN_HEIGHT];

//void buffer_init();

void write_to_ocm();

//void buffer_refresh();

#endif
