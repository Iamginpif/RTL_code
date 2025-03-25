module demux_1to4_tb;

logic data;
logic [1:0] sel;
logic [3:0] out;
logic en;

logic en_tc [1:5];
logic data_tc [1:5];
logic [1:0] sel_tc [1:5];
logic [3:0] out_tc  [1:5];

demux_1to4 uut
(
  .en_i (en),
  .data_i (data),
  .sel_i (sel),
  .out_o (out)
);

initial begin
en_tc[1] = 1'b1;data_tc[1] = 1'b1; sel_tc[1] = 2'b00; out_tc[1] = 4'b0001;
en_tc[2] = 1'b1;data_tc[2] = 1'b1; sel_tc[2] = 2'b10; out_tc[2] = 4'b0100;
en_tc[3] = 1'b1;data_tc[3] = 1'b1; sel_tc[3] = 2'b01; out_tc[3] = 4'b0010;
en_tc[4]= 1'b1;data_tc[4] = 1'b0; sel_tc[4] = 2'b00; out_tc[4] = 4'b0001; //failed
en_tc[5] = 1'b0;data_tc[5] = 1'b1; sel_tc[5] = 2'b11; out_tc[5] = 4'b000;

for(int i = 1; i < 6; i++) begin
  data = data_tc[i];
  sel = sel_tc[i];
  en = en_tc[i];  
  #10;
  if(out !== out_tc[i]) 
    $display(
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
