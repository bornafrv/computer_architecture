module DFF (input clk, rst, clr, input in, output reg out);
    always @ (posedge clk, posedge rst) begin 
        if (rst)
            out <= 1'b0;
        else if (clr)
            out <= 1'b0;
        else
            out <= in;
    end
endmodule

module Register #(parameter N) (input clk, rst, en, clr, input [N-1:0] in, output reg [N-1:0] out);
    always @ (posedge clk, posedge rst) begin 
        if (rst)
            out <= {N{1'b0}};
        else if (clr)
            out <= {N{1'b0}};
        else if (~en)
            out <= in;
    end
endmodule

module first_regs (input clk, rst, StallD, FlushD, input [31:0] InstF, PCF, PC4F, output [31:0] InstD, PCD, PC4D);
    Register #(32) rs1 (clk, rst, StallD, FlushD, InstF, InstD);
    Register #(32) rs2 (clk, rst, StallD, FlushD, PCF, PCD);
    Register #(32) rs3 (clk, rst, StallD, FlushD, PC4F, PC4D);
endmodule

module second_regs (input clk, rst, FlushE, RegWriteD, MemWriteD, ALUSrcD, JalrD, JumpD, BranchD, input [1:0] ResultSrcD,
                   input[2:0] ALUControlD, f3D, input [4:0] Rs1D, Rs2D, RdD, input [31:0] RD1D, RD2D, PCD, ExtImmD, PC4D, 
                   output RegWriteE, MemWriteE, ALUSrcE, JalrE, JumpE, BranchE, output [1:0] ResultSrcE, output [2:0] ALUControlE,
                   f3E, output [4:0] Rs1E, Rs2E, RdE, output [31:0] RD1E, RD2E, PCE, ExtImmE, PC4E);

    Register #(2) rs1 (clk, rst, 1'b0, FlushE, ResultSrcD, ResultSrcE);
    Register #(3) rs2 (clk, rst, 1'b0, FlushE, ALUControlD, ALUControlE);
    Register #(32) rs3 (clk, rst, 1'b0, FlushE, RD1D, RD1E);
    Register #(32) rs4 (clk, rst, 1'b0, FlushE, RD2D, RD2E);
    Register #(32) rs5 (clk, rst, 1'b0, FlushE, PCD, PCE);
    Register #(5) rs6 (clk, rst, 1'b0, FlushE, Rs1D, Rs1E);
    Register #(5) rs7 (clk, rst, 1'b0, FlushE, Rs2D, Rs2E);
    Register #(5) rs8 (clk, rst, 1'b0, FlushE, RdD, RdE);
    Register #(32) rs9 (clk, rst, 1'b0, FlushE, ExtImmD, ExtImmE);
    Register #(32) rs10 (clk, rst, 1'b0, FlushE, PC4D, PC4E);
    Register #(3) rs11 (clk, rst, 1'b0, FlushE, f3D, f3E);
    DFF d1 (clk, rst, FlushE, RegWriteD, RegWriteE);
    DFF d2 (clk, rst, FlushE, MemWriteD, MemWriteE);
    DFF d3 (clk, rst, FlushE, ALUSrcD, ALUSrcE);
    DFF d4 (clk, rst, FlushE, JalrD, JalrE);
    DFF d5 (clk, rst, FlushE, JumpD, JumpE);
    DFF d6 (clk, rst, FlushE, BranchD, BranchE);
endmodule

module third_regs (input clk, rst, RegWriteE, MemWriteE, input [1:0] ResultSrcE, input [4:0] RdE,
                   input [31:0] ALUResultE, WriteDataE, ExtImmE, PC4E, output RegWriteM, MemWriteM,
                   output [1:0] ResultSrcM, output [4:0] RdM, output [31:0] ALUResultM, WriteDataM, ExtImmM, PC4M);

    Register #(2) rs1 (clk, rst, 1'b0, 1'b0, ResultSrcE, ResultSrcM);
    Register #(32) rs2 (clk, rst, 1'b0, 1'b0, ALUResultE, ALUResultM);
    Register #(32) rs3 (clk, rst, 1'b0, 1'b0, WriteDataE, WriteDataM);
    Register #(5) rs4 (clk, rst, 1'b0, 1'b0, RdE, RdM);
    Register #(32) rs5 (clk, rst, 1'b0, 1'b0, ExtImmE, ExtImmM);
    Register #(32) rs6 (clk, rst, 1'b0, 1'b0, PC4E, PC4M);
    DFF d1 (clk, rst, 1'b0, RegWriteE, RegWriteM);
    DFF d2 (clk, rst, 1'b0, MemWriteE, MemWriteM);
endmodule

module fourth_regs (input clk, rst, RegWriteM, input [1:0] ResultSrcM, input [4:0] RdM, input [31:0] ALUResultM,
                    ReadDataM, ExtImmM, PC4M, output RegWriteW, output [1:0] ResultSrcW, output [4:0] RdW,
                    output [31:0] ALUResultW, ReadDataW, ExtImmW, PC4W);
    Register #(2) rs1 (clk, rst, 1'b0, 1'b0, ResultSrcM, ResultSrcW);
    Register #(32) rs2 (clk, rst, 1'b0, 1'b0, ALUResultM, ALUResultW);
    Register #(32) rs3 (clk, rst, 1'b0, 1'b0, ReadDataM, ReadDataW);
    Register #(5) rs4 (clk, rst, 1'b0, 1'b0, RdM, RdW);
    Register #(32) rs5 (clk, rst, 1'b0, 1'b0, ExtImmM, ExtImmW);
    Register #(32) rs6 (clk, rst, 1'b0, 1'b0, PC4M, PC4W);
    DFF d1 (clk, rst, 1'b0, RegWriteM, RegWriteW);
endmodule