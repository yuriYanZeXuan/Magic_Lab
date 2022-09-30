`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/30 16:24:52
// Design Name: 
// Module Name: CODER
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

module ECD(
    input  EN,
    input [9:0] SW,
    output reg f,
    output reg[3:0] y
);
always @(*) begin
    if (EN=0) 
        f=0;
    else begin
        f=1;
        if (SW[9]=1)
            y=10;
        else if (SW[8]=1)
            y=9;
        else if (SW[7]=1)
            y=8;
        else if (SW[6]=1)
            y=7;
        else if (SW[5]=1)
            y=6;
        else if (SW[4]=1)
            y=5;
        else if (SW[3]=1)
            y=4;
        else if (SW[2]=1)
            y=3;
        else if (SW[1]=1)
            y=2;
        else if (SW[0]=1)
            y=1;
        else
            y=0;
    end
end
endmodule
module CODER(

    );
endmodule
