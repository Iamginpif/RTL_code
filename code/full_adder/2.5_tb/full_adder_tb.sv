module full_adder_tb;

logic a, b, c;
logic sum, cout;

logic a_tc      [1:8];
logic b_tc      [1:8];
logic c_tc      [1:8];
logic sum_tc [1:8];
logic cout_tc [1:8];

full_adder uut 
(
  .a_i (a),
  .b_i (b),
  .cin_i (c),
  .sum_o (sum),
  .cout_o (cout)
);

initial begin
    // Test case 1: 0 + 0 + 0 = 00
a_tc[1] = 1'b0; b_tc[1] = 1'b0; c_tc[1] = 1'b0; sum_tc[1] = 1'b0; cout_tc[1] = 1'b0;   
    // Test case 2: 0 + 0 + 1 = 01
a_tc[2] = 1'b0; b_tc[2] = 1'b0; c_tc[2] = 1'b1; sum_tc[2] = 1'b1; cout_tc[2] = 1'b0;
    // Test case 3: 0 + 1 + 0 = 01
a_tc[3] = 1'b0; b_tc[3] = 1'b1; c_tc[3] = 1'b0; sum_tc[3] = 1'b1; cout_tc[3] = 1'b0;
    // Test case 4: 0 + 1 + 1 = 10
a_tc[4] = 1'b0; b_tc[4] = 1'b1; c_tc[4] = 1'b1; sum_tc[4] = 1'b0; cout_tc[4] = 1'b1;   
    // Test case 5: 1 + 0 + 0 = 01
a_tc[5] = 1'b1; b_tc[5] = 1'b0; c_tc[5] = 1'b0; sum_tc[5] = 1'b1; cout_tc[5] = 1'b0;   
    // Test case 6: 1 + 0 + 1 = 10
a_tc[6] = 1'b1; b_tc[6] = 1'b0; c_tc[6] = 1'b1; sum_tc[6] = 1'b0; cout_tc[6] = 1'b1;    
    // Test case 7: 1 + 1 + 0 = 10
a_tc[7] = 1'b1; b_tc[7] = 1'b1; c_tc[7] = 1'b0; sum_tc[7] = 1'b0; cout_tc[7] = 1'b1;    
    // Test case 8: 1 + 1 + 1 = 11
a_tc[8] = 1'b1; b_tc[8] = 1'b1; c_tc[8] = 1'b1; sum_tc[8] = 1'b1; cout_tc[8] = 1'b1;

for(int i = 1; i < 9; i++) begin
  a = a_tc[i];
  b = b_tc[i];
  c = c_tc[i];
  #10;
  if(sum !== sum_tc[i]) 
    $display(
    "Testcase #%2d FAILED:", i,  
    "| a = %b", a,
    "| b = %b", b,  
    "| c_in = %b", c, 
    "| sum_expected = %b",sum_tc[i],
    "| sum_got = %b", sum,
    "| cout_expected = %b", cout_tc[i],
    "| cout_got = %b", cout
  );
  else 
    $display(
   "Testcase #%2d PASSED:", i,  
    "| a = %b", a,
    "| b = %b", b,  
    "| c_in = %b", c, 
    "| sum_expected = %b",sum_tc[i],
    "| sum_got = %b", sum,
    "| cout_expected = %b", cout_tc[i],
    "| cout_got = %b", cout
  );
  end 
  $finish;
end

endmodule
