module FSM_hw1(w, z, reset, clk);


	input w, reset,clk;
	output reg z; 

	localparam A=0, B=1, C=2, D=3, E=4, F=5, G=6, H=7;
	reg [2:0] state,next; 
	
	always @(posedge clk) begin
	 if (reset) begin
	 state <= A; 
	 end else begin
	 state <= next;
	 end
	end 
	
	always @(*) begin
		next <= state;
		 z <= 0;  
		 case (state)
			 A : 
				 begin
				 z<=0;
				 if (w) next <= B;
				 else next <= A;
				 end
			 
			 B :
				 begin
				 z<=0;
				 if (w) next <= C;
				 else next <= D;
				 end
				 
			 C :
				 begin
				 z<=0;
				 if (w) next <= C;
				 else next <= E;
				 end
			
			 D :
				 begin
				 z<=0;
				 if (w) next <= G;
				 else next <= A;
				 end
				 
			 E :
				 begin
				 z<=0;
				 if (w) next <= F;
				 else next <= A;
				 end

			 F : begin
				z <= 1;
				if (w) next <= H;
				else next <= D;
			 end
			 
			 G : begin
				 z <= 0;
				 if (w) next <= H;
				 else next <= D;
				end
			 
			 H : begin
				 z <= 1;
				 if (w) next <= C;
				 else next <= E;
				end
			 

			 default:
				z <= 0;
			endcase
	 end
	 

endmodule 