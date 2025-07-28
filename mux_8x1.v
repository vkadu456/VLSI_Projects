/********************************************************************************************
Filename    :	   mux_8x1.v   
Description :      8:1 mux using 4:1 mux and 2:1 mux
Author Name :      Vedant Kadu
Version     : 	   1.0
*********************************************************************************************/
module mux_8x1(
    input [7:0] i,
    input [2:0] s,
    output y
    );
	 wire y1,y2;
	 mux_4x1 m1(i[3:0],s[1:0],y1);
	 mux_4x1 m2(i[7:4],s[1:0],y2);
	 mux_2x1 m3(y1,y2,s[2],y);
endmodule

module mux_4x1(
		input [3:0]i,
		input [1:0]s,
		output reg y);
		always@(*)
			begin
				case(s)
					2'b00: y=i[0];
					2'b01: y=i[1];
					2'b10: y=i[2];
					2'b11: y=i[3];
				endcase
			end
endmodule

module mux_2x1(
		input i0,i1,
		input s,
		output y);
		assign y=s?i1:i0;
endmodule
