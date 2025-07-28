/********************************************************************************************
Filename    :	     D_using_T.v   
Description :      Testbench code for D Flip Flop using T Flip Flop
Author Name :      Vedant Kadu
Version     : 	   1.0
*********************************************************************************************/
module D_using_T_tb;

	// Inputs
	reg D;
	reg clk;
	reg rst;

	// Outputs
	wire Q;

	D_using_T dut (
		.D(D), 
		.clk(clk), 
		.rst(rst), 
		.Q(Q)
	);

	initial begin
		
		clk = 0;
		forever #5 clk=~clk;
		end
		
		initial begin
		$monitor("Time=%0t, D=%b, Q=%b",$time, D, Q);
		
		rst = 1; D =0; #10;
		rst = 0;
		
		D = 0; #10;
		D = 1; #10;
		D = 0; #10;
		D = 1; #10;
		D = 1; #10;
		D = 0; #10;

		end
endmodule 
