module approx_2x2 (
    input  logic [1:0] a,
    input  logic [1:0] b,

    output logic [3:0] y
);

logic [1:0] temp_y;

assign y[3] = 1'b0;

and A0 (y[2] , a[1], b[1]);

and A1 (temp_y[1] , a[1], b[0]);
and A2 (temp_y[0] , a[0], b[1]);
or  O1 (y[1], temp_y[1], temp_y[0]);

and A3 (y[0] , a[0], b[0]);

endmodule
