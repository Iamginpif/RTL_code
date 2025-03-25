module mux_4to1 
(
  input [3:0] data_i, 
  input [1:0] sel_i,  
  output reg out_o
);

always_comb  begin
  case(sel_i)
    2'b00: out_o = data_i[0];
    2'b01: out_o = data_i[1];
    2'b10: out_o = data_i[2];
    2'b11: out_o = data_i[3];
  endcase
end
endmodule
