module top;

    wire CLK;  // clock
    wire CLK2; // 2x clock
    
    //assign CLK2 = S_AXI_ACLK;
    
    reg [1:0] clk_div = 2'b00;
	always @(posedge CLK2)
    begin
        clk_div <= clk_div + 2'b01;
    end
    assign CLK = clk_div[1];
    
    // Controls
    reg NEWSLICE = 1'b0; // reset: this is the first a slice
    reg NEWLINE = 1'b0; // newline: first mb and submb
    reg [5:0] QP = 6'b101010;
    // ire xbuffer_DONE;
    
    // Inputs (from buffer)
    // wire intra4x4_READYI; // ready for enable when this set
    reg intra4x4_STROBEI = 1'b0; // values transfered only when this is 1
    reg [31:0] intra4x4_DATAI = 32'hFFFF;
    // wire intra8x8cc_readyi; // ready for enable when this set
    reg intra8x8cc_strobei = 1'b0; // values transfered only when this is 1
    reg [31:0] intra8x8cc_datai = 32'hFFFF;

    // Outputs
    wire [7:0] tobytes_BYTE;
    wire tobytes_STROBE; // BYTE valid
    wire tobytes_DONE; // NAL all done
	
	// Change the inputs randomly to make sure
	// synthesis does not optimize out parts of
	// the design due to constant inputs
always @(posedge CLK)
begin
	NEWSLICE <= ~NEWSLICE;
	NEWLINE <= ~NEWLINE;
	QP <= QP + 1;
	
	intra4x4_STROBEI <= ~intra4x4_STROBEI;
	intra4x4_DATAI <= intra4x4_DATAI + 1;
	intra8x8cc_strobei <= ~intra8x8cc_strobei;
	intra8x8cc_datai <= intra8x8cc_datai + 1;
end    

h264topskeleton my_h264_enc(
    .CLK(CLK),
    .CLK2(CLK2),

    // Controls
    .NEWSLICE(NEWSLICE),
    .NEWLINE(NEWLINE),
    .QP(QP),
    .xbuffer_DONE(xbuffer_DONE),

    // Inputs (from buffer)
    .intra4x4_READYI(intra4x4_READYI),
    .intra4x4_STROBEI(intra4x4_STROBEI),
    .intra4x4_DATAI(intra4x4_DATAI),
    .intra8x8cc_readyi(intra8x8cc_readyi),
    .intra8x8cc_strobei(intra8x8cc_strobei),
    .intra8x8cc_datai(intra8x8cc_datai),

    // Outputs 
    .tobytes_BYTE(tobytes_BYTE),
    .tobytes_STROBE(tobytes_STROBE),
    .tobytes_DONE(tobytes_DONE)
);

endmodule