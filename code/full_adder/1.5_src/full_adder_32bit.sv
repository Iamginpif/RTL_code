module full_adder_32bit
  #(parameter N=32)
  (
    input  [N-1:0] a, b, 
    input          c,
    output [N-1:0] sum, 
    output         cout
  );

  // Tạo wire để truyền carry giữa các bit
  wire [N:0] carry;
  assign carry[0] = c;  // Carry-in ban đầu

  genvar i;
  generate
    for (i = 0; i < N; i = i + 1) begin : adder_chain
      full_adder u0
      (
        .a_i   (a[i]), 
        .b_i   (b[i]), 
        .cin_i (carry[i]),  // Nhận carry từ bit trước
        .sum_o (sum[i]), 
        .cout_o(carry[i+1]) // Truyền carry cho bit sau
      );
    end
  endgenerate

  assign cout = carry[N]; // Carry-out cuối cùng
endmodule

