module carry_look_ahead_adder(
inout wire [3:0]p, //carry propagate 
inout wire [3:0]g, //carry generate 
inout wire [3:0]s, //sum
input wire [3:0]a, //input 1 
input wire [3:0]b, //input 2
inout wire [3:0]c //input 3
); //4 bits 
 

always@(*)
	begin 
	
	p[0] = a[0] xor b[0]; //carry propagate 0
	p[1] = a[1] xor b[1]; //carry propagate 1
	p[2] = a[2] xor b[2]; //carry propagate 2
	p[3] = a[3] xor b[3]; //carry propagate 3
	
	g[0] = a[0] and b[0]; //carry generate 0
	g[1] = a[1] and b[1]; //carry generate 1
	g[2] = a[2] and b[2]; //carry generate 2
	g[3] = a[3] and b[3]; //carry generate 3 
	
	//SUM
	s[0] = p[0] xor c[0];
	s[1] = p[1] xor (g[0] or (p[0] and c[0]));
	s[2] = p[2] xor (g[1] or (p[1] and (g[0] or (p[0] and g[0])));
	s[3] = p[3] xor ((g[2] or (p[2] and g[1]) or (p[2] and p[1] and g[0]) or (p[2] and p[1] and p[0] and c[0]));
	
	//CARRY 
	c[0] = (g[0] or (p[0] and c[0]));
	c[1] = (g[1] or (p[1] and (g[0] or (p[0] and g[0])));
	c[2] = (g[1] or (p[1] and (g[0] or (p[0] and g[0])));
	c[3] = ((g[2] or (p[2] and g[1]) or (p[2] and p[1] and g[0]) or (p[2] and p[1] and p[0] and c[0]));
	
endmodule 
