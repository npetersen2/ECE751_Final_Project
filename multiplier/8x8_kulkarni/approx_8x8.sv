module approx_8x8 (
    input  logic [7:0] a,
    input  logic [7:0] b,
    input  wire  precise_en,

    output logic [15:0] y
);

logic [7:0] temp_y1, temp_y2, temp_y3, temp_y4;
logic [10:0] cout;

approx_4x4  mult_1 (.a(a[3:0]), .b(b[3:0]), .precise_en(1'b0), .y(temp_y1));
approx_4x4  mult_2 (.a(a[7:4]), .b(b[3:0]), .precise_en(precise_en), .y(temp_y2));
approx_4x4  mult_3 (.a(a[3:0]), .b(b[7:4]), .precise_en(precise_en), .y(temp_y3));
precise_4x4 mult_4 (.a(a[7:4]), .b(b[7:4]), .y(temp_y4));

assign y[15]             = precise_en ? temp_y4[7] + cout[10] : temp_y4[7];
assign {cout[10], y[14]} = precise_en ? temp_y4[6] + cout[9]  : temp_y4[6];
assign {cout[9], y[13]}  = precise_en ? temp_y4[5] + cout[8]  : temp_y4[5];
assign {cout[8], y[12]}  = precise_en ? temp_y4[4] + cout[7]  : temp_y4[4];

assign {cout[7], y[11]} = precise_en ? temp_y2[7] + temp_y3[7] + temp_y4[3] + cout[6] : temp_y2[7] | temp_y3[7] | temp_y4[3];
assign {cout[6], y[10]} = precise_en ? temp_y2[6] + temp_y3[6] + temp_y4[2] + cout[5] : temp_y2[6] | temp_y3[6] | temp_y4[2];
assign {cout[5], y[9]}  = precise_en ? temp_y2[5] + temp_y3[5] + temp_y4[1] + cout[4] : temp_y2[5] | temp_y3[5] | temp_y4[1];
assign {cout[4], y[8]}  = precise_en ? temp_y2[4] + temp_y3[4] + temp_y4[0] + cout[3] : temp_y2[4] | temp_y3[4] | temp_y4[0];

assign {cout[3], y[7]}  = precise_en ? temp_y1[7] + temp_y2[3] + temp_y3[3] + cout[2] : temp_y1[7] | temp_y2[3] | temp_y3[3];
assign {cout[2], y[6]}  = precise_en ? temp_y1[6] + temp_y2[2] + temp_y3[2] + cout[1] : temp_y1[6] | temp_y2[2] | temp_y3[2];
assign {cout[1], y[5]}  = precise_en ? temp_y1[5] + temp_y2[1] + temp_y3[1] + cout[0] : temp_y1[5] | temp_y2[1] | temp_y3[1];
assign {cout[0], y[4]}  = precise_en ? temp_y1[4] + temp_y2[0] + temp_y3[0]           : temp_y1[4] | temp_y2[0] | temp_y3[0];

assign y[3]  = temp_y1[3]; 
assign y[2]  = temp_y1[2]; 
assign y[1]  = temp_y1[1];
assign y[0]  = temp_y1[0];

endmodule

