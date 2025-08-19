module vending_machine(
    input clk,
    input reset,
    input cancel,
    input [1:0] coin, sel,
    output reg PrA, PrB, PrC, change
    );
	 
	 parameter S0 = 3'b000, S5 = 3'b001, S10 = 3'b010, S15 = 3'b011, S20 = 3'b100;
	 
	 reg [2:0] current_state, next_state;
	 
	 always @(posedge clk or posedge reset)
	 begin
		if (reset)
			current_state <= S0;
		else
			current_state <= next_state;
	end
	
	always @(*)
	begin
	case (current_state)
		S0: begin
			 if(coin == 2'b01) next_state = S5;
			 else if (coin == 2'b10) next_state = S10;
			 else next_state = S0;
		end
		
		S5: begin
			 if (coin == 2'b01) next_state = S10;
			 else if (coin == 2'b10) next_state = S15;
			 else if (cancel) next_state = S0;
			 else next_state = S5;
		end
		
		S10: begin
			  if(coin == 2'b01) next_state = S15;
			  else if (coin == 2'b10) next_state = S20;
			  else if (cancel) next_state = S0;
			  else next_state = S10;
		end
		
		S15: begin
			  if (coin == 2'b01) next_state = S20;
			  else if (cancel) next_state = S0;
			  else next_state = S15;
		end
		
		S20: begin
			  if (cancel) next_state = S0;
			  else next_state = S20;
		end
		
		default: next_state = S0;
		endcase
	end
	
	always @(posedge clk or posedge reset)
	begin
		if(reset) 
			begin
				PrA <= 0;
				PrB <= 0;
				PrC <= 0;
				change <= 0;
			end
		else
			begin
				PrA <= 0;
				PrB <= 0;
				PrC <= 0;
				change <= 0;
				
				case (current_state)
					S5: begin
						 if(sel == 2'b00)
							begin
								PrA <= 1;
								change <= 0;
							end
						 end
					
					S10: begin
						  if(sel == 2'b00)
							begin
								PrA <= 1;
								change <= 1;
							end
							
							else if (sel == 2'b01)
								begin
								PrB <= 1;
								change <= 0;
								end
							end
							
					S15: begin
							if(sel == 2'b01)
								begin
									PrB <= 1;
									change <= 1;
								end
							end
							
					S20: begin
							if(sel == 2'b00)
								begin
									PrA <= 1;
									change <= 1;
								end
							else if (sel == 2'b01)
								begin
									PrB <= 1;
									change <= 1;
								end
							else if (sel == 2'b10)
								begin
									PrC <= 1;
									change <= 0;
								end
						end
				endcase
				
				if(cancel)
					change <= 1;
			end
		end

endmodule
