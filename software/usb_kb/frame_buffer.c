#include "frame_buffer.h"
#include <stdio.h>

//void buffer_init() {
//	*ws_base = 0x0000;
//	*output_base = 0x00FFFFFF;
//	for (int i = 0; i < SCREEN_HEIGHT; i++)
//		for (int j =0; j < SCREEN_WIDTH; j++) {
//			buffer[i*SCREEN_WIDTH + j] = bg_data[i][j];
//		}
//	write_to_ocm();
//}

void write_to_ocm(unsigned char* buffer) {
	*ws_base = 0x0001;
	for (int i = 0; i < SCREEN_HEIGHT; i++)
		for (int j = 0; j < SCREEN_WIDTH; j++){
			unsigned int address = (i*SCREEN_WIDTH + j)&0x00FFFFFF;
			unsigned int data = buffer[i*SCREEN_WIDTH + j];
			//printf("%d: %2x\n", address, data);
			data = (data<<24) + address;
			//while ((*input_base)!=0);
			//printf("%2x", *input_base);
			*output_base = data;

			//while ((*input_base)!=1) {}

			*output_base = 0x00FFFFFF;
		}
	*ws_base = 0x0000;
}

//void buffer_refresh() {
//	*ws_base = 0x0000;
//	*output_base = 0x00FFFFFF;
//	for (int i = SCREEN_HEIGHT; i < SCREEN_HEIGHT*2; i++)
//		for (int j =0; j < SCREEN_WIDTH; j++) {
//			buffer[(i-SCREEN_HEIGHT)*SCREEN_WIDTH+j] = bg_data[i][j];
//		}
//	write_to_ocm();
//}