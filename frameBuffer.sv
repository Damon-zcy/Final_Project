module frameBuffer(
	input [7:0] data_in,
	input [18:0] write_address, read_address,
	input logic WE, Clk, RE,
	output logic [7:0] data_out
);

logic [7:0] mem[0:76799];


always_ff @ (posedge Clk) begin
	if (WE)
		mem[write_address] <= data_in;
	data_out<= mem[read_address];
	
end

endmodule
