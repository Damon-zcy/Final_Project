#ifndef PICS_H_
#define PICS_H_
#include "alt_types.h"

#define BG_WIDTH		640
#define BG_HEIGHT		480
#define BG_START_ADDR	0x000002

extern unsigned char bg_data[BG_HEIGHT][BG_WIDTH];

typedef enum PIC_NAME {
	BACKGROUND=0
} pic_name_t;

void read_image(pic_name_t pic_type, unsigned char* buffer);

void image_init();

#endif
