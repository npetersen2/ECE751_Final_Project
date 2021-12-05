modumodule approx_16x16 (
    input  logic [15:0] a,
    input  logic [15:0] b,
    input  wire  precise_en,

    output logic [31:0] y
);

logic [15:0] temp_y1, temp_y2, temp_y3, temp_y4;
logic [10:0] cout;

approx_8x8  mult_4 (.a(a[15:7]), .b(b[15:7]), .precise_en(precise_en), .y(temp_y4));
approx_8x8  mult_3 (.a(a[7:0]) , .b(b[7:0]) , .precise_en(precise_en), .y(temp_y3));
approx_8x8  mult_2 (.a(a[15:8]), .b(b[15:8]), .precise_en(precise_en), .y(temp_y2));
approx_8x8  mult_1 (.a(a[7:0]) , .b(b[7:0]) , .precise_en(precise_en), .y(temp_y1));

assign y[31]              = precise_en ? temp_y4[15] + cout[22] : temp_y4[15];
assign {cout[22], y[30]}  = precise_en ? temp_y4[14] + cout[21] : temp_y4[14];
assign {cout[21], y[29]}  = precise_en ? temp_y4[13] + cout[20] : temp_y4[13];
assign {cout[20], y[28]}  = precise_en ? temp_y4[12] + cout[19] : temp_y4[12];
assign {cout[19], y[27]}  = precise_en ? temp_y4[11] + cout[18] : temp_y4[11];
assign {cout[18], y[26]}  = precise_en ? temp_y4[10] + cout[17] : temp_y4[10];
assign {cout[17], y[25]}  = precise_en ? temp_y4[9]  + cout[16] : temp_y4[9] ;
assign {cout[16], y[24]}  = precise_en ? temp_y4[8]  + cout[15] : temp_y4[8] ;

assign {cout[15], y[23]}  = precise_en ? temp_y2[15] + temp_y3[15] + temp_y4[7] + cout[14] : temp_y2[15] | temp_y3[15] | temp_y4[7];
assign {cout[14], y[22]}  = precise_en ? temp_y2[14] + temp_y3[14] + temp_y4[6] + cout[13] : temp_y2[14] | temp_y3[14] | temp_y4[6];
assign {cout[13], y[21]}  = precise_en ? temp_y2[13] + temp_y3[13] + temp_y4[5] + cout[12] : temp_y2[13] | temp_y3[13] | temp_y4[5];
assign {cout[12], y[20]}  = precise_en ? temp_y2[12] + temp_y3[12] + temp_y4[4] + cout[11] : temp_y2[12] | temp_y3[12] | temp_y4[4];
assign {cout[11], y[19]}  = precise_en ? temp_y2[11] + temp_y3[11] + temp_y4[3] + cout[10] : temp_y2[11] | temp_y3[11] | temp_y4[3];
assign {cout[10], y[18]}  = precise_en ? temp_y2[10] + temp_y3[10] + temp_y4[2] + cout[9]  : temp_y2[10] | temp_y3[10] | temp_y4[2];
assign {cout[9] , y[17]}  = precise_en ? temp_y2[9]  + temp_y3[9]  + temp_y4[1] + cout[8]  : temp_y2[9]  | temp_y3[9]  | temp_y4[1];
assign {cout[8] , y[16]}  = precise_en ? temp_y2[8]  + temp_y3[8]  + temp_y4[0] + cout[7]  : temp_y2[8]  | temp_y3[8]  | temp_y4[0];

assign {cout[7], y[15]}  = precise_en ? temp_y1[15] + temp_y2[7] + temp_y3[7] + cout[6] : temp_y1[15] | temp_y2[7] | temp_y3[7];
assign {cout[6], y[14]}  = precise_en ? temp_y1[14] + temp_y2[6] + temp_y3[6] + cout[5] : temp_y1[14] | temp_y2[6] | temp_y3[6];
assign {cout[5], y[13]}  = precise_en ? temp_y1[13] + temp_y2[5] + temp_y3[5] + cout[4] : temp_y1[13] | temp_y2[5] | temp_y3[5];
assign {cout[4], y[12]}  = precise_en ? temp_y1[12] + temp_y2[4] + temp_y3[4] + cout[3] : temp_y1[12] | temp_y2[4] | temp_y3[4];
assign {cout[3], y[11]}  = precise_en ? temp_y1[11] + temp_y2[3] + temp_y3[3] + cout[2] : temp_y1[11] | temp_y2[3] | temp_y3[3];
assign {cout[2], y[10]}  = precise_en ? temp_y1[10] + temp_y2[2] + temp_y3[2] + cout[1] : temp_y1[10] | temp_y2[2] | temp_y3[2];
assign {cout[1], y[9]}   = precise_en ? temp_y1[9]  + temp_y2[1] + temp_y3[1] + cout[0] : temp_y1[9]  | temp_y2[1] | temp_y3[1];
assign {cout[0], y[8]}   = precise_en ? temp_y1[8]  + temp_y2[0] + temp_y3[0]           : temp_y1[8]  | temp_y2[0] | temp_y3[0];

assign y[7]  = temp_y1[7]; 
assign y[6]  = temp_y1[6]; 
assign y[5]  = temp_y1[5]; 
assign y[4]  = temp_y1[4]; 
assign y[3]  = temp_y1[3];
assign y[2]  = temp_y1[2];
assign y[1]  = temp_y1[1];
assign y[0]  = temp_y1[0];

endmodule

