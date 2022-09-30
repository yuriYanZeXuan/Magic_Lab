`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/30 07:13:15
// Design Name: 
// Module Name: seven_disp_decoder
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


module seven_disp_decoder(
    input [3:0] IN,//4位BCD码
    output reg [6:0] segments,//7段字形
    output [7:0] AN,//使能
    output  DP//小数点
);
    assign AN=8'b1111_1110;//使能
    assign DP=1'b1;//关闭小数点
    always @(*) begin
        
        case(IN)
            //            gfe_dcba
            0:segments=7'b100_0000 ;
            1:segments=7'b111_1001;
            2:segments=7'b010_0100;
            3:segments=7'b011_0000;
            4:segments=7'b001_1001;
            5:segments=7'b001_0010;
            6:segments=7'b000_0010;
            7:segments=7'b111_1000;
            8:segments=7'b000_0000;
            9:segments=7'b001_0000;
            default:segments=7'b111_1111;
            /*
            case语句之间没有优先级，个条件应互斥，在组合电路中使用
            case语句最后应加上default语句，以防综合出锁存器电路
            */
        endcase
    end
endmodule
    
