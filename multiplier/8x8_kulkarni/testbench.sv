module testbench;

reg             clk;
logic [7:0]     a, b;
logic [15:0]    y;

parameter PERIOD = 10;

clk_gen #(.PERIOD (PERIOD)) clkg (
    .clk    (clk)
);

approx_8x8 mult (
    .a      (a),
    .b      (b),
    .y      (y)
);

always @ (posedge clk) begin
    a = 8'd10;
    b = 8'd32;
    #PERIOD
    $display("Output : %d", y);
    
    a = 8'd20;
    b = 8'd32;
    #PERIOD
    $display("Output : %d", y);
    
    a = 8'd10;
    b = 8'd30;
    #PERIOD
    $display("Output : %d", y);

    $finish;
end

endmodule
