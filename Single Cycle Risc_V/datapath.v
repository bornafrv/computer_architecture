module datapath (input clk, rst, regwrite, memwrite, ALUsrc, input [2:0] ALUcontrol, Imsrc, input[1:0] resultsrc, pcsrc, 
                output zero, sign, output [6:0] opc, f7, output [2:0] f3);
    
    wire [31:0] pcin, inst, data1, data2, dmemout, aluout, Imout, addout1, addout2, result;
    wire signed [31:0] aluin2;
    wire [5:0] pcout;
    wire [4:0] A1, A2, A3;
    wire [24:0] immediate;

    PC pc(pcin, clk, rst, pcout);
    Instmem imem(pcout, inst);
    Registerfile RF(clk, regwrite, A1, A2, A3, result, data1, data2);
    ALU alu(data1, aluin2, ALUcontrol, zero, sign, aluout);
    Datamem dmem(aluout, data2, memwrite, clk, dmemout);
    Immextend imext(immediate, Imsrc, Imout);
    Adder adder1(pcout, Imout, addout1);
    Adder adder2(pcout, 32'd4, addout2);
    Mux2to1 mux2(data2, Imout, ALUsrc, aluin2);
    Mux3to1 mux3(addout2, addout1, aluout, pcsrc, pcin);
    Mux4to1 mux4(aluout, dmemout, addout2, Imout, resultsrc, result);

    assign f3 = inst[14:12];
    assign f7 = inst[31:25];
    assign opc = inst[6:0];
    assign immediate = inst[31:7];
    assign A1 = inst[19:15];
	assign A2 = inst[24:20];
	assign A3 = inst[11:7];
    
endmodule