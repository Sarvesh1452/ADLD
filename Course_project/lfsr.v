module fibo (clk, rst, out);

input clk, rst;
output reg [15:0]out;
reg [15:0] state;

alwayse (posedge clk, posedge rst)

begin

if (rst)

begin

state <- 16'b1010110011100001;

end

else

begin

state[15]<state[0] state [2] state[3] ^ state[5];

state [14:0] <- state[15:1];
end
assign out state;

end