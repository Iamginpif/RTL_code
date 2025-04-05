module demux_1to32_tb;

logic data;
logic [4:0] sel;
logic [31:0] out;
logic en;

logic en_tc [1:5];
logic data_tc [1:5];
logic [4:0] sel_tc [1:5];
logic [31:0] out_tc  [1:5];

demux_1to32 uut
(
  .en_i (en),
  .data_i (data),
  .sel_i (sel),
  .out_o (out)
);

initial begin
en_tc[1] = 1'b1;data_tc[1] = 1'b1; sel_tc[1] = 4'b0110; out_tc[1] = 32'b00000000000000000000000001000000;
en_tc[2] = 1'b1;data_tc[2] = 1'b1; sel_tc[2] = 4'b1110; out_tc[2] = 32'b00000000000000000100000000000000;
en_tc[3] = 1'b1;data_tc[3] = 1'b1; sel_tc[3] = 4'b0001; out_tc[3] = 32'b00000000000000000000000000000010;
en_tc[4]= 1'b1;data_tc[4] = 1'b0; sel_tc[4] = 4'b0000; out_tc[4] = 32'b00000000000000000000000000000001; //failed
en_tc[5] = 1'b0;data_tc[5] = 1'b1; sel_tc[5] = 4'b1111; out_tc[5] = 32'b0;

for(int i = 1; i < 6; i++) begin
  data = data_tc[i];
  sel = sel_tc[i];
  en = en_tc[i];  
  #10;
  if(out !== out_tc[i]) 
    $display
    (
      "Testcase #%2d FAILED:", i,  
      "| enable = %b", en,
      "| select = %b", sel,  
      "| data = %b", data, 
      "| expected = %b", out_tc[i],
      "| got = %b", out,
    );
  else 
    $display(
    "Testcase #%2d PASSED:", i,
    "| enable = %b", en,  
    "| select = %b", sel,  
    "| data = %b", data, 
    "| expected = %b", out_tc[i], 
    "| got = %b", out,
  );
  end 
  $finish;
end

endmodule
