#include "sram.h"
#include "pics.h"
#include <stdio.h>

void sram_read(unsigned char* buffer, int addr_start, int len) {

	for (int i = 0; i < len; i++)
		buffer[i] = *(sram_base+addr_start+i);
}
