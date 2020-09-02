module  getColor ( input         Clk,                // 50 MHz clock
                             Reset,              // Active-high reset signal
                             frame_clk,          // The clock indicating a new frame (~60Hz)
               input [9:0]   DrawX, DrawY,       // Current pixel coordinates
//					input [7:0]   keycode,            // keycode
//					output [3:0]  LEDG,
               output logic[7:0]  color_index             // Whether current pixel belongs to ball or background
              );

//    parameter [9:0] X_Center = 10'd320;  // Center position on the X axis
//    parameter [9:0] Y_Center = 10'd240;  // Center position on the Y axis
    parameter [9:0] X_Min = 10'd0;       // Leftmost point on the X axis
    parameter [9:0] X_Max = 10'd639;     // Rightmost point on the X axis
    parameter [9:0] Y_Min = 10'd0;       // Topmost point on the Y axis
    parameter [9:0] Y_Max = 10'd479;     // Bottommost point on the Y axis

	 logic [18:0] ADDR;
	 logic [7:0] color_index;
	 assign ADDR = (DrawY/2)*(X_Max-X_Min+1)/2+(DrawX/2);
	 bgRAM readmem(.data_In(0), .write_address(0), .read_address(ADDR), .we(0), .Clk,
							.data_Out(color_index));
	 						
				  
endmodule

    