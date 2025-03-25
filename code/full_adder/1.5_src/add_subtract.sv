module add_subtract 
(
  input [31:0] a_i, b_i,
  input  cin_i,  // 0: Cộng, 1: Trừ
  output  [31:0] result_o,
  output         cout_o
);
  reg [31:0] b_mod;
  reg [32:0] result;

  // Chọn b_i hoặc bù hai của b_i tùy vào mode_i
  assign b_mod = cin_i ? (~b_i + 1) : b_i; 

  // Thực hiện phép toán
  assign result = a_i + b_mod;

  // Xuất kết quả
  assign result_o = result[31:0];
  assign cout_o   = (cin_i == 0) ? result[32] : (a_i < b_i); // Cờ nhớ (carry/borrow), nếu a< b đúng nghĩa là có dấu trừ nên cout = 1

endmodule

