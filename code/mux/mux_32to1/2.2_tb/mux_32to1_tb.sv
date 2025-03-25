module mux_32to1_tb;
  // Declare input and output signals for the IC
  logic [31:0] data;
  logic [4:0] sel;
  logic out;
  // Declare test case variables
  logic [31:0] data_tc [1:4];
  logic [4:0] sel_tc    [1:4];
  logic out_tc           [1:4];
//Instantation
 mux_32to1 uut
(
  .data_i   (data),
  .sel_i     (sel),
  .out_o   (out)
);
//initial cases
initial begin 
data_tc[1] = 32'b1001111001010110011011001101011; sel_tc[1] = 5'b00000; out_tc[1] = 1'b1;
data_tc[2] = 32'b10101001100110011001100111001100; sel_tc[2] = 5'b10100; out_tc[2] = 1'b1;
data_tc[3] = 32'b11111111111111111111111111111111; sel_tc[3] = 5'b11100; out_tc[3] = 1'b1;
data_tc[4] = 32'b01000000111000000000001100001101; sel_tc[4] = 5'b00011; out_tc[4] = 1'b1;//false
//test
for (int i = 1; i< 5; i++) begin
  data = data_tc[i];
  sel = sel_tc[i];
  #10;
  if(out !== out_tc[i]) 
    $display(
    "Testcase #%2d FAILED:", i,  
    "| select = %b", sel,  
    "| data = %b", data, 
    "| expected = %b", out_tc[i],
    "| got = %b", out,
  );
  else 
    $display(
    "Testcase #%2d PASSED:", i,  
    "| select = %b", sel,  
    "| data = %b", data, 
    "| expected = %b", out_tc[i], 
    "| got = %b", out,
  );
  end 
  $finish;
end

endmodule

