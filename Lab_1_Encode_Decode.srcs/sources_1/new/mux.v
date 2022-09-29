//////////////////////////////////////////////////////////////////
module mux2_1 (
    input a, b, 
    input sel,
    output f
    );
    wire nsel, f1, f2;
/// Structural
    and  G1 (f1, a, nsel),
         G2 (f2, b, sel);
    or   G3 (f, f1, f2);
    not  G4 (nsel, sel);
    
/// Continual Assign
//    assign f = (a & ~sel) | (b & sel);
//    assign f = sel ? b : a;

/* Behavioral
    reg f;
    always @(*) begin
        if (sel == 0) f = a;
        else  f = b;
    end
*/
endmodule
/////////////////////////////////////////////////////////////////
module mux2_2 (
    input [1:0] a, b, 
    input sel,
    output [1:0] f
    );
    mux2_1   M0 (a[0], b[0], sel, f[0]); 
    mux2_1   M1 (a[1], b[1], sel, f[1]); 
//    assign f = sel ? b : a;   
endmodule
`timescale 1ns / 100ps
/////////////////////////////////////////////////////////////////
module mux4_1 (
    input a, b, c, d,
    input [1:0] s,
    output  y 
    );
    wire l, h;
/// Structural
    mux2_1  M0 (a, b, s[0], l);
    mux2_1  M1 (c, d, s[0], h);
    mux2_1  M2 (l, h, s[1], y);
    
/* Behavioral
    reg y;
    always @* begin
        case (s)
            2'b00:  y = a;
            2'b01:  y = b;
            2'b10:  y = c;
            default: y = d;
        endcase
    end
*/       
endmodule
/////////////////////////////////////////////////////////////////
module mux2 # (parameter WIDTH = 4) (
    input [WIDTH-1:0] a, b, 
    input sel,
    output [WIDTH-1:0] f
    );
    assign f = sel ? b : a;   
endmodule
/////////////////////////////////////////////////////////////////
module mux4_8 (
    input [7:0]  a, b, c, d,
    input [1:0] s,
    output [7:0]  y 
    );
    wire [7:0] l, h;

    mux2 M0 (a[3:0], b[3:0], s[0], l[3:0]);
    mux2 M1 (a[7:4], b[7:4], s[0], l[7:4]);
//    mux2 #8  M01 (a, b, s[0], l); 
   
    mux2 M2 (c, d, s[0], h);
    
//    mux2 #8 M3 (l, h, s[1], y);     //��˳�򴫵�
    mux2  M3 (.f(y), .sel(s[1]), .a(l), .b(h));   //�����ִ���
endmodule
