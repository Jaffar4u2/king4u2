module VDFF(D,Clk,reset,Q);
  input D,Clk,reset;
  output Q;
  reg Q;
  always @(posedge Clk or posedge reset)
  begin
    if(reset)
      Q <= 1'b0;
    else
      Q <= D;
    end
 endmodule
 