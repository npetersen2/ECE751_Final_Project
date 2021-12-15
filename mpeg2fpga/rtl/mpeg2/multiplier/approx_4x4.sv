module approx_4x4 (
    input  logic [3:0] a,
    input  logic [3:0] b,
    input  wire  precise_en,

    output logic [7:0] y
);

logic [3:0] temp_y1, temp_y2, temp_y3, temp_y4;
logic [4:0] cout;

approx_2x2 mult_1 (.a(a[1:0]), .b(b[1:0]), .y(temp_y1));
approx_2x2 mult_2 (.a(a[3:2]), .b(b[1:0]), .y(temp_y2));
approx_2x2 mult_3 (.a(a[1:0]), .b(b[3:2]), .y(temp_y3));
precise_2x2 mult_4 (.a(a[3:2]), .b(b[3:2]), .y(temp_y4));

assign y[7]            = precise_en ? temp_y4[3] + cout[4]                           : temp_y4[3];
assign {cout[4], y[6]} = precise_en ? temp_y4[2] + cout[3]                           : temp_y4[2];
assign {cout[3], y[5]} = precise_en ? temp_y2[3] + temp_y3[3] + temp_y4[1] + cout[2] : temp_y2[3] | temp_y3[3] | temp_y4[1];
assign {cout[2], y[4]} = precise_en ? temp_y2[2] + temp_y3[2] + temp_y4[0] + cout[1] : temp_y2[2] | temp_y3[2] | temp_y4[0];
assign {cout[1], y[3]} = precise_en ? temp_y1[3] + temp_y2[1] + temp_y3[1] + cout[0] : temp_y1[3] | temp_y2[1] | temp_y3[1];
assign {cout[0], y[2]} = precise_en ? temp_y1[2] + temp_y2[0] + temp_y3[0]           : temp_y1[2] | temp_y2[0] | temp_y3[0];
assign y[1]            = temp_y1[1];
assign y[0]            = temp_y1[0];

endmodule
