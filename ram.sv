/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  bgRAM
(
		input [7:0] data_In,
		input [18:0] write_address, read_address,
		input we, Clk,

		output logic [7:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [7:0] mem [0:19199];

initial
begin
	 $readmemh("zcy.txt", mem);
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address][7:0];
end

endmodule





/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  player0RAM
(
		input [7:0] data_In,
		input [18:0] write_address, read_address,
		input we, Clk,

		output logic [7:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [7:0] mem [0:1619];

initial
begin
	 $readmemh("reimu_0.txt", mem);
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out <= 8'h0a;
	if (read_address < 1620) data_Out<= mem[read_address][7:0];
end

endmodule

