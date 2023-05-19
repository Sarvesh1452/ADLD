module carparking();
reg  car, clk, reset;
reg [2:0]pswd;
wire fsensor,bsensor;

car C(fsensor, car,reset,clk,pswd,bsensor);

initial clk=0;


always #10 clk=~clk;

initial 
   	begin
	reset=0;car=0;pswd=3'b000;
	#15 reset =1;#15 car=1;pswd=3'b011;
	#20 reset =1;#20 car =1; pswd=3'b00;#20 pswd=3'b011;
	#20 reset=1;#20 car=1; pswd=3'b001;#20 pswd=3'b111;#20 pswd=3'b011;
	
	//#10 car=1;pswd=3'b000;
	
    	end

initial 
	begin
	$monitor("TIME:%6d, bsensor=%d, fsensor=%d, reset = %d", $time, bsensor, fsensor,reset);
	#200 $finish;
	end
endmodule



module car(fsensor, car,reset,clk,pswd,bsensor);
input car, clk,reset;
input [2:0]pswd;
output reg fsensor=0, bsensor=0;
//parameter car1=2'b00, car2=2'b01, car3=2'b10, car4=2'b11;
parameter start=2'b00, password=2'b01,parking=3'b10;
reg [2:0]state, next_state;
reg [2:0]a;
//reg [31:0]counter_wait;
always @(posedge clk)
begin
if(~reset)
state <= start;
else
state<= next_state;
end


always @(*)
begin
case(state)
start: begin 
	bsensor=0;
	if(car==1)
	begin
	fsensor=1;
	
	a<=pswd;
	next_state<= password;
	end
	else
	begin
	
	next_state<=start;
	end
	end
	
password: begin 
	if(a==3'b011)
	begin
	bsensor=1;
	fsensor=0;
	next_state <= start;
	//a<=0;
	end
	else
	begin
	bsensor=0;
	//fsensor<=0;
	next_state <= start;
	end
	end
/*parking: begin
	
	next_state <= start;
	end*/
default:next_state<= start;

endcase
end 
endmodule


