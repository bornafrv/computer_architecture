`timescale 1ns/ 1ns
module testbenchCTRL ();
    reg clk = 0, rst, zero, sign;
    reg [6:0] opc, f7;
    reg [2:0] f3;
    wire pc_w, adr_src, oldpc_w, memwrite, IR_w, regwrite;
    wire [2:0] imm_src, ALUcontrol;
    wire [1:0] result_src, Alu_srcA, Alu_srcB;
    controller ctrl(        
        clk, rst, zero, sign,
        opc, f7,
        f3,
        pc_w, adr_src, oldpc_w, memwrite, IR_w, regwrite,
        imm_src, ALUcontrol, 
        result_src, Alu_srcA, Alu_srcB);
    always #10  clk = ~clk;
    initial begin
        #300 rst = 1;
        #50 rst = 0;
        #50 opc = 7'd99; zero = 1'b0; sign = 1'b0; f3 = 3'd0; f7 = 7'd0;
        #1000;
        #300 rst = 1;
        #50 rst = 0;
        #50 opc = 7'd51; zero = 1'b0; sign = 1'b0; f3 = 3'd7;f7 = 7'd0;
        #1000;
        #300 rst = 1;
        #50 rst = 0;
        #50 opc = 7'd51; zero = 1'b0; sign = 1'b0;f3 = 3'd3; f7 = 7'd0;
        #1000;
        #300 rst = 1;
        #50 rst = 0;
        #50 opc = 7'd19; zero = 1'b0; sign = 1'b0; f3 = 3'd0; f7 = 7'd0;
        #1000;
        #300 rst = 1;
        #50 rst = 0;
        #50 opc = 7'd19; zero = 1'b0; sign = 1'b0; f3 = 3'd2; f7 = 7'd0;
        #1000;
        #300 rst = 1;
        #50 rst = 0;
        #50 opc = 7'd3; zero = 1'b0; sign = 1'b0; f3 = 3'd2; f7 = 7'd0;
        #1000;
        #300 rst = 1;
        #50 rst = 0;
        #50 opc = 7'd35; zero = 1'b0; sign = 1'b0; f3 = 3'd2; f7 = 7'd0;
        #1000;
        #300 rst = 1;
        #50 rst = 0;
        #50 opc = 7'd55; zero = 1'b0; sign = 1'b0; f3 = 3'd0; f7 = 7'd0;
        #1000;
        #300 rst = 1;
        #50 rst = 0;
        #50 opc = 7'd111; zero = 1'b0; sign = 1'b0; f3 = 3'd0; f7 = 7'd0;
        #1000;
        #300 rst = 1;
        #50 rst = 0;
        #50 opc = 7'd99; zero = 1'b0; sign = 1'b0; f3 = 3'd5; f7 = 7'd0;
        #1000$stop;
    end
endmodule