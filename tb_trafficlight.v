`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2025 23:08:17
// Design Name: 
// Module Name: tb_trafficlight
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_trafficlight;
reg clk, reset;
wire [2:0]M1;
wire [2:0]M2;
wire [2:0]MT;
wire [2:0]S;

trafficlight_controller a0(clk, reset, M1, M2, MT, S);
initial 
begin
clk=1'b0;
forever #5 clk= ~clk;
end
initial
begin
reset=0;
#10;
reset=1;
#10;
reset=0;
#1000;
$finish;
end
endmodule

