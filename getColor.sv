module  getBGColor ( input         Clk,                // 50 MHz clock
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
	 assign ADDR = (DrawY/4)*(X_Max-X_Min+1)/4+(DrawX/4);
	 bgRAM readmem(.data_In(0), .write_address(0), .read_address(ADDR), .we(0), .Clk,
							.data_Out(color_index));
	 						
				  
endmodule


module  getPlayerColor ( input         Clk,                // 50 MHz clock
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
    parameter [9:0] X_Max = 10'd29;     // Rightmost point on the X axis
    parameter [9:0] Y_Min = 10'd0;       // Topmost point on the Y axis
    parameter [9:0] Y_Max = 10'd53;     // Bottommost point on the Y axis

	 logic [18:0] ADDR;
	 parameter [9:0] StartX = 10'd0;
	 parameter [9:0] StartY = 10'd0;
	 
	 
	 always_comb
	 begin
		ADDR = (DrawY-StartY)*(X_Max-X_Min+1)+(DrawX-StartX);
		if (DrawY < Y_Min + StartY || DrawX < X_Min + StartX ||
			 DrawY > Y_Max + StartY || DrawX > X_Max + StartX) ADDR = 19'h7FFFF;
	 end
	 player0RAM readmem(.data_In(0), .write_address(0), .read_address(ADDR), .we(0), .Clk,
							.data_Out(color_index));
	 						
				  
endmodule

    
    