module parallel_subtractor(
  input wire [3:0]a,
  input wire [3:0]b,
  input wire [3:0]cin,
  inout reg [3:0]s,
  inout reg [3:0]c
);

integer i;
always@(*)
  begin 
    s[0] = a[0] xor b[0] xor 1;
    c[0] = ((a[0] xor ~b[0]) and 1) or (a[0] and ~b[0]);
    for (i = 1; i < 4; i = i+1)
      begin
      s[i] = a[i] xor ~b[i] xor cin[i-1]; 
      // s1 = a1 xor b1 xor 1, s2 = a2 xor b2 xor c1, s3 = a3 xor b3 xor c2 
      c[i] = ((a[i] xor ~b[i]) and cin[i]) or (a[i] and ~b[i]);
      end 
  end 
endmodule 
