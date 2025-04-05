module mux_32to1 
(
  input  [31:0] data_i, 
  input  [4:0]  sel_i,  
  output        out_o
);

  assign out_o = data_i[sel_i];

endmodule


