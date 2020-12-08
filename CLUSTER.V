module Rcluster(sci,reset,D,clk,en,Se0,Se1,scl);
  input sci,D,clk,en,reset;
  input Se0,Se1;
  output scl;
  wire q0,q1,q2;
  wire scl0,scl1;
  
  
 VScan_Flipflop R1 (
    .reset(reset), 
    .Si(sci), 
    .D(D), 
    .en(en), 
    .Se1(Se1), 
    .Se0(Se0), 
    .Clk(clk), 
    .Q(q0), 
    .S0(scl0)
    );
  
  VScan_Flipflop R2 (
    .reset(reset), 
    .Si(scl0), 
    .D(D), 
    .en(en), 
    .Se1(Se1), 
    .Se0(Se0), 
    .Clk(clk), 
    .Q(q1), 
    .S0(scl1)
    );

VScan_Flipflop R3 (
    .reset(reset), 
    .Si(scl1), 
    .D(D), 
    .en(en), 
    .Se1(Se1), 
    .Se0(Se0), 
    .Clk(clk), 
    .Q(q2), 
    .S0(scl)
    );
endmodule  