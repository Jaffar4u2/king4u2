module VPulse_Gen(Clk,Triger,n,Pulse,reset);
  input Clk,Triger;
  input reset,n;
  output Pulse;
  wire FF0,FF2,FF1;
  
VDFF VD1 (
    .D(Triger), 
    .Clk(Clk), 
    .reset(reset), 
    .Q(FF0)
    );

VDFF VD2 (
    .D(FF0), 
    .Clk(Clk), 
    .reset(reset), 
    .Q(FF1)
    );


VDFF VD3 (
    .D(FF1), 
    .Clk(Clk), 
    .reset(reset), 
    .Q(FF2)
    );

not n1(n,FF2);
and a1(Pulse,FF0,n,Clk);
endmodule