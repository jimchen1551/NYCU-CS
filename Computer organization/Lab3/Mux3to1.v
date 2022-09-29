module Mux3to1( data0_i, data1_i, data2_i, select_i, data_o );

parameter size = 16;			   
//done

//I/O ports               
input wire	[size-1:0] data0_i;          
input wire	[size-1:0] data1_i;
input wire	[size-1:0] data2_i;
input wire	[2-1:0] select_i;
output wire	[size-1:0] data_o; 

reg [size-1:0] data_t;
//Main function
/*your code here*/
always @(*)begin
    case(select_i)
        2'b00:  data_t = data0_i;
        2'b01:  data_t = data1_i;
        2'b10:  data_t = data2_i;
        default:data_t = 0;
    endcase
end
assign data_o = data_t;

endmodule      
