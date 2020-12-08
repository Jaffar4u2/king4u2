module Rlatch(d,q,en);
  input d,en;
  output q;
  reg q;
  
  always@(en or d)
  begin
   if(en)
      q <= d;
    end
  endmodule