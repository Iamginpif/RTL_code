module demux_1to4
(
  input data_i,
  input [1:0] sel_i,
  input en_i,
  output reg [3:0] out_o
);
always_comb begin
  if(en_i == 1'b1) begin
    out_o = 4'b0;
    case(sel_i)
      2'b00: out_o[0] = data_i;
      2'b01: out_o[1] = data_i;
      2'b10: out_o[2] = data_i;
      2'b11: out_o[3] = data_i;
    endcase 
  end else begin
    out_o = 4'b0;
  end
end
endmodule
       
