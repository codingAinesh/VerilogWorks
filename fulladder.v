module fa(
input a,b,c,
output sum,carry
);
always@(*)
begin 
  sum = a xor b xor c;
  carry = (a and b) or (b and c) or (c and a);

endmodule 
