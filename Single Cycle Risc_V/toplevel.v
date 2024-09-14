module toplevel (input clk, rst);
    wire regwrite, memwrite, ALUsrc, zero, sign;
    wire [1:0] resultsrc, pcsrc;
    wire [2:0] ALUcontrol, Imsrc, f3;
    wire [6:0] opc, f7;
    datapath dp (clk, rst, regwrite, memwrite, ALUsrc, ALUcontrol, Imsrc, resultsrc, pcsrc, 
                 zero, sign, opc, f7, f3);
    controller cnt (zero, sign, opc, f7, f3,
             regwrite, memwrite, ALUsrc, ALUcontrol, Imsrc, resultsrc, pcsrc);
endmodule