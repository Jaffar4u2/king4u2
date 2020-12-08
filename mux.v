module Vmux21(q, sel, a, b);
input sel, a, b;
output q;
assign q = sel ? b : a;
endmodule