module add_subtract 
#(parameter BIT = 32)
(
  input   [BIT-1:0]    a_i, b_i,
  input                   cin_i,  // 0: Cộng, 1: Trừ
  output [BIT-1:0] result_o,
  output                 cout_o
);
wire [BIT-1:0] carry;
wire [BIT-1:0] b_mod;
// xor từng bit của b với cin 
genvar i;
for (i = 0; i < BIT; i++) begin
  assign b_mod[i] = b_i[i] ^ cin_i; // Nếu cin_i = 1 => b_mod = ~b_i (không cần + 1 vì cin đã là 1 rồi)
end
// xét khối full adder đầu tiên
full_adder FA320
(
  .a_i(a_i[0]),
  .b_i(b_mod[0]),
  .cin_i(cin_i),
  .sum_o(result_o[0]),
  .cout_o(carry[0])
);
// xét các khối còn lại
generate
  for (i = 1; i < BIT; i++) begin
  full_adder FAi 
  (
    .a_i(a_i[i]),
    .b_i(b_mod[i]),
    .cin_i(carry[i-1]), 
    .sum_o(result_o[i]),
    .cout_o(carry[i])
  );
  end
endgenerate
// Cờ nhớ ở bit cuối
assign cout_o = (cin_i == 0) ? carry[BIT-1] : (a_i < b_i); // xét cin = 0 (phép cộng), nếu đúng thì lấy bit cuối là bit nhớ cuối, nếu sai (phép trừ) thì chỉ cần xét a < b hay không, nếu đúng thì cout = 
endmodule

