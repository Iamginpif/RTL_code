module ic74138_tb;
  // Declare input and output signals for the IC
  logic g1, g2a, g2b;
  logic [2:0] select;
  logic [7:0] decoder;

  // Declare test case variables
  logic [2:0] en_tc       [1:11];
  logic [2:0] sel_tc      [1:11];
  logic [7:0] decoder_tc  [1:11];

  // Instantiate the IC 74138
  ic74138 dut (
    .g1_i       (g1),
    .g2a_i      (g2a),
    .g2b_i      (g2b),
    .select_i   (select),
    .outputs_o  (decoder)
  );

  initial begin
    // Initialize test cases:
    en_tc[ 1] = 3'bx1x; sel_tc[ 1] = 3'bxxx; decoder_tc[ 1] = 8'b1111_1111;
    en_tc[ 2] = 3'bxx1; sel_tc[ 2] = 3'bxxx; decoder_tc[ 2] = 8'b1111_1111;
    en_tc[ 3] = 3'b0xx; sel_tc[ 3] = 3'bxxx; decoder_tc[ 3] = 8'b1111_1111;
    en_tc[ 4] = 3'b100; sel_tc[ 4] = 3'b000; decoder_tc[ 4] = 8'b1111_1110;
    en_tc[ 5] = 3'b100; sel_tc[ 5] = 3'b001; decoder_tc[ 5] = 8'b1111_1101;
    en_tc[ 6] = 3'b100; sel_tc[ 6] = 3'b010; decoder_tc[ 6] = 8'b1111_1011;
    en_tc[ 7] = 3'b100; sel_tc[ 7] = 3'b011; decoder_tc[ 7] = 8'b1111_0111;
    en_tc[ 8] = 3'b100; sel_tc[ 8] = 3'b100; decoder_tc[ 8] = 8'b1110_1111;
    en_tc[ 9] = 3'b100; sel_tc[ 9] = 3'b101; decoder_tc[ 9] = 8'b1101_1111;
    en_tc[10] = 3'b100; sel_tc[10] = 3'b110; decoder_tc[10] = 8'b1011_1111;
    en_tc[11] = 3'b100; sel_tc[11] = 3'b111; decoder_tc[11] = 8'b0111_1110;
    
    // Run test cases
    for (int i = 1; i <= 11; i++) begin
      // Assign test case values
      {g1, g2a, g2b} = en_tc[i];
      select = sel_tc[i];
      #10;

      // Check if the decoder output matches the expected value
      if (decoder !== decoder_tc[i]) 
        $display("Testcase #%2d ", i
                ," | g1 = %b, g2a = %b, g2b = %b", g1, g2a, g2b
                ," | decoder = %b, decoder_tc = %b", decoder, decoder_tc[i]
                ," | FAILED", 
        );
      else 
        $display("Testcase #%2d ", i
                ," | g1 = %b, g2a = %b, g2b = %b", g1, g2a, g2b
                ," | decoder = %b, decoder_tc = %b", decoder, decoder_tc[i]
                ," | PASSED", 
        );
    end

    $finish;

  end

endmodule : ic74138_tb
