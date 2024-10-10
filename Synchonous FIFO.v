module singleclkfifo(clk,rst,buf_in,buf_empty,buf_full,buf_in,buf_out,fifo_counter,rd_ptr,wr_ptr,read_en,write_en); 
//this implies that read and write operations will be done with respect to the same clock; synchronous first in first out register 
parameter size = 8;		//<mention the size of the register-1>
parameter ptrsize = 4;		//pointer size 
parameter locations = 64;
input clk;	//clock - meant for both: read operation and write operation
input rst;			//active high reset 
input read_en;			//enabling read operation
input write_en; 		//enabling write operation
input [size-1:0]buf_in;		//input buffer 
output reg [size-1:0]buf_out;
output reg buf_empty;
output reg buf_full;
output reg [size-1:0]fifo_counter;
reg [ptrsize-1:0]rd_ptr;
reg [ptrsize-1:0]wr_ptr;
reg [size:0] buf_mem[locations-1:0];


/* LOGIC TO INCLUDE HERE; 4 LOGIC BLOCKS TO CREATE FIFO 
-> BUFFER STATIC LOGIC: DEFINE BUFFER BEING EMPTY AND FULL WITH RESPECT TO FIFO COUNTER 
-> FIFO COUNTER LOGIC: DEFINE THE WORKING OF FIFO COUNTER, WHEN DOES IT INCREASE AND WHEN IS IT MEANT TO DECREASE 
-> BUFFER OUTPUT LOGIC: DEFINE HOW BUFFER OUTPUT LOGIC WORKS 
-> POINTER LOGIC: DEFINE HOW READ POINTER AND WRITE OPERATOR FUNCTIONS 
*/
//BUFFER STATIC LOGIC 
  always@(fifo_counter)
    begin
      buf_empty<= (fifo_counter == 0);
      buf_full<= (fifo_counter == locations-1);
    end 
    
//FIFO COUNTER LOGIC
  always@(posedge clk or posedge rst) 
    begin
    if(rst)
      fifo_counter<= size'd0;
    else 
      begin 
        if (wr_en && !buf_full) //write operation is enabled and buffer is not full; one extra bit to read  
          fifo_counter<= fifo_counter + 1;
        else if (rd_en && !buf_empty) //read operation is enabled and buffer is not empty; one less bit to read 
          fifo_counter<= fifo_counter - 1;
      end 
    end 
//BUFFER OUTPUT LOGIC
  always@(posedge clk or posedge rst) //yet to come, last edit 11/10/24, 2:16
    begin 


    end 
//POINTER LOGIC  //yet to come, last edit 11/10/24, 2:16

  

endmodule 


