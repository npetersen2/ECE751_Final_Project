module clk_gen #(parameter PERIOD = 10) (
    output reg clk
);
    
    initial begin
       clk = 1'b0;
    end

    always begin
        #PERIOD clk = ~clk;
    end

endmodule
