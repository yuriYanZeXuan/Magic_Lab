`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/30 17:51:24
// Design Name: 
// Module Name: CODER_tb
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


module CODER_tb();
        reg  [15:0] SW;
        wire [15:0] led;
        wire [6:0] segments;
        wire dp;
        wire an[7:0];
    CODER cd(
        .SW(SW),
        .led(led),
        .dp(dp),
        .an(an),
        .segments(segments)
    );
    initial begin
        SW=16'b1111_1111_1111_1111;
        #100;
        SW=16'b1000_1000_1000_1000;
        #100;
        SW=16'b0000_1000_1000_1001;
        #100;
    end
        
    
        
    
endmodule
