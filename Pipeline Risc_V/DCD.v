module DCD (input JalrE, JumpE, BranchE, ZeroE, SignE, input [2:0] f3E, output [1:0] PCSrcE);
    assign PCSrcE = (JalrE) ? 2'b10 :
                    JumpE | 
                    (BranchE & (f3E == 3'd0) & ZeroE) | 
                    (BranchE & (f3E == 3'd1) & ~ZeroE) |  
                    (BranchE & (f3E == 3'd4) & SignE) |  
                    (BranchE & (f3E == 3'd5) & (ZeroE | ~SignE)) ? 2'b01 : 
                    2'b00;
endmodule