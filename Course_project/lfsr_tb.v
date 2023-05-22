module fibo_tb;

// Inputs

reg clk;

reg rst;


// Outputs

wire [15:0] out;

t-fibo (fibo.v)


// Instantiate the Unit Under Test (UUT) .out (out)

fibo uut (

.clk (clk),

.rst (rst),
 initial begin
 clk = 0; forever #5 clk clk;

initial begin

Ist = 1;

#10 rst 0;
end
andmodule