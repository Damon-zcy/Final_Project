module ADDR_Controller (
   input [9:0]   DrawX, DrawY,       // Current pixel coordinates
   output logic[18:0]  ADDR 
);

//    parameter [9:0] X_Center = 10'd320;  // Center position on the X axis
//    parameter [9:0] Y_Center = 10'd240;  // Center position on the Y axis
    parameter [9:0] X_Min = 10'd0;       // Leftmost point on the X axis
    parameter [9:0] X_Max = 10'd639;     // Rightmost point on the X axis
    parameter [9:0] Y_Min = 10'd0;       // Topmost point on the Y axis
    parameter [9:0] Y_Max = 10'd479;     // Bottommost point on the Y axis

	 assign ADDR = (DrawY/2)*(X_Max-X_Min+1)/2+(DrawX/2);
	 
endmodule