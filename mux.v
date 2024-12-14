
module muxtwoone(
input wire [1:0]i, //input lines
input wire s, //select line
output out
);
always@(*)
  begin 
    out =( ~s and i[0]) or (s and i[1]);
  end 
endmodule 

module muxfourone(
input wire [3:0]i, //input lines
input wire [1:0]s, //select line
output out
);
always@(*)
  begin 
    out =( ~s[0] and ~s[1] and i[0] ) or ( ~s[0] and s[1] and i[1] ) or ( s[0] and ~s[1] and i[2] ) or ( s[0] and s[1] and i[3]);
  end 
endmodule 
