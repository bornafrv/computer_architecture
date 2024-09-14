module toplevel(
    input clk, rst
);
    wire pc_w, adr_src, oldpc_w, memwrite, IR_w, regwrite, zero, sign;
    wire [2:0] imm_src, ALUcontrol, f3;
    wire [1:0] result_src, Alu_srcA, Alu_srcB;
    wire [6:0] opc, f7;

    datapath dp(clk, rst, pc_w, adr_src, oldpc_w, memwrite, IR_w, regwrite,
    imm_src, ALUcontrol, 
    result_src, Alu_srcA, Alu_srcB,
    zero, sign,
    f3,
    f7, opc);
    
    controller ctrl( clk, rst, zero, sign,
    opc, f7,
    f3,
    pc_w, adr_src, oldpc_w, memwrite, IR_w, regwrite,
    imm_src, ALUcontrol, 
    result_src, Alu_srcA, Alu_srcB);
endmodule