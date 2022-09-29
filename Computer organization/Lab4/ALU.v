module ALU( aluSrc1, aluSrc2, ALU_operation_i, result, zero );
//same as Lab2 done

//I/O ports 
input	[15:0]  aluSrc1;
input	[15:0]  aluSrc2;
input	[4-1:0] ALU_operation_i;

output	[15:0]  result;
output		      zero;

//Internal Signals
wire		        zero;
reg     [16-1:0]result;

//Main function
/*your code here*/

assign zero = (result == 0);

always@(ALU_operation_i, aluSrc1, aluSrc2)begin
	case(ALU_operation_i)
		4'b0000: result <= aluSrc1 & aluSrc2;
		4'b0001: result <= aluSrc1 | aluSrc2;
		4'b0010: result <= {aluSrc1 + aluSrc2};
		4'b0110: result <= {aluSrc1 - aluSrc2};
		4'b0111: result <= ({aluSrc1 - aluSrc2} < 0) ? 0 : 1;
		4'b1100: result <= ~(aluSrc1 | aluSrc2);
		default: result <= 0;
	endcase
end
endmodule