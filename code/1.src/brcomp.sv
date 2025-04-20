module brcomp
(
  input [31:0] rs1_data, rs2_data, 
  input br_unsign, // 1 if unsign, 0 if sign
  output reg br_less, br_equal
);
add_subtract as
  (
    .
/*always_comb begin
  br_less  = 1'b0;
  br_equal = 1'b0;
  if(rs1_data == rs2_data) begin
    br_equal = 1'b1;
    br_less = 1'b0;
  end
  if (br_unsign == 1'b1) begin 
    for (int i = 31; i >= 0; i--) begin
        if (rs1_data[i] != rs2_data[i]) begin
            br_less = ~rs1_data[i] & rs2_data[i]; 
/* xét bit từ phải qua, nếu gặp đúng 2 bit khác nhau thì xét
  nếu A[i] == 1 và B[i] == 0 thì br_less = 0 (tại lúc này A > B) do bit phải cùng lớn hơn
  nếu A[i] = 0 và B[i] == 1 thì br_less = 1*/
            break;
        end
    end
    end else if (br_unsign == 1'b0) begin
      if (rs1_data[31] == 1'b1 && rs2_data[31] == 1'b0) begin
        br_less = 1'b0;
      end else if (rs1_data[31] == 1'b0 && rs2_data[31] == 1'b1)begin
        br_less = 1'b1;
      end
  end
end

endmodule   
    
