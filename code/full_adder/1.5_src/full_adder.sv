module full_adder
(   
  input a_i, b_i,
  input cin_i,
  output sum_o, cout_o
);
assign cout_o = (a_i & b_i) | (b_i & cin_i) | (a_i & cin_i);
assign sum_o = a_i ^ b_i ^ cin_i;
endmodule
