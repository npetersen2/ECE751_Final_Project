module approx_8x8 (
    input  logic [7:0] a,
    input  logic [7:0] b,

    output logic [15:0] y
);

logic [7:0] temp_y1, temp_y2, temp_y3, temp_y4;

approx_4x4 mult_1 (.a(a[3:0]), .b(b[3:0]), .y(temp_y1));
approx_4x4 mult_2 (.a(a[7:4]), .b(b[3:0]), .y(temp_y2));
approx_4x4 mult_3 (.a(a[3:0]), .b(b[7:4]), .y(temp_y3));
approx_4x4 mult_4 (.a(a[7:4]), .b(b[7:4]), .y(temp_y4));

assign y[15] = temp_y4[7];
assign y[14] = temp_y4[6];
assign y[13] = temp_y4[5];
assign y[12] = temp_y4[4];

assign y[11] = temp_y2[7] | temp_y3[7] | temp_y4[3];
assign y[10] = temp_y2[6] | temp_y3[6] | temp_y4[2];
assign y[9]  = temp_y2[5] | temp_y3[5] | temp_y4[1];
assign y[8]  = temp_y2[4] | temp_y3[4] | temp_y4[0];

assign y[7]  = temp_y1[7] | temp_y2[3] | temp_y3[3];
assign y[6]  = temp_y1[6] | temp_y2[2] | temp_y3[2];
assign y[5]  = temp_y1[5] | temp_y2[1] | temp_y3[1];
assign y[4]  = temp_y1[4] | temp_y2[0] | temp_y3[0];

assign y[3]  = temp_y1[3]; 
assign y[2]  = temp_y1[2]; 
assign y[1]  = temp_y1[1];
assign y[0]  = temp_y1[0];

endmodule

