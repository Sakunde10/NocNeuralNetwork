`timescale 1ns/1ps
module network4x4_TB();

localparam packet_size=16;
reg clk;
reg i_reset;
reg [15:0] i_data;
reg i_data_valid, i_rd_en;
wire [packet_size-1:0] o_DATA;

initial
begin
	clk=1;
	forever #5 clk=~clk;
end

initial
begin
	i_rd_en=1'b1;
	i_reset=0;
	#10 i_reset=1;
	#4 i_reset=0;
end

initial
begin
	#15
	i_data_valid=1'b1;
	i_data=16'b0001000001111111;
	#10
	i_data=16'b0010000011111110;
	#10
	i_data=16'b0011000011111111;
	#10
	i_data=16'b0100000111111100;
	#10
	i_data=16'b0001000111111101;
	#10
	i_data=16'b0010000111111110;
	#10
	i_data=16'b0011001111000111;
	#10
	i_data=16'b0100001111101000;
	/*
	#10
	i_data=16'b0011001111101001;
	#10
	i_data=16'b0001001111111101;
	#10
	i_data=16'b0001000111100010;
	#10
	i_data=16'b0001001111111011;
	*/
	#10;
	i_data_valid=1'b0;
end

network4x4 #(.packet_size(16),.xno(4),.yno(4)) network16(
.clk(clk),
.i_reset(i_reset),
.i_data(i_data),
.i_data_valid(i_data_valid),
.i_rd_en(i_rd_en),
.o_DATA(o_DATA)
);
endmodule