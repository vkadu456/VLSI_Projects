module vending_machine_tb;

	// Inputs
	reg clk;
	reg reset;
	reg cancel;
	reg [1:0] coin;
	reg [1:0] sel;

	// Outputs
	wire PrA;
	wire PrB;
	wire PrC;
	wire change;

	// Instantiate the Unit Under Test (UUT)
	vending_machine uut (
		.clk(clk), 
		.reset(reset), 
		.cancel(cancel), 
		.coin(coin), 
		.sel(sel), 
		.PrA(PrA), 
		.PrB(PrB), 
		.PrC(PrC), 
		.change(change)
	);
	
	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		cancel = 0;
		coin = 2'b00;
		sel = 2'b00;
		
		#20 reset = 0;
		
		#10 coin = 2'b01;
		#10 sel  = 2'b00;
		#10 coin = 2'b00;
		#20;
		
		
		#10 coin = 2'b10;
		#10 sel = 2'b01;
		#20;
		
		
		#10 coin = 2'b01;
		#10 coin = 2'b01;
		#10 sel = 2'b00;
		#20;
		
		#10 coin = 2'b10;
		#10 coin = 2'b10;
		#10 sel = 2'b10;
		#20;
		
		#10 coin = 2'b10;
		#10 cancel = 1;
		#10 cancel = 0;
		#20;

		// Wait 100 ns for global reset to finish
		#50 $finish;
	end
	
	initial begin
		$monitor("Time = %d, Coin = %b, Sel = %b, Cancel = %b, PrA = %b, PrB = %b, PrC = %b, change = %b",$time, coin, sel, cancel, PrA, PrB, PrC, change);
        
				end
      
endmodule
