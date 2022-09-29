`timescale 1ns / 100ps

/////////////////////////////////////////////////
module mux2_1_tb(
    );
    reg D0, D1, S;
    wire Y;
    
    mux2_1 DUT(D0, D1, S, Y);
//    mux2_1 DUT(.a(D0), .b(D1), .sel(S), .f(Y));
//    mux2_1 DUT(.f(Y), .a(D0), .sel(S), .b(D1));
        
    initial begin
        D0 = 0; D1 = 0; S = 0;    // Y = D0 = 0
        #10 D1 = 1;
        #10 D0 = 1; D1 = 0;       // Y = D0 = 1
        #10 D0 = 0; D1 = 1;       // Y = D0 = 0
        #10 S = 1;                // Y = D1 = 1
        #10 D0 = 1; D1 = 0;       // Y = D1 = 0
        #10 D0 = 0; D1 = 1;       // Y = D1 = 1
        #10 S = 0;                // Y = D0 = 0
        #10 $finish;           
    end
endmodule

/////////////////////////////////////////////////
module mux4_8_tb(
    );
    reg [7:0] D0, D1, D2, D3;
    reg [1:0] S;
    wire [7:0] Y;
    
    mux4_8 DUT (D0, D1, D2, D3, S, Y);
//    mux4_8 DUT (.a(D0), .b(D1), .c(D2), .d(D3), .s(S), .y(Y));
//    mux2_1 DUT (.y(Y), .s(S), .c(D2), .d(D3), .b(D1), .a(D0));
        
    initial begin
        D0 = 8'b0001_0001;      // 8'h11 = 17
        D1 = 8'b0011_0011;      // 8'h33 = 51
        D2 = 8'b0111_0111;      // 8'h77 = 119 
        D3 = 8'b1111_1111;      // 8'hFF = 255
        S = 0;                  // Y = D0 = 17
        #10 D1 = 8'b1100_1100;  // 8'hCC = 204
            D2 = 8'b1110_1110;  // 8'hEE = 238
            D3 = 0;
        #10 D0 = 8'b0010_0010;  // Y = D0 = 34
        #10 S = 1;              // Y = D1 = 8'hCC = 204
        #10 S = 2;              // Y = D2 = 8'hEE = 238
        #10 S = 3;              // Y = D3 = 0
        #10 D3 = ~D3;           // Y = D3 = 255
        #10 $finish;           
    end
endmodule
