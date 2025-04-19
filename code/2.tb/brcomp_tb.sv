module brcomp_tb;

  logic [31:0] rs1, rs2;
  logic ubr;
  logic less;
  logic equal;

  logic [31:0] rs1_tc [1:8];
  logic [31:0] rs2_tc [1:8];
  logic        ubr_tc [1:8];
  logic        less_tc [1:8];
  logic        equal_tc [1:8]; 

  brcomp uut 
  (
    .rs1_data(rs1),
    .rs2_data(rs2),
    .br_unsign(ubr),
    .br_less(less),
    .br_equal(equal)
  );

initial begin
rs1_tc[1] = 32'h00000001; rs2_tc[1] = 32'h00000000; ubr_tc[1] = 1'b1; less_tc[1] = 1'b0; equal_tc[1] = 1'b0;
rs1_tc[2] = 32'h00000002; rs2_tc[2] = 32'h00000002; ubr_tc[2] = 1'b1; less_tc[2] = 1'b0; equal_tc[2] = 1'b1;
rs1_tc[3] = 32'hFFFFFFFF; rs2_tc[3] = 32'h00000001; ubr_tc[3] = 1'b0; less_tc[3] = 1'b1; equal_tc[3] = 1'b0;
rs1_tc[4] = 32'h80000000; rs2_tc[4] = 32'h00000001; ubr_tc[4] = 1'b0; less_tc[4] = 1'b1; equal_tc[4] = 1'b0;
rs1_tc[5] = 32'h00000000; rs2_tc[5] = 32'h00000001; ubr_tc[5] = 1'b1; less_tc[5] = 1'b1; equal_tc[5] = 1'b0;
rs1_tc[6] = 32'h12345678; rs2_tc[6] = 32'h12345678; ubr_tc[6] = 1'b1; less_tc[6] = 1'b0; equal_tc[6] = 1'b1;
rs1_tc[7] = 32'h11111111; rs2_tc[7] = 32'h22222222; ubr_tc[7] = 1'b1; less_tc[7] = 1'b1; equal_tc[7] = 1'b0;
rs1_tc[8] = 32'hAAAAAAAA; rs2_tc[8] = 32'h55555555; ubr_tc[8] = 1'b1; less_tc[8] = 1'b0; equal_tc[8] = 1'b0;

for (int i = 1; i <= 8; i++) begin
  rs1 = rs1_tc[i];
  rs2 = rs2_tc[i];
  ubr = ubr_tc[i];
  #10; 
  if (less !== less_tc[i] || equal !== equal_tc[i]) begin
    $display("Testcase #%2d FAILED:", i);
    $display("| rs1 = %h | rs2 = %h | br_unsign = %b", rs1, rs2, ubr);
    $display("| less_expected = %b | less_got = %b", less_tc[i], less);
    $display("| equal_expected = %b | equal_got = %b", equal_tc[i], equal);
  end else begin 
    $display("Testcase #%2d PASSED:", i);
    $display("| rs1 = %h | rs2 = %h | br_unsign = %b", rs1, rs2, ubr);
    $display("| less = %b | equal = %b", less, equal);
  end

end
  $finish;
end
endmodule

