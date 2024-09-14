module toplevel (input clk, rst);
     wire [6:0] opc, f7;
     wire [2:0] ImmSrcD, ALUControlD, f3D, f3E;
     wire [4:0] Rs1D, Rs2D, Rs1E, Rs2E, RdE, RdM, RdW;
     wire [1:0] PCSrcE, ResultSrcD, ForwardAE, ForwardBE, ResultSrcE, ResultSrcM, ResultSrcW;
     wire RegWriteD, MemWriteD, ALUSrcD, StallF, StallD, FlushD, FlushE, ZeroE, SignE, RegWriteM, RegWriteW, JalrD, JumpD, BranchD,
         JalrE, JumpE, BranchE;

     HazardUnit hz (RegWriteM, RegWriteW, PCSrcE, ResultSrcE, ResultSrcM, ResultSrcW, Rs1D, Rs2D, Rs1E, Rs2E, RdE, RdM, RdW,
StallF, StallD, FlushD, FlushE, ForwardAE, ForwardBE);
     DCD dcd (JalrE, JumpE, BranchE, ZeroE, SignE, f3E, PCSrcE);
     datapath dp (clk, rst, RegWriteD, MemWriteD, ALUSrcD, StallF, StallD, FlushD, FlushE, JalrD, JumpD, BranchD, PCSrcE, ResultSrcD, ForwardAE,
ForwardBE, ImmSrcD, ALUControlD, ZeroE, SignE, RegWriteM, RegWriteW, JalrE, JumpE, BranchE, ResultSrcE, ResultSrcM, ResultSrcW,
f3D, f3E, Rs1D, Rs2D, Rs1E, Rs2E, RdE, RdM, RdW, opc, f7);
     controller cnt (f3D, f7, opc, RegWriteD, MemWriteD, ALUSrcD, JalrD, JumpD, BranchD, ResultSrcD, ALUControlD, ImmSrcD);

endmodule