/********************************************************************************************
Filename    :	     D_Latch.v   
Description :      D Latch Code
Author Name :      Vedant Kadu
Version     : 	   1.0
*********************************************************************************************/
module D_Latch(enable,D,Q);
    input wire enable, D;
    output reg Q;
    
	 always @ (enable, D)
	 begin
	 if (enable == 1)   
		Q<= D;
	 else
	   Q <= Q;
	 end
endmodule
