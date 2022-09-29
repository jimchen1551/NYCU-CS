module Concatenator( data0_i, data1_i, data_o );
//done
parameter size = 14;
//I/O ports
input	[2-1:0]     data0_i;
input   [size-1:0]  data1_i;
output	[size+1:0]    data_o;

//Internal Signals
wire	[size+1:0]    data_o;

//Main function
/*your code here*/

assign data_o = {data0_i, data1_i}; 

endmodule      
