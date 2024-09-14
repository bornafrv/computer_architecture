module datapath(
    input clk, rst, pc_w, adr_src, oldpc_w, memwrite, IR_w, regwrite,
    input [2:0] imm_src, ALUcontrol, 
    input [1:0] result_src, Alu_srcA, Alu_srcB,
    output zero, sign,
    output[2:0] f3,
    output[6:0] f7, opcode
);
    wire [31:0] result_out, pc_out, mux1_out, oldpc_out, B_out, A_out,
    mem_out, IR_out, MDR_out, RD1, RD2, imm_out, mux2_out, mux3_out, ALU_out, ALU_reg_out;
    register pc(result_out, clk, rst, pc_w, pc_out);
    Mux2to1 mux_1(pc_out, result_out, adr_src, mux1_out);
    register oldpc(pc_out, clk, rst, oldpc_w, oldpc_out);
    Datamem memory(mux1_out, B_out, memwrite, clk, mem_out);
    register IR(mem_out, clk, rst, IR_w, IR_out);
    register MDR(mem_out, clk, rst, 1'b1, MDR_out);
    Registerfile RF(clk, regwrite, IR_out[19:15], IR_out[24:20], IR_out[11:7], result_out, RD1, RD2);
    register A(RD1, clk, rst, 1'b1, A_out);
    register B(RD2, clk, rst, 1'b1, B_out);
    Immextend immextend(IR_out[31:7], imm_src, imm_out);
    Mux3to1 mux_2(pc_out, oldpc_out, A_out, Alu_srcA, mux2_out);
    Mux3to1 mux_3(B_out, imm_out, 32'd4, Alu_srcB, mux3_out);
    ALU Alu(mux2_out, mux3_out, ALUcontrol, zero, sign, ALU_out);
    register ALU_reg(ALU_out, clk, rst, 1'b1, ALU_reg_out);
    Mux4to1 mux_4(ALU_reg_out, MDR_out, ALU_out, imm_out, result_src, result_out);
    assign f3 = IR_out[14:12];
    assign f7 = IR_out[31:25];
    assign opcode = IR_out[6:0];
endmodule