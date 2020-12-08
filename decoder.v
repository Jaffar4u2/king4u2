module decoder(a,b,d);
  input a,b;
  output [3:0] d;
  reg [3:0]d;
  
  always@(a or b)
  begin
    if( a ==0 && b==0)
      d <= 4'b0001;
    else if( a==0 && b==1)
      d <= 4'b0010;
    else if( a==1 && b==0)
      d <= 4'b 0100;
    else if( a==1 && b==1)
      d <= 4'b1000;
  end
endmodule