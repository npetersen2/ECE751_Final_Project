module testbench;

reg             clk;
logic [7:0]     a, b;
logic [15:0]    y;
int             counter_wrong, counter_correct, temp_mult, mcd;

parameter PERIOD = 10;

clk_gen #(.PERIOD (PERIOD)) clkg (
    .clk    (clk)
);

approx_8x8 mult (
    .a          (a),
    .b          (b),
    .precise_en (1'b1),
    .y          (y)
);

initial begin

    mcd = $fopen("values_approx.csv", "w"); // opening the file

    a = 0;
    b = 0;
end

always @ (posedge clk) begin
    
    a <= (b == 2**8 - 1) ? a+1 : a;
    b <= b+1;
    
    $display("Output : %d, a = %d, b = %d", y, a, b);
    
    if (y != a*b)
        counter_wrong++;
    if (y == a*b)
        counter_correct++;
    
    temp_mult = a*b;

    $fdisplay(mcd, "%d, %d", temp_mult, y);
    
    if (a == 2**8-1 && b == 2**8-1) begin
        $display("Number of wrong outputs : %d, Number of correct outputs : %d", counter_wrong, counter_correct);
        $fclose(mcd);
        $finish;
    end
end
    
endmodule
