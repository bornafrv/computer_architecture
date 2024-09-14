module testbenchTL ();
    reg clk = 1'b0 , rst=1'b0;

    toplevel tp (clk, rst);

    always #5 clk = ~clk;
	initial begin
		#50 rst = 1'b1;
		#50 rst = 1'b0;
		#6000 $stop;
	end
endmodule