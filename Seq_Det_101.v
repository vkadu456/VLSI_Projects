module seq_det(din,
	       clock,
	       reset,
	       dout);
								 
   //Step1 : Declare the states as parameter "IDLE","STATE1","STATE2","STATE3"
   
   parameter IDLE = 2'b00,
	     STATE1 = 2'b01,
	     STATE2 = 2'b10,
	     STATE3 = 2'b11;

   //Step2 : Write down the ports direction
   input din,clock,reset;
   output dout;

	reg [1:0] present_state,
		  next_state;


   //Step3 : Write down the sequential logic for present state with active high asychronous reset
   always@(posedge clock)
	begin
	  if (reset)
		present_state <= IDLE;
	  else
		present_state <= next_state;
    	end
		
   //Understand the combinational logic for next state
   always@(present_state,din)
      begin
	 case(present_state)
	    IDLE   : 
                      if(din==1) 
		         next_state=STATE1;
	              else
	                 next_state=IDLE;
	    STATE1 : 
                      if(din==0)
	                 next_state=STATE2;
	              else
	                 next_state=STATE1;
	    STATE2 :
                      if(din==1)
	                 next_state=STATE3;
	              else 
	                 next_state=IDLE;
	    STATE3 : 
                      if(din==1)
	                 next_state=STATE1;
	              else 
	                 next_state=STATE2;
	    default: 
                      next_state=IDLE;
	 endcase
      end

   //Step4 : Write down the logic for Moore output det_o
   assign dout = (present_state == STATE3);

endmodule


