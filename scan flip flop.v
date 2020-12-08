module VScan_Flipflop(reset,Si,D,en,Se1,Se0,Clk,Q,S0);
  input reset,Si,D,Se1,Se0,Clk,en;
  output Q,S0;
  wire a,b;
  
  assign S0=Q;  
  
  VDFF VD1 (
    .D(b), 
    .Clk(Clk),
    .reset(reset), 
    .Q(Q)
    );
    
    
Vmux21 VM1 (
    .q(a), 
    .sel(Se1), 
    .a(S0), 
    .b(Si)
    );


Vmux21 VM2 (
    .q(b), 
    .sel(Se0), 
    .a(D), 
    .b(a)
    );

endmodule

