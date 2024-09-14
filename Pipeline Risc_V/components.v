module Adder (input signed [31:0] A, B, output signed [31:0] Y);
    assign Y = A + B;
endmodule

module MUX2to1 (input control, input [31:0] A, B, output [31:0] Y);
    assign Y = control ? B : A;
endmodule

module MUX3to1 (input [1:0] control, input [31:0] A, B, C, output reg [31:0] Y);    
    always @(control, A, B, C) begin
        case (control)
            2'b00: Y = A;
            2'b01: Y = B;
            2'b10: Y = C;
            default: Y = 32'b0;
        endcase
    end
endmodule

module MUX4to1 (input [1:0] control, input [31:0] A, B, C, D, output reg [31:0] Y);    
    always @(control, A, B, C, D) begin
        case (control)
            2'b00: Y = A;
            2'b01: Y = B;
            2'b10: Y = C;
            2'b11: Y = D;
            default: Y = 32'b0;
        endcase
    end
endmodule

module Register_File (input clk, we, input [4:0] A1, A2, A3, input [31:0] WD3, output [31:0] RD1, RD2);    
    reg [31:0] Rmem [0:31];
    initial Rmem[0] = 32'b0;
    assign RD1 = Rmem[A1];
    assign RD2 = Rmem[A2];
    always @(negedge clk) begin
        if ((we == 1) & (A3 != 5'b0))
            Rmem[A3] <= WD3; 
        else
            Rmem[A3] <= Rmem[A3]; 
    end
endmodule

module ALU (input [2:0] control, input signed [31:0] A, B, output zero, sign, output reg signed [31:0] Y);
    always @(control, A, B) begin
        case (control)
            3'b000: Y = A + B;
            3'b001: Y = A - B;
            3'b010: Y = A & B;
            3'b011: Y = A | B;
            3'b100: Y = A ^ B;
            3'b101: Y = (A < B) ? 32'd1 : 32'b0;
            3'b110: Y = ({1'b0, A} < {1'b0, B}) ? 32'd1 : 32'b0;
            default: Y = 32'b0;
        endcase
    end
    assign zero = (Y == 32'b0) ? 1'b1 : 1'b0;
    assign sign = Y[31];
endmodule

module Immediate_Extend (input [2:0] IMMslc, input [31:7] imm, output reg [31:0] ext);
    always @(IMMslc, imm) begin
        case (IMMslc)
            3'b000: ext = {{20{imm[31]}}, imm[31:20]};   // I_T
            3'b001: ext = {{20{imm[31]}}, imm[31:25], imm[11:7]};   // S_T
            3'b010: ext = {{20{imm[31]}}, imm[7], imm[30:25], imm[11:8], 1'b0};   // B_T
            3'b011: ext = {{12{imm[31]}}, imm[19:12], imm[20], imm[30:21], 1'b0};   // J_T
            3'b100: ext = {imm[31:12], 12'b0};   // U_T
            default: ext = 32'b0;
        endcase
    end
endmodule

module Instruction_Memory (input [31:0] A, output [31:0] RD);
    reg [7:0] Imem [0:63];
    initial $readmemh ("instructions.mem", Imem);
    assign RD = {Imem[A + 3], Imem[A + 2], Imem[A + 1], Imem[A]};
endmodule

module Data_Memory (input clk, we, input [31:0] A, WD, output [31:0] RD);
    reg [7:0] Dmem [0:127];
    initial $readmemb ("data.mem", Dmem);
    assign RD = {Dmem[A + 3], Dmem[A + 2], Dmem[A + 1], Dmem[A]};
    always @(posedge clk) begin
        if (we)
           {Dmem[A + 3], Dmem[A + 2], Dmem[A + 1], Dmem[A]} <= WD;
        else
            Dmem[A] <= Dmem[A];
    end
endmodule