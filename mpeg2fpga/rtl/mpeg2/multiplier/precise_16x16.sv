module precise_16x16 (
    input  logic [15:0] a,
    input  logic [15:0] b,

    output logic [31:0] y
);

assign y = a*b;

endmodule
