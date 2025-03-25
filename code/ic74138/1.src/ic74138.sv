module ic74138 (
  input  logic        g1_i,       // Active-high enable
  input  logic        g2a_i,      // Active-low enable
  input  logic        g2b_i,      // Active-low enable
  input  logic [2:0]  select_i,   // 3-bit select input
  output logic [7:0]  outputs_o   // 8 output lines, active-low
);

  always_comb begin
    outputs_o = 8'b1111_1111;
    if (g1_i && ~g2a_i && ~g2b_i) begin
      case (select_i)
        3'b000:   outputs_o = 8'b1111_1110;  // Y0 active (low)
        3'b001:   outputs_o = 8'b1111_1101;  // Y1 active (low)
        3'b010:   outputs_o = 8'b1111_1011;  // Y2 active (low)
        3'b011:   outputs_o = 8'b1111_0111;  // Y3 active (low)
        3'b100:   outputs_o = 8'b1110_1111;  // Y4 active (low)
        3'b101:   outputs_o = 8'b1101_1111;  // Y5 active (low)
        3'b110:   outputs_o = 8'b1011_1111;  // Y6 active (low)
        3'b111:   outputs_o = 8'b0111_1111;  // Y7 active (low)
        default:  outputs_o = 8'b1111_1111;  // Default to all high
      endcase
    end
  end

endmodule : ic74138