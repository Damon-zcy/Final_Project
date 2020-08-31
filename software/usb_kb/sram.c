#include "sram.h"
#include "pics.h"
#include <stdio.h>

void sram_init(void) {
	printf("Opening");
	printf("Read Start");
	int l = sizeof(bg_pic)/sizeof(bg_pic[0]);
	for (int i = 0; i < l; i++)
		*(sram_base+i) = bg_pic[i];
}
