`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:31:31 06/21/2024
// Design Name:   vending_machine
// Module Name:   /home/ise/projects_practise/vending_machine_tb.v
// Project Name:  projects_practise
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vending_machine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vending_machine_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [1:0] in;

	// Outputs
	wire out;
	wire [1:0] change;

	// Instantiate the Unit Under Test (UUT)
	vending_machine uut (
		.clk(clk), 
		.rst(rst), 
		.in(in), 
		.out(out), 
		.change(change)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		#6 rst=0;
		in = 1; // 5rs
		#19 in=1; // 5rs   
		#19 in=2;  //10rs
		
		#19 in=1;
		#19 in=1;
		
		#19 in=2;
		
		#19 in=2;
		#19 in=1;
		

	end
	always #5 clk=~clk;
	endmodule

