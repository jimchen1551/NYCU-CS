`include "Program_Counter.v"
`include "Adder.v"
`include "Instr_Memory.v"
`include "Sign_Extend.v"
`include "Shifter.v"
`include "Zero_Filled.v"
`include "Decoder.v"
`include "ALU_Ctrl.v"
`include "ALU.v"
`include "Mux2to1.v"
`include "Reg_File.v"
`include "Mux3to1.v"
`include "Data_Memory.v"
`include "Concatenator.v"

`include "Pipe_Reg.v"
`include "Forwarding.v"
`include "Hazard_Detection.v"
module Pipeline_CPU(clk_i, rst_n);

//I/O port
input         clk_i;  // CPU clock input
input         rst_n;  // reset signal

//Internal Signles
/*************IF stage*************/
wire [16-1:0] IF_PC_in;             //done
wire [16-1:0] IF_PC_ReadAddress;    //done
wire [16-1:0] IF_PCadder1_sum;      //done
wire [16-1:0] IF_PC_BoP;            //done
wire [16-1:0] IF_Instruction;       //done
/**********************************/

/*************ID stage*************/
wire [16-1:0] ID_PCadder1_sum;      //done
wire [16-1:0] ID_Instruction;       //done
wire [16-1:0] ID_RSdata;            //done
wire [16-1:0] ID_RTdata;            //done
wire [16-1:0] ID_SignExtend;        //done
wire [16-1:0] ID_ZeroFilled;        //done
wire          ID_PC_Write;
wire          IF_ID_Write;
wire          ID_Flush;
wire          EX_Flush;
//Decoder
wire 	      ID_RegDst;            //done
wire 		  ID_RegWrite;          //done
wire  [2-1:0] ID_ALUOp;             //done
wire	      ID_ALUSrc;            //done
wire	      ID_Branch;            //done
wire		  ID_BranchType;        //done
wire		  ID_Jump;              //done
wire		  ID_MemRead;           //done
wire		  ID_MemWrite;          //done
wire		  ID_MemtoReg;          //done
/**********************************/

/*************EX stage*************/
wire [16-1:0] EX_PCadder1_sum;      //done
wire [16-1:0] EX_PCadder2_sum;      //done
wire [16-1:0] EX_Instruction;       //done
wire [16-1:0] EX_RSdata;            //done
wire [16-1:0] EX_RTdata;            //done
wire  [3-1:0] EX_RDaddr;            //done
wire [16-1:0] EX_SignExtend;        //done
wire [16-1:0] EX_ZeroFilled;        //done
wire [16-1:0] EX_SE_shiftleft1;     //done
wire [ 2-1:0] EX_Jump_complement;   //done
wire [14-1:0] EX_Jump_shiftleft1;   //done
wire [16-1:0] EX_PC_jump;           //done
wire    [1:0] Forward_A;            //done
wire    [1:0] Forward_B;            //done
wire [16-1:0] EX_Fwdata;            //done
//Decoder
wire 	      EX_RegDst;            //done
wire 		  EX_RegWrite;          //done
wire  [2-1:0] EX_ALUOp;             //done
wire	      EX_ALUSrc;            //done
wire	      EX_Branch;            //done
wire		  EX_BranchType;        //done
wire		  EX_Jump;              //done
wire		  EX_MemRead;           //done
wire		  EX_MemWrite;          //done
wire		  EX_MemtoReg;          //done
//AC
wire  [4-1:0] EX_ALU_operation;     //done
wire  [2-1:0] EX_FUResult_Select;   //done
wire [16-1:0] EX_FUResult;          //done
//ALU
wire [16-1:0] EX_ALU_src1;          //done
wire [16-1:0] EX_ALU_src2;          //done
wire [16-1:0] EX_ALU_result;        //done
//branch
wire          Zero;                 //done
wire          ZERO;                 //done
wire          EX_PCSrc;             //done
//shifter
wire [16-1:0] EX_Shifter_result;    //done
/**********************************/

/*************MEM stage*************/
wire [16-1:0] MEM_FUResult;         //done
wire [16-1:0] MEM_RTdata;           //done
wire  [3-1:0] MEM_RDaddr;           //done
//DM
wire [16-1:0] MEM_Readdata;         //done
//Decoder
wire          MEM_RegWrite;         //done
wire		  MEM_MemRead;          //done
wire		  MEM_MemWrite;         //done
wire		  MEM_MemtoReg;         //done
/**********************************/

/*************WB stage*************/
wire [16-1:0] WB_Readdata;          //done
wire [16-1:0] WB_FUResult;          //done
wire  [3-1:0] WB_RDaddr;            //done
wire [16-1:0] WB_RDdata;            //done
//Decoder
wire          WB_RegWrite;          //done
wire          WB_MemtoReg;          //done
/**********************************/

/*************IF stage*************/
//mux for branch done
Mux2to1 MFB(
    .data0_i(IF_PCadder1_sum), 
    .data1_i(EX_PCadder2_sum), 
    .select_i(EX_PCSrc), 
    .data_o(IF_PC_BoP)
);
//mux for jump done
Mux2to1 MFJ(
    .data0_i(IF_PC_BoP), 
    .data1_i(EX_PC_jump), 
    .select_i(EX_Jump), 
    .data_o(IF_PC_in)
);
//program counter done
Program_Counter PC(
    .clk_i(clk_i),      
    .rst_n(rst_n),     
    .pc_write(ID_PC_Write),
    .pc_in_i(IF_PC_in) ,   
    .pc_out_o(IF_PC_ReadAddress) 
);
//first adder done
Adder AD1(
    .src1_i(IF_PC_ReadAddress), 
    .src2_i(16'b0000000000000010), 
    .sum_o(IF_PCadder1_sum)
);
//instruction memory done
Instr_Memory IM(
    .pc_addr_i(IF_PC_ReadAddress),  
    .instr_o(IF_Instruction)    
);

Pipe_Reg #(.size(16)) IF_ID_PCadder1_sum(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(IF_ID_Write),
	.flush(1'b0),
    .data_i(IF_PCadder1_sum),
    .data_o(ID_PCadder1_sum)
);
Pipe_Reg #(.size(16)) IF_ID_Instruction(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(IF_ID_Write),
	.flush(1'b0),
    .data_i(IF_Instruction),
    .data_o(ID_Instruction)
);
/**********************************/

/*************ID stage*************/
//control unit done
Decoder DC(
    .instr_op_i(ID_Instruction[15:13]), 
    .RegWrite_o(ID_RegWrite),	
    .ALUOp_o(ID_ALUOp), 
    .ALUSrc_o(ID_ALUSrc), 
    .RegDst_o(ID_RegDst), 
    .Branch_o(ID_Branch), 
    .BranchType_o(ID_BranchType), 
    .MemToReg_o(ID_MemtoReg), 
    .MemRead_o(ID_MemRead), 
    .MemWrite_o(ID_MemWrite), 
    .Jump_o(ID_Jump)
);
//register file done
Reg_File RF(
    .clk_i(clk_i),      
    .rst_n(rst_n) ,     
    .RSaddr_i(ID_Instruction[12:10]) ,  
    .RTaddr_i(ID_Instruction[9:7]) ,  
    .RDaddr_i(WB_RDaddr) ,
    .RDdata_i(WB_RDdata)  , 
    .RegWrite_i(WB_RegWrite),
    .RSdata_o(ID_RSdata) ,  
    .RTdata_o(ID_RTdata)
);
//sign-extended done
Sign_Extend SE(
    .data_i(ID_Instruction[6:0]), 
    .data_o(ID_SignExtend)
);
//zero-filled done
Zero_Filled ZF(
    .data_i(ID_Instruction[6:0]), 
    .data_o(ID_ZeroFilled)
);
//hazard detection
Hazard_Detection HD(
    .EX_MemRead(EX_MemRead),
    .EX_Rt(EX_Instruction[9:7]),
    .ID_Rs(ID_Instruction[12:10]),
    .ID_Rt(ID_Instruction[9:7]),
    .PCSrc(EX_PCSrc),
    .Jump(EX_Jump),
    .PC_Write(ID_PC_Write),
    .IF_ID_Write(IF_ID_Write),
    .ID_Flush(ID_Flush),
    .EX_Flush(EX_Flush)
);

Pipe_Reg #(.size(1)) ID_EX_RegDst(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(ID_Flush),
    .data_i(ID_RegDst),
    .data_o(EX_RegDst)
);
Pipe_Reg #(.size(1)) ID_EX_RegWrite(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(ID_Flush),
    .data_i(ID_RegWrite),
    .data_o(EX_RegWrite)
);
Pipe_Reg #(.size(2)) ID_EX_ALUOp(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(ID_Flush),
    .data_i(ID_ALUOp),
    .data_o(EX_ALUOp)
);
Pipe_Reg #(.size(1)) ID_EX_ALUSrc(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(ID_Flush),
    .data_i(ID_ALUSrc),
    .data_o(EX_ALUSrc)
);
Pipe_Reg #(.size(1)) ID_EX_Branch(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(ID_Flush),
    .data_i(ID_Branch),
    .data_o(EX_Branch)
);
Pipe_Reg #(.size(1)) ID_EX_BranchType(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(ID_Flush),
    .data_i(ID_BranchType),
    .data_o(EX_BranchType)
);
Pipe_Reg #(.size(1)) ID_EX_Jump(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(ID_Flush),
    .data_i(ID_Jump),
    .data_o(EX_Jump)
);
Pipe_Reg #(.size(1)) ID_EX_MemRead(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(ID_Flush),
    .data_i(ID_MemRead),
    .data_o(EX_MemRead)
);
Pipe_Reg #(.size(1)) ID_EX_MemWrite(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(ID_Flush),
    .data_i(ID_MemWrite),
    .data_o(EX_MemWrite)
);
Pipe_Reg #(.size(1)) ID_EX_MemtoReg(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(ID_Flush),
    .data_i(ID_MemtoReg),
    .data_o(EX_MemtoReg)
);
Pipe_Reg #(.size(16)) ID_EX_Instruction(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(ID_Flush),
    .data_i(ID_Instruction),
    .data_o(EX_Instruction)
);
Pipe_Reg #(.size(16)) ID_EX_PCadder1_sum(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(ID_Flush),
    .data_i(ID_PCadder1_sum),
    .data_o(EX_PCadder1_sum)
);
Pipe_Reg #(.size(16)) ID_EX_RSdata(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(ID_Flush),
    .data_i(ID_RSdata),
    .data_o(EX_RSdata)
);
Pipe_Reg #(.size(16)) ID_EX_RTdata(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(ID_Flush),
    .data_i(ID_RTdata),
    .data_o(EX_RTdata)
);
Pipe_Reg #(.size(16)) ID_EX_SignExtend(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(ID_Flush),
    .data_i(ID_SignExtend),
    .data_o(EX_SignExtend)
);
Pipe_Reg #(.size(16)) ID_EX_ZeroFilled(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(ID_Flush),
    .data_i(ID_ZeroFilled),
    .data_o(EX_ZeroFilled)
);
/**********************************/

/*************EX stage*************/
//shifter for branch done
Shifter SFB(
    .result(EX_SE_shiftleft1), 
    .leftRight(1'b0), 
    .sftSrc(EX_SignExtend)
);
//second adder done
Adder AD2(
    .src1_i(EX_PCadder1_sum), 
    .src2_i(EX_SE_shiftleft1), 
    .sum_o(EX_PCadder2_sum)
);
//shifter for jump done
Shifter SFJ(
    .result({EX_Jump_complement, EX_Jump_shiftleft1}), 
    .leftRight(1'b0), 
    .sftSrc(EX_Instruction)
);
//concatenator for jump done
Concatenator CFJ(
    .data0_i(EX_PCadder1_sum[15:14]), 
    .data1_i(EX_Jump_shiftleft1), 
    .data_o(EX_PC_jump)
);
//ALU control done
ALU_Ctrl AC(
    .funct_i(EX_Instruction[3:0]), 
    .ALUOp_i(EX_ALUOp), 
    .ALU_operation_o(EX_ALU_operation), 
    .FURslt_o(EX_FUResult_Select)
);
//forwarding unit
Forwarding FW(
	.EX_Rs(EX_Instruction[12:10]),
	.EX_Rt(EX_Instruction[9:7]),
	.MEM_Rd(MEM_RDaddr),
	.MEM_RegWrite(MEM_RegWrite),
	.WB_Rd(WB_RDaddr),
	.WB_RegWrite(WB_RegWrite),
	.Forward_A(Forward_A),
	.Forward_B(Forward_B)
);
//mux before ALU done
Mux3to1 MFA1(
    .data0_i(EX_RSdata), 
    .data1_i(MEM_FUResult), 
    .data2_i(WB_RDdata), 
    .select_i(Forward_A), 
    .data_o(EX_ALU_src1)
);
Mux3to1 MFA2(
    .data0_i(EX_RTdata), 
    .data1_i(MEM_FUResult), 
    .data2_i(WB_RDdata), 
    .select_i(Forward_B), 
    .data_o(EX_Fwdata)
);
Mux2to1 MBA(
    .data0_i(EX_Fwdata), 
    .data1_i(EX_SignExtend), 
    .select_i(EX_ALUSrc), 
    .data_o(EX_ALU_src2)
);
//ALU done
ALU ALU(
    .aluSrc1(EX_ALU_src1), 
    .aluSrc2(EX_ALU_src2), 
    .ALU_operation_i(EX_ALU_operation), 
    .result(EX_ALU_result), 
    .zero(Zero)
);
//shifter done
Shifter Shifter(
    .result(EX_Shifter_result), 
    .leftRight(EX_ALU_operation[3]), 
    .sftSrc(EX_ALU_src2)
);
//mux before memory done
Mux3to1 MBM(
    .data0_i(EX_ALU_result), 
    .data1_i(EX_Shifter_result), 
    .data2_i(EX_ZeroFilled), 
    .select_i(EX_FUResult_Select), 
    .data_o(EX_FUResult)
);
//mux before register done
Mux2to1 #(.size(3)) MBR(
    .data0_i(EX_Instruction[9:7]), 
    .data1_i(EX_Instruction[6:4]), 
    .select_i(EX_RegDst), 
    .data_o(EX_RDaddr)
);
//mux for Zero done
Mux2to1 #(.size(1))MFZ(
    .data0_i(Zero), 
    .data1_i((~Zero)), 
    .select_i(EX_BranchType), 
    .data_o(ZERO)
);
//and for branch done
and AFB(EX_PCSrc, EX_Branch, ZERO);

Pipe_Reg #(.size(1)) EX_MEM_RegWrite(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(EX_Flush),
    .data_i(EX_RegWrite),
    .data_o(MEM_RegWrite)
);
Pipe_Reg #(.size(1)) EX_MEM_MemRead(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(EX_Flush),
    .data_i(EX_MemRead),
    .data_o(MEM_MemRead)
);
Pipe_Reg #(.size(1)) EX_MEM_MemWrite(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(EX_Flush),
    .data_i(EX_MemWrite),
    .data_o(MEM_MemWrite)
);
Pipe_Reg #(.size(1)) EX_MEM_MemtoReg(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(EX_Flush),
    .data_i(EX_MemtoReg),
    .data_o(MEM_MemtoReg)
);
Pipe_Reg #(.size(16)) EX_MEM_FUResult(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(EX_Flush),
    .data_i(EX_FUResult),
    .data_o(MEM_FUResult)
);
Pipe_Reg #(.size(16)) EX_MEM_RTdata(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(EX_Flush),
    .data_i(EX_RTdata),
    .data_o(MEM_RTdata)
);
Pipe_Reg #(.size(3)) EX_MEM_RDaddr(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(EX_Flush),
    .data_i(EX_RDaddr),
    .data_o(MEM_RDaddr)
);
/**********************************/

/*************MEM stage*************/
//data memory done
Data_Memory DM(
    .clk_i(clk_i),
    .addr_i(MEM_FUResult),
    .data_i(MEM_RTdata),
    .MemRead_i(MEM_MemRead),
    .MemWrite_i(MEM_MemWrite),
    .data_o(MEM_Readdata)
);

Pipe_Reg #(.size(1)) MEM_WB_RegWrite(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(1'b0),
    .data_i(MEM_RegWrite),
    .data_o(WB_RegWrite)
);
Pipe_Reg #(.size(1)) MEM_WB_MemtoReg(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(1'b0),
    .data_i(MEM_MemtoReg),
    .data_o(WB_MemtoReg)
);
Pipe_Reg #(.size(16)) MEM_WB_Readdata(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(1'b0),
    .data_i(MEM_Readdata),
    .data_o(WB_Readdata)
);
Pipe_Reg #(.size(16)) MEM_WB_FUResult(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(1'b0),
    .data_i(MEM_FUResult),
    .data_o(WB_FUResult)
);
Pipe_Reg #(.size(3)) MEM_WB_RDaddr(
    .clk_i(clk_i),
    .rst_i(rst_i),
	.write(1'b1),
	.flush(1'b0),
    .data_i(MEM_RDaddr),
    .data_o(WB_RDaddr)
);
/**********************************/

/*************WB stage*************/
//mux after memory
Mux2to1 MAM(
    .data0_i(WB_FUResult), 
    .data1_i(WB_Readdata), 
    .select_i(WB_MemtoReg), 
    .data_o(WB_RDdata)
);
/**********************************/
endmodule