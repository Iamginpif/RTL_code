module mux_4to1_tb;
  // Declare input and output signals for the IC
  logic [3:0] data;
  logic [1:0] sel;
  logic out;
  // Declare test case variables
  logic [3:0] data_tc [1:4];
  logic [1:0] sel_tc    [1:4];
  logic out_tc           [1:4];
//Instantation
 mux_4to1 uut
(
  .data_i   (data),
  .sel_i     (sel),
  .out_o   (out)
);
//initial cases
initial begin 
data_tc[1] = 4'b1010; sel_tc[1] = 2'b00; out_tc[1] = 1'b0;
data_tc[2] = 4'b1010; sel_tc[2] = 2'b01; out_tc[2] = 1'b1;
data_tc[3] = 4'b1010; sel_tc[3] = 2'b10; out_tc[3] = 1'b0;
data_tc[4] = 4'b1010; sel_tc[4] = 2'b11; out_tc[4] = 1'b0;//false
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

