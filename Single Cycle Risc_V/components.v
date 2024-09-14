module PC (input [5:0] in, input clk, rst,  output reg [5:0] out);
    always @(posedge clk, posedge rst) begin
        if(rst)
            out <= 6'b0;
        else
            out <= in;
    end
endmodule

module Instmem (input [5:0] pc, output [31:0] RD);
    reg [7:0] mem [0:63];
    initial $readmemh("instructions.mem", mem);
    assign RD = {mem[pc+3], mem[pc+2], mem[pc+1], mem[pc]};
endmodule

module Datamem (input [31:0] Adr, WD, input WE, clk, output [31:0] RD);
    reg [7:0] datamem [0:127];
    initial $readmemb("data.mem", datamem);
    always @(posedge clk) begin
         datamem[Adr] <= (WE) ? WD : datamem[Adr];
    end
    assign RD = {datamem[Adr+3], datamem[Adr+2], datamem[Adr+1], datamem[Adr]};
endmodule

module Registerfile (input clk, WE, input[4:0] A1, A2, A3, input[31:0] WD, output [31:0] RD1, RD2);
    reg [31:0] regmem [0:31];
    assign RD1 = regmem[A1];
    assign RD2 = regmem[A2];
    initial regmem[0] = 32'd0;
    always @(posedge clk) begin
        if(WE)
            regmem[A3] = (A3 != 5'd0) ? WD : 32'd0;
    end
    
endmodule

module ALU (input signed [31:0] A, B, input[2:0] control, output zero, sign, output reg signed[31:0] Y);
    always @(A, B, control) begin
        case (control)
            3'b000: Y = A + B;
            3'b001: Y = A - B;
            3'b010: Y = A & B;
            3'b011: Y = A | B;
            3'b100: Y = A ^ B;
            3'b101: Y = A < B;
            3'b110: Y = {1'b0, A} < {1'b0, B};
            default: Y = {32'd0};
        endcase
    end
    assign zero = ~|Y;
    assign sign = Y[31];
endmodule

module Adder (input signed [5:0] A, B, output signed [31:0] Y);
    assign Y = A + B;
endmodule

module Mux2to1 (input[31:0] A, B, input control, output [31:0] Y);
    assign Y = (control == 1'b1) ? B : A;
endmodule

module Mux3to1 (input[31:0] A, B, C, input[1:0] control, output [31:0] Y);
    assign Y = (control == 2'b00) ? A :
    (control == 2'b01) ? B :
    (control == 2'b10) ? C : 32'd0;
endmodule

module Mux4to1 (input[31:0] A, B, C, D, input[1:0] control, output [31:0] Y);
        assign Y = (control == 2'b00) ? A :
        (control == 2'b01) ? B : 
        (control == 2'b10) ? C : 
        (control == 2'b11) ? D : 32'd0;
endmodule

module Immextend (input[31:7] in, input[2:0] select, output [31:0] out);
    assign out = (select == 3'b000) ? {{20{in[31]}} , in[31:20]} :
    (select == 3'b001) ? {{20{in[31]}} , in[31:25] , in[11:7]} :
    (select == 3'b010) ? {{20{in[31]}} , in[7] , in[30:25] , in[11:8] , 1'b0} :
    (select == 3'b011) ? {{12{in[31]}} , in[19:12] , in[20] , in[30:21] , 1'b0} :
    (select == 3'b100) ?  {in[31:12] , {12{1'b0}}} : 32'd0;
endmodule