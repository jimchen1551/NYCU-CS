module ALU_Ctrl( funct_i, ALUOp_i, ALU_operation_o, FURslt_o);
//ALU control done

//I/O ports 
input      [4-1:0] funct_i;  // function field
input      [2-1:0] ALUOp_i;  // from Decoder.v

output     [4-1:0] ALU_operation_o;  
output     [2-1:0] FURslt_o;  // input of mux for ALU, Shifter, and Zero filled

//Internal Signals
wire		[4-1:0] ALU_operation_o;
wire		[2-1:0] FURslt_o;

//Main function
/*your code here*/
Mux2to1 #(.size(1)) m3(
    .data0_i(1'b0), 
    .data1_i(((funct_i[2]) & (~funct_i[1]) & (~funct_i[0])) | ((funct_i[2]) & (funct_i[1]) & (funct_i[0]))), 
    .select_i((ALUOp_i[1])&(~ALUOp_i[0])), 
    .data_o(ALU_operation_o[3]));
Mux2to1 #(.size(1)) m2(
    .data0_i(ALUOp_i[0]), 
    .data1_i(((~funct_i[1]) & (funct_i[0])) | ((funct_i[2]) & (~funct_i[1])) | ((funct_i[2]) & (funct_i[0]))), 
    .select_i((ALUOp_i[1])&(~ALUOp_i[0])), 
    .data_o(ALU_operation_o[2]));
Mux2to1 #(.size(1)) m1(
    .data0_i(1'b1), 
    .data1_i(((~funct_i[2]) & (~funct_i[1])) | ((~funct_i[1]) & (funct_i[0])) | ((funct_i[2]) & (funct_i[1]))), 
    .select_i((ALUOp_i[1])&(~ALUOp_i[0])), 
    .data_o(ALU_operation_o[1]));
Mux2to1 #(.size(1)) m0(
    .data0_i(1'b0), 
    .data1_i(((funct_i[1]) & (funct_i[0])) | ((funct_i[2]) & (funct_i[0])) | ((funct_i[2]) & (funct_i[1]))), 
    .select_i((ALUOp_i[1])&(~ALUOp_i[0])), 
    .data_o(ALU_operation_o[0]));

assign FURslt_o[1] = (ALUOp_i[1]) & (ALUOp_i[0]);
assign FURslt_o[0] = (ALUOp_i[1]) & (~ALUOp_i[0]) & (~funct_i[3]) & (funct_i[2]) & (funct_i[1]);

endmodule
