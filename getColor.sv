module  getColor ( input         Clk,                // 50 MHz clock
                             Reset,              // Active-high reset signal
                             frame_clk,          // The clock indicating a new frame (~60Hz)
               input [9:0]   DrawX, DrawY,       // Current pixel coordinates
//					input [7:0]   keycode,            // keycode
//					output [3:0]  LEDG,
               output logic[23:0]  color             // Whether current pixel belongs to ball or background
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
	 frameRAM readmem(.data_In(0), .write_address(0), .read_address(ADDR), .we(0), .Clk,
							.data_Out(color_index));
							
	 logic [23:0] palette[0:255];
	 assign palette =  '{24'h000000,24'h800000,24'h008000,24'h808000,24'h000080,
								24'h800080,24'h008080,24'hc0c0c0,24'h808080,24'hff0000,
								24'h00ff00,24'hffff00,24'h0000ff,24'hff00ff,24'h00ffff,
								24'hffffff,24'h000000,24'h00005f,24'h000087,24'h0000af,
								24'h0000d7,24'h0000ff,24'h005f00,24'h005f5f,24'h005f87,
								24'h005faf,24'h005fd7,24'h005fff,24'h008700,24'h00875f,
								24'h008787,24'h0087af,24'h0087d7,24'h0087ff,24'h00af00,
								24'h00af5f,24'h00af87,24'h00afaf,24'h00afd7,24'h00afff,
								24'h00d700,24'h00d75f,24'h00d787,24'h00d7af,24'h00d7d7,
								24'h00d7ff,24'h00ff00,24'h00ff5f,24'h00ff87,24'h00ffaf,
								24'h00ffd7,24'h00ffff,24'h5f0000,24'h5f005f,24'h5f0087,
								24'h5f00af,24'h5f00d7,24'h5f00ff,24'h5f5f00,24'h5f5f5f,
								24'h5f5f87,24'h5f5faf,24'h5f5fd7,24'h5f5fff,24'h5f8700,
								24'h5f875f,24'h5f8787,24'h5f87af,24'h5f87d7,24'h5f87ff,
								24'h5faf00,24'h5faf5f,24'h5faf87,24'h5fafaf,24'h5fafd7,
								24'h5fafff,24'h5fd700,24'h5fd75f,24'h5fd787,24'h5fd7af,
								24'h5fd7d7,24'h5fd7ff,24'h5fff00,24'h5fff5f,24'h5fff87,
								24'h5fffaf,24'h5fffd7,24'h5fffff,24'h870000,24'h87005f,
								24'h870087,24'h8700af,24'h8700d7,24'h8700ff,24'h875f00,
								24'h875f5f,24'h875f87,24'h875faf,24'h875fd7,24'h875fff,
								24'h878700,24'h87875f,24'h878787,24'h8787af,24'h8787d7,
								24'h8787ff,24'h87af00,24'h87af5f,24'h87af87,24'h87afaf,
								24'h87afd7,24'h87afff,24'h87d700,24'h87d75f,24'h87d787,
								24'h87d7af,24'h87d7d7,24'h87d7ff,24'h87ff00,24'h87ff5f,
								24'h87ff87,24'h87ffaf,24'h87ffd7,24'h87ffff,24'haf0000,
								24'haf005f,24'haf0087,24'haf00af,24'haf00d7,24'haf00ff,
								24'haf5f00,24'haf5f5f,24'haf5f87,24'haf5faf,24'haf5fd7,
								24'haf5fff,24'haf8700,24'haf875f,24'haf8787,24'haf87af,
								24'haf87d7,24'haf87ff,24'hafaf00,24'hafaf5f,24'hafaf87,
								24'hafafaf,24'hafafd7,24'hafafff,24'hafd700,24'hafd75f,
								24'hafd787,24'hafd7af,24'hafd7d7,24'hafd7ff,24'hafff00,
								24'hafff5f,24'hafff87,24'hafffaf,24'hafffd7,24'hafffff,
								24'hd70000,24'hd7005f,24'hd70087,24'hd700af,24'hd700d7,
								24'hd700ff,24'hd75f00,24'hd75f5f,24'hd75f87,24'hd75faf,
								24'hd75fd7,24'hd75fff,24'hd78700,24'hd7875f,24'hd78787,
								24'hd787af,24'hd787d7,24'hd787ff,24'hd7af00,24'hd7af5f,
								24'hd7af87,24'hd7afaf,24'hd7afd7,24'hd7afff,24'hd7d700,
								24'hd7d75f,24'hd7d787,24'hd7d7af,24'hd7d7d7,24'hd7d7ff,
								24'hd7ff00,24'hd7ff5f,24'hd7ff87,24'hd7ffaf,24'hd7ffd7,
								24'hd7ffff,24'hff0000,24'hff005f,24'hff0087,24'hff00af,
								24'hff00d7,24'hff00ff,24'hff5f00,24'hff5f5f,24'hff5f87,
								24'hff5faf,24'hff5fd7,24'hff5fff,24'hff8700,24'hff875f,
								24'hff8787,24'hff87af,24'hff87d7,24'hff87ff,24'hffaf00,
								24'hffaf5f,24'hffaf87,24'hffafaf,24'hffafd7,24'hffafff,
								24'hffd700,24'hffd75f,24'hffd787,24'hffd7af,24'hffd7d7,
								24'hffd7ff,24'hffff00,24'hffff5f,24'hffff87,24'hffffaf,
								24'hffffd7,24'hffffff,24'h080808,24'h121212,24'h1c1c1c,
								24'h262626,24'h303030,24'h3a3a3a,24'h444444,24'h4e4e4e,
								24'h585858,24'h626262,24'h6c6c6c,24'h767676,24'h808080,
								24'h8a8a8a,24'h949494,24'h9e9e9e,24'ha8a8a8,24'hb2b2b2,
								24'hbcbcbc,24'hc6c6c6,24'hd0d0d0,24'hdadada,24'he4e4e4,
								24'heeeeee};
	 assign color = palette[color_index];
				  
endmodule

    