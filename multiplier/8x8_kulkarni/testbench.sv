module testbench;

reg             clk;
logic signed [15:0]    a;
logic signed [21:0]    b;
logic signed [37:0]    y;
int             counter_wrong, counter_correct, temp_mult, mcd;

parameter PERIOD = 10;

clk_gen #(.PERIOD (PERIOD)) clkg (
    .clk    (clk)
);

approx_22x16_signed mult (
    .a1          (a),
    .b1          (b),
    .precise_en (1'b1),
    .product          (y)
);

initial begin

    mcd = $fopen("values_approx.csv", "w"); // opening the file

    a = -2;
    b = -2;
end

always @ (posedge clk) begin
    
    a <= (b == 2**8 - 1) ? a+1 : a;
    b <= (b <= 2**8 - 1) ? b+1 : 0;
    
    $display("Output : %d, a = %d, b = %d", y, a, b);
    
    if (y != a*b)
        counter_wrong++;
    if (y == a*b)
        counter_correct++;
    
    temp_mult = a*b;

    $fdisplay(mcd, "%d, %d", temp_mult, y);
    
    if (a == 2) begin
        $display("Number of wrong outputs : %d, Number of correct outputs : %d", counter_wrong, counter_correct);
        $fclose(mcd);
        $finish;
    end
end
    
endmodule
