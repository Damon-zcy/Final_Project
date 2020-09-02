module BufferIO(
	input [23:0] ADDR,
	input Clk, Reset, WS,
	output WE, 
	output [7:0] WDone,
	output [18:0] write_address
);

enum logic[3:0] {
	Wait,
	Start_Write,
	Done
}WRITE_STATE, NEXT_STATE;

always_ff @(posedge Clk)
begin
	if (Reset)
	begin
		WRITE_STATE <= Wait;
	end
	else
	begin
		WRITE_STATE = NEXT_STATE;
	end
end

always_comb
begin
	NEXT_STATE = WRITE_STATE;
	unique case (WRITE_STATE)
		Wait:
		begin
			NEXT_STATE = Wait;
			if (WS && ADDR[23:0]!=24'hFFFFFF)
			begin
				NEXT_STATE = Start_Write;
			end
		end
		Start_Write: NEXT_STATE = Done;
		Done:
		begin
			if (ADDR[23:0] == 24'hFFFFFF) NEXT_STATE = Wait;
		end
	endcase
	
	WDone = 8'b0;
	write_address = 0;
	WE = 0;
	case (WRITE_STATE)
		Start_Write:
		begin
			WE = 1;
			write_address = ADDR[18:0];
		end
		Done:
		begin
			WDone = 8'b00000001;
		end
		default: ;
	endcase
end

endmodule
