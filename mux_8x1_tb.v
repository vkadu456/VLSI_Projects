/********************************************************************************************
Filename    :	     mux_8x1_tb.v   
Description :      Testbench code for 8:1 mux using 4:1 mux and 2:1 mux
Author Name :      Vedant Kadu
Version     : 	   1.0
*********************************************************************************************/
module mux_8x1_tb;

	// Inputs
	reg [7:0] i;
	reg [2:0] s;

	// Outputs
	wire y;

	mux_8x1 DUT(i,s,y);
	
	initial 
		begin
			repeat(8)
				begin
				{s,i}=$random;
				#1;
				$display("i=%b, s=%b, y=%b",i,s,y);
				end
		end
endmodule
