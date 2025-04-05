module demux_1to32
(
  input data_i,
  input [4:0] sel_i,
  input en_i,
  output reg [31:0] out_o
);
always_comb begin
  if(en_i == 1'b1) begin
    out_o = 32'b0;
    case(sel_i)
      5'b00000: out_o[0] = data_i;
      5'b00001: out_o[1] = data_i;
      5'b00010: out_o[2] = data_i;
      5'b00011: out_o[3] = data_i;
      5'b00100: out_o[4] = data_i;
      5'b00101: out_o[5] = data_i;
      5'b00110: out_o[6] = data_i;
      5'b00111: out_o[7] = data_i;
      5'b01000: out_o[8] = data_i;
      5'b01001: out_o[9] = data_i;
      5'b01010: out_o[10] = data_i;
      5'b01011: out_o[11] = data_i;
      5'b01100: out_o[12] = data_i;
      5'b01101: out_o[13] = data_i;
      5'b01110: out_o[14] = data_i;
      5'b01111: out_o[15] = data_i;
      5'b10000: out_o[16] = data_i;
      5'b10001: out_o[17] = data_i;
      5'b10010: out_o[18] = data_i;
      5'b10011: out_o[19] = data_i;
      5'b10100: out_o[20] = data_i;
      5'b10101: out_o[21] = data_i;
      5'b10110: out_o[22] = data_i;
      5'b10111: out_o[23] = data_i;
      5'b11000: out_o[24] = data_i;
      5'b11001: out_o[25] = data_i;
      5'b11010: out_o[26] = data_i;
      5'b11011: out_o[27] = data_i;
      5'b11100: out_o[28] = data_i;
      5'b11101: out_o[29] = data_i;
      5'b11110: out_o[30] = data_i;
      5'b11111: out_o[31] = data_i;

    endcase 
  end else begin
    out_o = 32'b0;
  end
end
endmodule
       
