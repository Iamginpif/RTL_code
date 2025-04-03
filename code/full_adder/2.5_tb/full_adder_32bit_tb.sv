module full_adder_32bit_tb;

logic [31:0] a, b;
logic cin;
logic [31:0] sum;
logic cout;

logic [31:0] a_tc      [1:10];
logic [31:0] b_tc      [1:10];
logic c_tc                [1:10];
logic [31:0] sum_tc [1:10];
logic cout_tc           [1:10];

full_adder_32bit uut 
(
  .A (a),
  .B (b),
  .cin (cin),
  .sum (sum),
  .cout (cout)
);

initial begin
    // Test case 1: 0 + 0 + 0 = 00000000 (Không có lỗi)
    a_tc[1] = 32'b0; b_tc[1] = 32'b0; c_tc[1] = 1'b0; sum_tc[1] = 32'b0; cout_tc[1] = 1'b0;
    // Test case 2: 1 + 1 + 0 = 10 (2-bit)  
    a_tc[2] = 32'h00000001; b_tc[2] = 32'h00000001; c_tc[2] = 1'b0; sum_tc[2] = 32'h00000002; cout_tc[2] = 1'b0;
    // Test case 3: Số lớn + số nhỏ (Không tràn số)
    a_tc[3] = 32'h0000000F; b_tc[3] = 32'h00000001; c_tc[3] = 1'b0; sum_tc[3] = 32'h00000010; cout_tc[3] = 1'b0;
    // Test case 4: Cộng số âm (biểu diễn bù 2)
    a_tc[4] = 32'hFFFFFFF0; b_tc[4] = 32'h00000010; c_tc[4] = 1'b0; sum_tc[4] = 32'h00000000; cout_tc[4] = 1'b1;  // Không có overflow, nhưng carry out là 1
    // Test case 5: Tràn số dương
    a_tc[5] = 32'h7FFFFFFF; b_tc[5] = 32'h00000001; c_tc[5] = 1'b0; sum_tc[5] = 32'h80000000; // -2147483648 (overflow)
    cout_tc[5] = 1'b1;
    // Test case 6: Tràn số âm
    a_tc[6] = 32'h80000000; /* Số âm lớn nhất (-2147483648)*/b_tc[6] = 32'hFFFFFFFF; c_tc[6] = 1'b0; sum_tc[6] = 32'h7FFFFFFF; // 2147483647 (overflow)
    cout_tc[6] = 1'b1;
    // Test case 7: Số lẻ + số chẵn
    a_tc[7] = 32'hAAAAAAAA; b_tc[7] = 32'h55555555; c_tc[7] = 1'b0; sum_tc[7] = 32'hFFFFFFFF; // Tất cả bit là 1
    cout_tc[7] = 1'b0;
    // Test case 8: Cộng hai số giống nhau
    a_tc[8] = 32'h12345678; b_tc[8] = 32'h12345678; c_tc[8] = 1'b0; sum_tc[8] = 32'h2468ACF0; cout_tc[8] = 1'b0;
    // Test case 9: Số lớn + số nhỏ (Có carry)
    a_tc[9] = 32'hFFFFFFFE; b_tc[9] = 32'h00000002; c_tc[9] = 1'b1; sum_tc[9] = 32'h00000001; // Kết quả đúng là 1
    cout_tc[9] = 1'b1; 
    // Test case 10 (⚠️ Lỗi cố ý: Sai kết quả)
    a_tc[10] = 32'hFFFFFFFF; b_tc[10] = 32'h00000001; c_tc[10] = 1'b0; sum_tc[10] = 32'h00000000; // ❌ Lỗi: Đúng ra phải là sum = 0x00000000, cout = 1
    cout_tc[10] = 1'b0;  //❌ Lỗi cố ý: đúng phải là 1
for(int i = 1; i < 11; i++) begin
  a = a_tc[i];
  b = b_tc[i];
  cin = c_tc[i];
  #10;
  if(sum !== sum_tc[i] &&  cout !== cout_tc[i]) 
    $display(
    "Testcase #%2d FAILED:", i,  
    "| a = %h", a,
    "| b = %h", b,  
    "| c_in = %h", cin, 
    "| sum_expected = %h",sum_tc[i],
    "| sum_got = %h", sum,
    "| cout_expected = %h", cout_tc[i],
    "| cout_got = %h", cout
  );
  else 
    $display(
   "Testcase #%2d PASSED:", i,  
    "| a = %h", a,
    "| b = %h", b,  
    "| c_in = %h", cin, 
    "| sum_expected = %h",sum_tc[i],
    "| sum_got = %h", sum,
    "| cout_expected = %h", cout_tc[i],
    "| cout_got = %h", cout
  );
  end 
  $finish;
end

endmodule

