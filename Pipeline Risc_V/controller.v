module controller (input [2:0] f3D, input [6:0] f7, opc, output reg RegWriteD, MemWriteD,
ALUSrcD, JalrD, JumpD, BranchD, output reg [1:0] ResultSrcD, output reg [2:0] ALUControlD, ImmSrcD);

    always @(f3D, f7, opc) begin
        {RegWriteD, MemWriteD, ALUSrcD, ResultSrcD, ALUControlD, ImmSrcD} = 11'b0;
        case (opc)

            7'd3: begin
                {RegWriteD, ImmSrcD, ALUSrcD, MemWriteD, ResultSrcD, JalrD, JumpD, BranchD} = 11'b1_000_1_0_01_0_0_0;
                if (f3D == 3'd2) begin   // lw
                    ALUControlD = 3'b000;
                    // PCSrcE = 2'b00;
                end
            end

            7'd19: begin
                {RegWriteD, ImmSrcD, ALUSrcD, MemWriteD, ResultSrcD, JalrD, JumpD, BranchD} = 11'b1_000_1_0_00_0_0_0;
                if (f3D == 3'd0) begin   // addi
                    ALUControlD = 3'b000;
                    // PCSrcE = 2'b00;
                end
                else if (f3D == 3'd4) begin   // xori
                    ALUControlD = 3'b100;
                    // PCSrcE = 2'b00;
                end
                else if (f3D == 3'd6) begin   // ori
                    ALUControlD = 3'b011;
                    // PCSrcE = 2'b00;
                end
                else if (f3D == 3'd2) begin   // slti
                    ALUControlD = 3'b101;
                    // PCSrcE = 2'b00;
                end
                else if (f3D == 3'd3) begin   // sltiu
                    ALUControlD = 3'b110;
                    // PCSrcE = 2'b00;
                end
            end

            7'd35: begin
                {RegWriteD, ImmSrcD, ALUSrcD, MemWriteD, JalrD, JumpD, BranchD} = 9'b0_001_1_1_0_0_0;
                if (f3D == 3'd2) begin   // sw
                    ALUControlD = 3'b000;
                    // PCSrcE = 2'b00;
                end
            end

            7'd51: begin
                {RegWriteD, ALUSrcD, MemWriteD, ResultSrcD, JalrD, JumpD, BranchD} = 8'b1_0_0_00_0_0_0;
                if ((f3D == 3'd0) & (f7 == 7'd0)) begin  // add
                    ALUControlD = 3'b000;
                    // PCSrcE = 2'b00;
                end
                else if ((f3D == 3'd0) & (f7 == 7'd32)) begin   // sub
                    ALUControlD = 3'b001;
                    // PCSrcE = 2'b00;
                end
                else if ((f3D == 3'd7) & (f7 == 7'd0)) begin   // and
                    ALUControlD = 3'b010;
                    // PCSrcE = 2'b00;
                end
                else if ((f3D == 3'd6) & (f7 == 7'd0)) begin   // or
                    ALUControlD = 3'b011;
                    // PCSrcE = 2'b00;
                end
                else if ((f3D == 3'd2) & (f7 == 7'd0)) begin   // slt
                    ALUControlD = 3'b101;
                    // PCSrcE = 2'b00;
                end
                else if ((f3D == 3'd3) & (f7 == 7'd0)) begin  // sltu
                    ALUControlD = 3'b110;
                    // PCSrcE = 2'b00;
                end
            end

            7'd55: begin 
                {RegWriteD, ImmSrcD, MemWriteD, ResultSrcD, JalrD, JumpD, BranchD} = 10'b1_100_0_11_0_0_0;
                // PCSrcE = 2'b00;   // lui
            end

            7'd99: begin
                {RegWriteD, ImmSrcD, ALUSrcD, MemWriteD, JalrD, JumpD, BranchD} = 9'b0_010_0_0_0_0_1;
                if (f3D == 3'd0) begin  // beq
                    ALUControlD = 3'b001;
                    // PCSrcE = ZeroE ? 2'b01 : 2'b00;
                end
                else if (f3D == 3'd1) begin   // bne
                    ALUControlD = 3'b001;   
                    // PCSrcE = ZeroE ? 2'b00 : 2'b01;
                end
                else if (f3D == 3'd4) begin   // blt
                    ALUControlD = 3'b001;
                    // PCSrcE = SignE ? 2'b01 : 2'b00;
                end
                else if (f3D == 3'd5) begin   // bge
                    ALUControlD = 3'b001;  
                    // PCSrcE = (ZeroE | ~SignE) ? 2'b01 : 2'b00; 
                end
            end

            7'd103: begin
                {RegWriteD, ImmSrcD, ALUSrcD, MemWriteD, ResultSrcD, JalrD, JumpD, BranchD} = 11'b1_000_1_0_10_1_0_0;
                if (f3D == 3'd0) begin   // jalr
                    ALUControlD = 3'b000;
                    // PCSrcE = 2'b10;
                end
            end

            7'd111: begin
                {RegWriteD, ImmSrcD, MemWriteD, ResultSrcD, JalrD, JumpD, BranchD} = 10'b1_011_0_10_0_1_0;
                // PCSrcE = 2'b01;   // jal
            end

        endcase
    end

endmodule