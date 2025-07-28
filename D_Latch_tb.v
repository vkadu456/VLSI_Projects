/********************************************************************************************
Filename    :	     D_Latch_tb.v   
Description :      Testbench Code for D Latch 
Author Name :      Vedant Kadu
Version     : 	   1.0
*********************************************************************************************/
module D_Latch_tb;

	// Inputs
	reg enable;
	reg D;

	// Outputs
	wire Q;

	
	D_Latch DUT (
		.enable(enable), 
		.D(D), 
		.Q(Q)
	);

	initial begin
		// Initialize Inputs
		enable = 1;
		D = 0;
		#5
		$display("enable=%d,D=%d,Q=%d",enable,D,Q);
		enable = 1;
		D = 1;
		#5
		$display("enable=%d,D=%d,Q=%d",enable,D,Q);	
		enable = 0;
		D = 0;
		#5
		$display("enable=%d,D=%d,Q=%d",enable,D,Q);
		enable = 0;
		D = 1;
		#5
		$display("enable=%d,D=%d,Q=%d",enable,D,Q);
		enable = 1;
		D = 0;
		#5
		$display("enable=%d,D=%d,Q=%d",enable,D,Q);
		enable = 0;
		D = 1;
		#5
		$display("enable=%d,D=%d,Q=%d",enable,D,Q);
	end
      
endmodule
