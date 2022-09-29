module Zero_Filled( data_i, data_o );
//done

//I/O ports
input	[7-1:0] data_i;
output	[16-1:0] data_o;

//Internal Signals
wire	[16-1:0] data_o;

//Main function
/*your code here*/
assign data_o = {1'b0, data_i[ 6], data_i[ 5], data_i[ 4], data_i[ 3], data_i[ 2], data_i[ 1], data_i[ 0], 8'b00000000}; 

endmodule      
