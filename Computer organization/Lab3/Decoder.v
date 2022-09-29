module Decoder( instr_op_i, RegWrite_o,	ALUOp_o, ALUSrc_o, RegDst_o, Branch_o, BranchType_o, MemToReg_o, MemRead_o, MemWrite_o, Jump_o );
//Main control done

//I/O ports
input	[3-1:0] instr_op_i;     // opcode

output			RegWrite_o;     // for register
output	[2-1:0] ALUOp_o;        // for ALU control
output			ALUSrc_o;       // for MUX before ALU
output	        RegDst_o;       // for MUX before register
output			Branch_o;       // for branch
output			BranchType_o;   // for MUX before branch
output			MemToReg_o;     // for MUX after memory
output			MemRead_o;      // for memory
output			MemWrite_o;     // for memory
output			Jump_o;         // for MUX of jump

//Internal Signals
wire			RegWrite_o;
wire	[2-1:0] ALUOp_o;
wire			ALUSrc_o;
wire	        RegDst_o;
wire			Branch_o;
wire			BranchType_o;
wire			MemToReg_o;
wire			MemRead_o;
wire			MemWrite_o; 
wire			Jump_o;

// register
assign RegDst_o   = (~instr_op_i[1]) & (~instr_op_i[0]);
assign RegWrite_o = (~instr_op_i[2]);

// memory
assign MemToReg_o = (instr_op_i[1]) & (instr_op_i[0]);
assign MemWrite_o = (instr_op_i[2]) & (~instr_op_i[1]) & (~instr_op_i[0]);
assign MemRead_o  = (~instr_op_i[2]) & (instr_op_i[1]) & (instr_op_i[0]);

// ALU
assign ALUOp_o[1] = (~instr_op_i[2]) & (~instr_op_i[0]);
assign ALUOp_o[0] = ((instr_op_i[1]) & (~instr_op_i[0])) | ((instr_op_i[2]) & (instr_op_i[0]));
assign ALUSrc_o   = ((~instr_op_i[2]) & (instr_op_i[0])) | ((instr_op_i[2]) & (~instr_op_i[1]) & (~instr_op_i[0]));

// branch
assign Branch_o   = ((instr_op_i[2]) & (~instr_op_i[1]) & (instr_op_i[0])) | ((instr_op_i[2]) & (instr_op_i[1]) & (~instr_op_i[0]));
assign BranchType_o = (~instr_op_i[0]);

// jump
assign Jump_o     = (instr_op_i[2]) & (instr_op_i[1]) & (instr_op_i[0]);

endmodule
