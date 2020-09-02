#include "pics.h"
#include "sram.h"
#include <stdio.h>

unsigned char bg_data[BG_HEIGHT][BG_WIDTH];

void read_image(pic_name_t pic_type, unsigned char* buffer) {
	if (pic_type == BACKGROUND) {
		sram_read(buffer, BG_START_ADDR, BG_WIDTH*BG_HEIGHT);
	}
}

void image_init() {
	read_image(BACKGROUND, bg_data);
}
