module FSM_hw1(w, z, reset, clk);


	input w, reset,clk;
	output reg z; 

	localparam A=0, B=1, C=2, D=4, E=5, F=6, G=7;
	reg [2:0] state,next; 
	
	always @(posedge clk) begin
	 if (reset) begin
	 state <= A; // Initial state
	 end else begin
	 state <= next;
	 end
	end 
	
	always @(*) begin
		next <= state;
		 z <= 0; 
		 case (state)
			 A : if (w) next <= C;
			 else next <= B;
			 B : if (w) next <= D;
			 C : if (~w) next <= E;
			 D : begin
			 z <= 0;
			 if (w) next <= C;
			 else next <= E;
			 end
			 E : begin
			 z <= 1;
			 if (w) next <= D;
			 else next <= B;
			 end
			 F : begin
				z <= 1;
				if (w) next <= D;
				else next <= B;
			 end
			 
			 G : begin
				 z <= 1;
				 if (w) next <= D;
				 else next <= B;
				end
			 

			 default:
				z <= 0;
			endcase
	 end
	 

endmodule 