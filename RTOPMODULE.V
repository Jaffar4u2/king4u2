module VRTOP(cs,trg,cnt,,D,se0,se1,reset,tck,lck,scj0,scj1,sge,sg0,sc0,sci);
  input sci;
  input D;
  input cs;
  input trg;
  input cnt; // clock signal//
  input tck;
  input se0,se1;
  input lck;  
  input scj0,scj1;
  input sge;
  input reset;
  output sg0,sc0;
  wire in;
  wire p;
  wire [3:0] sck,sig;
  wire cl0,cl1,cl2,cl3;
  wire clock;
  
 assign in = 1'b1;
 assign sg0 = sig[3];
 assign sc0 = cl3;

VPulse_Gen VCG (
    .Clk(cnt), 
    .Triger(trg), 
    .Pulse(p), 
    .reset(reset)
    );
    
Vmux21 MUX (
    .q(clock), 
    .sel(cs), 
    .a(p), 
    .b(tck)
    );

decoder rdec (
    .a(scj0), 
    .b(scj1), 
    .d(sck)
    );

  
Rcluster r0 (
    .sci(sci), 
    .reset(reset), 
    .D(D), 
    .clk(clock), 
    .en(lck), 
    .Se0(se0), 
    .Se1(se1),
    .scl(cl0)
    );


VSignature_register rsig0 (
    .in(in), 
    .sck(sck[0]), 
    .sgi(cl0), 
    .sge(sge), 
    .Clk(clock), 
    .reset(reset), 
    .sgo(sig[0])
    );
    
Rcluster r1 (
    .sci(cl0), 
    .reset(reset), 
    .D(D), 
    .clk(clock), 
    .en(lck), 
    .Se0(se0), 
    .Se1(se1),
    .scl(cl1)
    );


VSignature_register rsig1 (
    .in(sig[0]), 
    .sck(sck[1]), 
    .sgi(cl1), 
    .sge(sge), 
    .Clk(clock), 
    .reset(reset), 
    .sgo(sig[1])
    );
        
Rcluster r2 (
    .sci(cl1), 
    .reset(reset), 
    .D(D), 
    .clk(clock), 
    .en(lck), 
    .Se0(se0), 
    .Se1(se1),
    .scl(cl2)
    );
    
VSignature_register rsig2 (
    .in(sig[1]), 
    .sck(sck[2]), 
    .sgi(cl2), 
    .sge(sge), 
    .Clk(clock), 
    .reset(reset), 
    .sgo(sig[2])
    );
    
Rcluster r3 (
    .sci(cl2), 
    .reset(reset), 
    .D(D), 
    .clk(clock), 
    .en(lck), 
    .Se0(se0), 
    .Se1(se1),
    .scl(cl3)
    );


VSignature_register rsig3 (
    .in(sig[2]), 
    .sck(sck[3]), 
    .sgi(cl3), 
    .sge(sge), 
    .Clk(clock), 
    .reset(reset), 
    .sgo(sig[3])
    );
  endmodule