module pic_read( input [23:0] ADDR,
					  input Clk,
					  input Reset,
					  output [7:0] color_index,
					  output WR);

enum logic[3:0] {
	Wait,
	Start_Read,
	Done
}READ_STATE, NEXT_STATE;
				
frameRAM readmem(.data_In(0), .write_address(0), .read_address(ADDR[18:0]), .we(0), .Clk,
					.data_Out(color_index));

always_ff @(posedge Clk)
begin
	if (Reset)
	begin
		READ_STATE <= Wait;
	end
	else
	begin
		READ_STATE = NEXT_STATE;
	end
end
		
always_comb
begin
	NEXT_STATE = READ_STATE;
	unique case (READ_STATE)
		Wait:
		begin
			if (ADDR[23:0] == 24'hFFFFFF)
			begin
				NEXT_STATE = Wait;
			end
			else NEXT_STATE = Start_Read;
		end
		Start_Read: NEXT_STATE = Done;
		Done:
		begin
			if (ADDR[23:0] == 24'hFFFFFF) NEXT_STATE = Wait;
		end
	endcase
	
	WR = 1'b0;
	if (READ_STATE == Done) WR = 1'b1;
end
		
endmodule
