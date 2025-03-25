module add_subtract_tb;

logic [31:0] a, b;
logic cin;
logic [31:0] result;
logic cout;

logic [31:0] a_tc [1:7];
logic [31:0] b_tc [1:7];
logic cin_tc [1:7];
logic [31:0] result_tc [1:7];
logic cout_tc [1:7]; 

add_subtract uut
(
  .a_i (a),
  .b_i (b),
  .cin_i (cin),
  .result_o (result),
  .cout_o (cout)
);

initial begin
//testcase 1 + 1 = 2, cout = 0
a_tc[1] = 32'h00000001; b_tc[1] = 32'h00000001; cin_tc[1] = 1'b0; result_tc[1] = 32'h00000002; cout_tc[1] = 1'b0;
//test case 12345 + 6789 = 19134, cout = 0
a_tc[2] = 32'h00003039; b_tc[2] = 32'h00001A85; cin_tc[2] = 1'b0; result_tc[2] = 32'h00004ABE; cout_tc[2] = 1'b0;
// testcase FFFFFFFF + 00000001
a_tc[3] = 32'hFFFFFFFF; b_tc[3] = 32'h00000001; cin_tc[3] = 1'b0; result_tc[3] = 32'h00000000; cout_tc[3] = 1'b1;
//testcase 10 -9 =1
a_tc[4] = 32'h0000000A; b_tc[4] = 32'h00000009; cin_tc[4] = 1'b1; result_tc[4] = 32'h00000001; cout_tc[4] = 1'b0;
// testcase 192837 -987654, cout = 1
a_tc[5] = 32'h0002F145; b_tc[5] = 32'h000F1206; cin_tc[5] = 1'b1; result_tc[5] = 32'hFFF3DF3F; cout_tc[5] = 1'b1;
//testcase 1-1=0
a_tc[6] = 32'h00000001; b_tc[6] = 32'h00000001; cin_tc[6] = 1'b1; result_tc[6] = 32'h00000000; cout_tc[6] = 1'b0;
//testcase failed
a_tc[7] = 32'h00000001; b_tc[7] = 32'h00000001; cin_tc[7] = 1'b1; result_tc[7] = 32'h00000000; cout_tc[7] = 1'b1;
for(int i = 1; i < 8; i++) begin
  a = a_tc[i];
  b = b_tc[i];
  cin = cin_tc[i];
  #10;
  if(result !== result_tc[i] || cout !== cout_tc[i]) 
    $display(
    "Testcase #%2d FAILED:", i,  
    "| a = %d", a,
    "| b = %d", b,  
    "| c_in = %d", cin, 
    "| result_expected = %d",result_tc[i],
    "| result_got = %d", result,
    "| cout_expected = %d", cout_tc[i],
    "| cout_got = %d", cout
  );
  else if (result === result_tc[i] || cout === cout_tc[i])
    $display(
    "Testcase #%2d PASSED:", i,    
    "| a = %d", a,
    "| b = %d", b,  
    "| c_in = %d", cin, 
    "| result_expected = %d",result_tc[i],
    "| result_got = %d", result,
    "| cout_expected = %d", cout_tc[i],
    "| cout_got = %d", cout
  );
  end 
  $finish;
end

endmodule
