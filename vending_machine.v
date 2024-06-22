`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:54:03 06/21/2024 
// Design Name: 
// Module Name:    vending_machine 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module vending_machine(
    input clk,
    input rst,
    input [1:0]in,
    output reg out,
	 output reg [1:0]change // 01 5rs change and 10 10rs change
    );
parameter s0=2'b00;   // reset state
parameter s1=2'b01;  // 5Rs state
parameter s2=2'b10;   // 10 rs state

reg [1:0]c_state,n_state;

always @(posedge clk)
begin
if (rst==1)
begin
c_state=0;
n_state=0;
end
else
begin
c_state=n_state;
	case(c_state)
	s0:if(in==2'b00)  //reset state
		begin
		n_state=s0;
		out=0;
		change=2'b00;
		end
		else if(in==2'b01)  //input 5rs
		begin
		n_state=s1;
		out=0;
		change=2'b00;
		end
		else if(in==2'b10)  //input 10rs
		begin
		n_state=s2;
		out=0;
		change=2'b00;
		end
	s1:if(in==2'b00)  // 5rs state
		begin
		n_state=s0;
		out=0;
		change=2'b01; // 5rs change
		end
		else if(in==2'b01)  //input 5rs
		begin
		n_state=s2;
		out=0;
		change=2'b00;
		end
		else if(in==2'b10)  //input 10rs
		begin
		n_state=s0;
		out=1;
		change=2'b00;
		end
	s2:if(in==2'b00)   //10rs state
		begin
		n_state=s0;
		out=0;
		change=2'b10; // 10rs change
		end
		else if(in==2'b01)  //input 5rs
		begin
		n_state=s0;
		out=1;
		change=2'b00;
		end
		else if(in==2'b10)  //input 10rs
		begin
		n_state=s0;
		out=1;
		change=2'b01; //5rs change
		end
		endcase
end


end

endmodule
