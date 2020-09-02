/************************************************************************
Avalon-MM Interface for AES Decryption IP Core

Dong Kai Wang, Fall 2017

For use with ECE 385 Experiment 9
University of Illinois ECE Department

Register Map:

 0-3 : 4x 32bit AES Key
 4-7 : 4x 32bit AES Encrypted Message
 8-11: 4x 32bit AES Decrypted Message
   12: Not Used
	13: Not Used
   14: 32bit Start Register
   15: 32bit Done Register

************************************************************************/

module avalon_aes_interface (
	// Avalon Clock Input
	input logic CLK,
	
	// Avalon Reset Input
	input logic RESET,
	
	// Avalon-MM Slave Signals
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,						// Avalon-MM Chip Select
	input  logic AVL_BYTE_EN,		// Avalon-MM Byte Enable
	input  logic [2:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [7:0] AVL_WRITEDATA,	// Avalon-MM Write Data
	output logic [7:0] AVL_READDATA,	// Avalon-MM Read Data
	
	// Exported Conduit
	output logic [7:0] EXPORT_DATA		// Exported Conduit Signal to LEDs
);

logic [7:0] mem[0:7];


always_ff @ (posedge CLK) begin
	if (AVL_WRITE)
		mem[AVL_ADDR] <= AVL_WRITEDATA;
	if (AVL_READ) 
		AVL_READDATA<= mem[AVL_ADDR];
	EXPORT_DATA <= mem;	
end

endmodule
