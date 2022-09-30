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
    output reg[14:11] y
);
always @(*) begin
    if (EN==0) 
        f<=0;
    else begin
        f<=1;
        if (SW[9]==1)
            y<=10;
        else if (SW[8]==1)
            y<=9;
        else if (SW[7]==1)
            y<=8;
        else if (SW[6]==1)
            y<=7;
        else if (SW[5]==1)
            y<=6;
        else if (SW[4]==1)
            y<=5;
        else if (SW[3]==1)
            y<=4;
        else if (SW[2]==1)
            y<=3;
        else if (SW[1]==1)
            y<=2;
        else if (SW[0]==1)
            y<=1;
        else
            y<=0;
    end
end
endmodule

module DCD (//binary->BCD  decoder
    input [3:0] d,
    output reg[9:0] led
);
always @(*) begin
    case (d)
        0:led[0]=1;
        1:led[1]=1;
        2:led[2]=1;
        3:led[3]=1;
        4:led[4]=1;
        5:led[5]=1;
        6:led[6]=1;
        7:led[7]=1;
        8:led[8]=1;
        9:led[9]=1;
        default:led=10'b0000_0000_00;
    endcase
end
    
endmodule

module CODER(
    input [15:0] SW,
    output [15:0] led,
    output dp,
    output [7:0] an,
    output [6:0] segments
    );
    wire f;
    wire [3:0]ecd_output;
    wire [3:0]MUX_output;
    ECD ecd(
        .EN (SW[15]),
        .SW(SW[9:0]),
        .f(f),
        .y(ecd_output)
    );
    
    mux2 MUX(
        .a(SW[14:11]),
        .b(ecd_output),
        .sel(f),
        .f(MUX_output)
    );

    seven_disp_decoder SDD(
        .AN(an),
        .DP(dp),
        .segments(segments),
        .IN(MUX_output)
    );
    DCD dcd(
        .d(MUX_output),
        .led(led[9:0])
    );
    assign led[15]=f;
    assign led[14:11]=ecd_output;
    assign led[10]=0;
endmodule
