module approx_32x32 (
    input wire clk,
    input wire clk_en,
    input wire rst,
    
    output logic [63:0] product,

    input logic [31:0] a,
    input logic [31:0] b,

    input wire  precise_en
);

logic [31:0] temp_y1, temp_y2, temp_y3, temp_y4;
logic [63:0] y;
logic [46:0] cout;

precise_16x16 mult_4 (.a(a[31:16]), .b(b[31:16]), .y(temp_y4));
approx_16x16  mult_3 (.a(a[15:0]) , .b(b[31:16]), .precise_en(precise_en), .y(temp_y3));
approx_16x16  mult_2 (.a(a[31:16]), .b(b[15:0]) , .precise_en(precise_en), .y(temp_y2));
approx_16x16  mult_1 (.a(a[15:0]) , .b(b[15:0]) , .precise_en(precise_en), .y(temp_y1));

assign y[63]              = precise_en ? temp_y4[31] + cout[46] : temp_y4[31];
assign {cout[46], y[62]}  = precise_en ? temp_y4[30] + cout[45] : temp_y4[30];
assign {cout[45], y[61]}  = precise_en ? temp_y4[29] + cout[44] : temp_y4[29];
assign {cout[44], y[60]}  = precise_en ? temp_y4[28] + cout[43] : temp_y4[28];
assign {cout[43], y[59]}  = precise_en ? temp_y4[27] + cout[42] : temp_y4[27];
assign {cout[42], y[58]}  = precise_en ? temp_y4[26] + cout[41] : temp_y4[26];
assign {cout[41], y[57]}  = precise_en ? temp_y4[25] + cout[40] : temp_y4[25];
assign {cout[40], y[56]}  = precise_en ? temp_y4[24] + cout[39] : temp_y4[24];
assign {cout[39], y[55]}  = precise_en ? temp_y4[23] + cout[38] : temp_y4[23];
assign {cout[38], y[54]}  = precise_en ? temp_y4[22] + cout[37] : temp_y4[22];
assign {cout[37], y[53]}  = precise_en ? temp_y4[21] + cout[36] : temp_y4[21];
assign {cout[36], y[52]}  = precise_en ? temp_y4[20] + cout[35] : temp_y4[20];
assign {cout[35], y[51]}  = precise_en ? temp_y4[19] + cout[34] : temp_y4[19];
assign {cout[34], y[50]}  = precise_en ? temp_y4[18] + cout[33] : temp_y4[18];
assign {cout[33], y[49]}  = precise_en ? temp_y4[17] + cout[32] : temp_y4[17];
assign {cout[32], y[48]}  = precise_en ? temp_y4[16] + cout[31] : temp_y4[16];

assign {cout[31], y[47]}  = precise_en ? temp_y2[31] + temp_y3[31] + temp_y4[15] + cout[30] : temp_y2[31] | temp_y3[31] | temp_y4[15];
assign {cout[30], y[46]}  = precise_en ? temp_y2[30] + temp_y3[30] + temp_y4[14] + cout[29] : temp_y2[30] | temp_y3[30] | temp_y4[14];
assign {cout[29], y[45]}  = precise_en ? temp_y2[29] + temp_y3[29] + temp_y4[13] + cout[28] : temp_y2[29] | temp_y3[29] | temp_y4[13];
assign {cout[28], y[44]}  = precise_en ? temp_y2[28] + temp_y3[28] + temp_y4[12] + cout[27] : temp_y2[28] | temp_y3[28] | temp_y4[12];
assign {cout[27], y[43]}  = precise_en ? temp_y2[27] + temp_y3[27] + temp_y4[11] + cout[26] : temp_y2[27] | temp_y3[27] | temp_y4[11];
assign {cout[26], y[42]}  = precise_en ? temp_y2[26] + temp_y3[26] + temp_y4[10] + cout[25] : temp_y2[26] | temp_y3[26] | temp_y4[10];
assign {cout[25], y[41]}  = precise_en ? temp_y2[25] + temp_y3[25] + temp_y4[9]  + cout[24] : temp_y2[25] | temp_y3[25] | temp_y4[9] ;
assign {cout[24], y[40]}  = precise_en ? temp_y2[24] + temp_y3[24] + temp_y4[8]  + cout[23] : temp_y2[24] | temp_y3[24] | temp_y4[8] ;
assign {cout[23], y[39]}  = precise_en ? temp_y2[23] + temp_y3[23] + temp_y4[7]  + cout[22] : temp_y2[23] | temp_y3[23] | temp_y4[7] ;
assign {cout[22], y[38]}  = precise_en ? temp_y2[22] + temp_y3[22] + temp_y4[6]  + cout[21] : temp_y2[22] | temp_y3[22] | temp_y4[6] ;
assign {cout[21], y[37]}  = precise_en ? temp_y2[21] + temp_y3[21] + temp_y4[5]  + cout[20] : temp_y2[21] | temp_y3[21] | temp_y4[5] ;
assign {cout[20], y[36]}  = precise_en ? temp_y2[20] + temp_y3[20] + temp_y4[4]  + cout[19] : temp_y2[20] | temp_y3[20] | temp_y4[4] ;
assign {cout[19], y[35]}  = precise_en ? temp_y2[19] + temp_y3[19] + temp_y4[3]  + cout[18] : temp_y2[19] | temp_y3[19] | temp_y4[3] ;
assign {cout[18], y[34]}  = precise_en ? temp_y2[18] + temp_y3[18] + temp_y4[2]  + cout[17] : temp_y2[18] | temp_y3[18] | temp_y4[2] ;
assign {cout[17], y[33]}  = precise_en ? temp_y2[17] + temp_y3[17] + temp_y4[1]  + cout[16] : temp_y2[17] | temp_y3[17] | temp_y4[1] ;
assign {cout[16], y[32]}  = precise_en ? temp_y2[16] + temp_y3[16] + temp_y4[0]  + cout[15] : temp_y2[16] | temp_y3[16] | temp_y4[0] ;

assign {cout[15], y[31]}  = precise_en ? temp_y1[31] + temp_y2[15] + temp_y3[15] + cout[14] : temp_y1[31] | temp_y2[15] | temp_y3[15];
assign {cout[14], y[30]}  = precise_en ? temp_y1[30] + temp_y2[14] + temp_y3[14] + cout[13] : temp_y1[30] | temp_y2[14] | temp_y3[14];
assign {cout[13], y[29]}  = precise_en ? temp_y1[29] + temp_y2[13] + temp_y3[13] + cout[12] : temp_y1[29] | temp_y2[13] | temp_y3[13];
assign {cout[12], y[28]}  = precise_en ? temp_y1[28] + temp_y2[12] + temp_y3[12] + cout[11] : temp_y1[28] | temp_y2[12] | temp_y3[12];
assign {cout[11], y[27]}  = precise_en ? temp_y1[27] + temp_y2[11] + temp_y3[11] + cout[10] : temp_y1[27] | temp_y2[11] | temp_y3[11];
assign {cout[10], y[26]}  = precise_en ? temp_y1[26] + temp_y2[10] + temp_y3[10] + cout[9]  : temp_y1[26] | temp_y2[10] | temp_y3[10];
assign {cout[9],  y[25]}  = precise_en ? temp_y1[25] + temp_y2[9]  + temp_y3[9]  + cout[8]  : temp_y1[25] | temp_y2[9]  | temp_y3[9] ;
assign {cout[8],  y[24]}  = precise_en ? temp_y1[24] + temp_y2[8]  + temp_y3[8]  + cout[7]  : temp_y1[24] | temp_y2[8]  | temp_y3[8] ;
assign {cout[7],  y[23]}  = precise_en ? temp_y1[23] + temp_y2[7]  + temp_y3[7]  + cout[6]  : temp_y1[23] | temp_y2[7]  | temp_y3[7] ;
assign {cout[6],  y[22]}  = precise_en ? temp_y1[22] + temp_y2[6]  + temp_y3[6]  + cout[5]  : temp_y1[22] | temp_y2[6]  | temp_y3[6] ;
assign {cout[5],  y[21]}  = precise_en ? temp_y1[21] + temp_y2[5]  + temp_y3[5]  + cout[4]  : temp_y1[21] | temp_y2[5]  | temp_y3[5] ;
assign {cout[4],  y[20]}  = precise_en ? temp_y1[20] + temp_y2[4]  + temp_y3[4]  + cout[3]  : temp_y1[20] | temp_y2[4]  | temp_y3[4] ;
assign {cout[3],  y[19]}  = precise_en ? temp_y1[19] + temp_y2[3]  + temp_y3[3]  + cout[2]  : temp_y1[19] | temp_y2[3]  | temp_y3[3] ;
assign {cout[2],  y[18]}  = precise_en ? temp_y1[18] + temp_y2[2]  + temp_y3[2]  + cout[1]  : temp_y1[18] | temp_y2[2]  | temp_y3[2] ;
assign {cout[1],  y[17]}  = precise_en ? temp_y1[17] + temp_y2[1]  + temp_y3[1]  + cout[0]  : temp_y1[17] | temp_y2[1]  | temp_y3[1] ;
assign {cout[0],  y[16]}  = precise_en ? temp_y1[16] + temp_y2[0]  + temp_y3[0]             : temp_y1[16] | temp_y2[0]  | temp_y3[0] ;

assign y[15] = temp_y1[15]; 
assign y[14] = temp_y1[14]; 
assign y[13] = temp_y1[13]; 
assign y[12] = temp_y1[12]; 
assign y[11] = temp_y1[11];
assign y[10] = temp_y1[10];
assign y[9]  = temp_y1[9];
assign y[8]  = temp_y1[8];
assign y[7]  = temp_y1[7]; 
assign y[6]  = temp_y1[6]; 
assign y[5]  = temp_y1[5]; 
assign y[4]  = temp_y1[4]; 
assign y[3]  = temp_y1[3];
assign y[2]  = temp_y1[2];
assign y[1]  = temp_y1[1];
assign y[0]  = temp_y1[0];

always @(posedge clk)
    if (~rst) product <= 64'b0;
    else if (clk_en) product <= y;
    else product <= product;

endmodule

