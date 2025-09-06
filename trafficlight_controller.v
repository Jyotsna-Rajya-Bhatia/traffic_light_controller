`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2025 20:49:21
// Design Name: 
// Module Name: trafficlight_controller
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


module trafficlight_controller(
    input clk,reset,
    output reg [2:0]M1,
    output reg [2:0]M2,
    output reg [2:0]MT, 
    output reg [2:0]S
    );
    parameter State_1=0, State_2=1, State_3=2, State_4=3, State_5=4, State_6=5;
    parameter  sec7=7,sec5=5,sec2=2,sec3=3;
    reg [2:0]count;
    reg [2:0]present_state;
    
    always @ (posedge clk or posedge reset)
    begin
    if (reset==1)
    begin
    present_state<=State_1;
    count<=0;
    end
    else
    case (present_state)
    State_1: if (count<sec7)
    begin
    present_state<=State_1;
    count<=count+1;
    end
    else 
    begin
    present_state<=State_2;
    count<=0;
    end
    State_2: if (count<sec2)
    begin
    present_state<=State_2;
    count<=count+1;
    end
    else 
    begin
    present_state<=State_3;
    count<=0;
    end
    State_3: if (count<sec5)
    begin
    present_state<=State_3;
    count<=count+1;
    end
    else 
    begin
    present_state<=State_4;
    count<=0;
    end
    State_4: if (count<sec2)
    begin
    present_state<=State_4;
    count<=count+1;
    end
    else 
    begin
    present_state<=State_5;
    count<=0;
    end
    State_5: if (count<sec3)
    begin
    present_state<=State_5;
    count<=count+1;
    end
    else 
    begin
    present_state<=State_6;
    count<=0;
    end
    State_6: if (count<sec2)
    begin
    present_state<=State_6;
    count<=count+1;
    end
    else 
    begin
    present_state<=State_1;
    count<=0;
    end
    default: present_state<=State_1;
    endcase
    end
    
    
    always@(present_state)
    begin
    case (present_state)
    State_1: begin
    M1<= 3'b001;
    M2<=3'b001;
    MT<=3'b100;
    S<=3'b100;
    end
    State_2:
    begin 
    M1<=3'b001;
    M2<=3'b010;
    MT<=3'b100;
    S<=3'b100;
     end
    State_3:
    begin
    M1<=3'b001;
    M2<=3'b100;
    MT<=3'b001;
    S<=3'b100;
    end
    State_4:
    begin
     M1<=3'b010;
     M2<=3'b100;
     MT<=3'b010;
     S<=3'b100;
     end
     State_5:
     begin 
     M1<=3'b100;
     M2<=3'b100;
     MT<=3'b100;
     S<=3'b001;
     end
     State_6:
     begin 
     M1<=3'b100;
     M2<=3'b100;
     MT<=3'b100;
     S<=3'b010;
     end
     default:
     begin 
     M1<=3'b000;
     M2<=3'b000;
     MT<=3'b000;
     S<=3'b000;
     end
     endcase
    end             
endmodule
