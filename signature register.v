module VSignature_register(in,sck,sgi,sge,a,b,c,d,e,Clk,reset,sgo);
  input in,sck,sgi,sge,Clk,reset,a,b,c,d,e;
  output sgo;
  wire FF0,FF1,FF2,FF3;
  
VDFF VD0 (
    .D(a), 
    .Clk(Clk), 
    .reset(reset), 
    .Q(FF0)
    );
VDFF VD1 (
    .D(d), 
    .Clk(Clk), 
    .reset(reset), 
    .Q(FF1)
    );
VDFF VD2 (
    .D(FF1), 
    .Clk(Clk), 
    .reset(reset), 
    .Q(FF2)
    );
VDFF VD3 (
    .D(FF2), 
    .Clk(Clk), 
    .reset(reset), 
    .Q(FF3)
    );
xor x1(a,b,sgi,in);
and a1(c,sck,Clk);
xor x2(d,b,FF0);
and a2(b,FF3,sge);
not n1(e,sge);
and a3(sgo,FF3,e);
endmodule 
