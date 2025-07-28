/********************************************************************************************
Filename    :	   D_using_T.v   
Description :      D Flip Flop using T Flip Flop
Author Name :      Vedant Kadu
Version     : 	   1.0
*********************************************************************************************/
module T_FF(
    input wire T,
    input wire clk,
    input wire rst,
    output reg Q
    );
	 
	 always @(posedge clk or posedge rst)
		begin
			if(rst)
				Q<=0;			//Reset Output
			else if(T)
				Q<=~Q;		//Toggle Output
			else
				Q<=Q;			//Hold state
		end
endmodule

//D Flip_Flop using T Flip_Flop
module D_using_T(
	input wire D,
	input wire clk,
	input wire rst,
	output wire Q
	);
	wire T;
	wire q_internal;
	
	assign T = D ^ q_internal;
	
	T_FF tff_inst (				// Instantiate T Flip Flop
			.T(T),
			.clk(clk),
			.rst(rst),
			.Q(q_internal)
			);
			
	assign Q = q_internal; // Output Connection
endmodule 
