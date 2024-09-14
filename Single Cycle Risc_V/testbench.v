module testbench ();
    reg clk = 1'b0 , rst=1'b0;

    toplevel tp (clk, rst);

    always #5 clk = ~clk;
	initial begin
		#15 rst = 1'b1;
		#15 rst=1'b0;
		#5000 $stop;
	end
endmodule