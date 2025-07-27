/********************************************************************************************
Filename    :	   half_adder.v   
Description :      Half adder Design
Author Name :      Vedant Kadu
Version     :      1.0
*********************************************************************************************/
  
module half_adder(input a,b,
	          output sum,carry);
				 
   //Understand the Data-flow abstraction
   assign sum   = a ^ b;
   assign carry = a & b;

endmodule
	
	
	
	

	
	
