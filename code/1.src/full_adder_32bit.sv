module full_adder_32bit (
    input  [31:0] A, B,
    input         cin,
    output [31:0] sum,
    output        cout
);
    wire [30:0] c;  // 31 dây carry nội bộ (từ bit 0 đến bit 30)

    // FA[0]
    full_adder fa0 (
        .a_i(A[0]),
        .b_i(B[0]),
        .cin_i(cin),
        .sum_o(sum[0]),
        .cout_o(c[0])
    );

    // FA[1] đến FA[30]
    full_adder fa1 (
        .a_i(A[1]),
        .b_i(B[1]),
        .cin_i(c[0]),
        .sum_o(sum[1]),
        .cout_o(c[1])
    );
    full_adder fa2 (
        .a_i(A[2]),
        .b_i(B[2]),
        .cin_i(c[1]),
        .sum_o(sum[2]),
        .cout_o(c[2])
    );
    full_adder fa3 (
        .a_i(A[3]),
        .b_i(B[3]),
        .cin_i(c[2]),
        .sum_o(sum[3]),
        .cout_o(c[3])
    );
    full_adder fa4 (
        .a_i(A[4]),
        .b_i(B[4]),
        .cin_i(c[3]),
        .sum_o(sum[4]),
        .cout_o(c[4])
    );
    full_adder fa5 
    (
        .a_i(A[5]), 
        .b_i(B[5]), 
        .cin_i(c[4]), 
        .sum_o(sum[5]), 
        .cout_o(c[5])
    );
    full_adder fa6 
    (
        .a_i(A[6]), 
        .b_i(B[6]), 
        .cin_i(c[5]), 
        .sum_o(sum[6]), 
        .cout_o(c[6])
    );
    full_adder fa7 
    (
        .a_i(A[7]), 
        .b_i(B[7]), 
        .cin_i(c[6]), 
        .sum_o(sum[7]), 
        .cout_o(c[7])
    );
    full_adder fa8 
    (
        .a_i(A[8]), 
        .b_i(B[8]), 
        .cin_i(c[7]), 
        .sum_o(sum[8]), 
        .cout_o(c[8])
    );
    full_adder fa9 
    (
        .a_i(A[9]), 
        .b_i(B[9]), 
        .cin_i(c[8]), 
        .sum_o(sum[9]), 
        .cout_o(c[9])
    );
    full_adder fa10 
    (
        .a_i(A[10]), 
        .b_i(B[10]), 
        .cin_i(c[9]), 
        .sum_o(sum[10]), 
        .cout_o(c[10])
    );
    full_adder fa11 
    (
        .a_i(A[11]), 
        .b_i(B[11]), 
        .cin_i(c[10]), 
        .sum_o(sum[11]), 
        .cout_o(c[11])
    );
    full_adder fa12 
    (
        .a_i(A[12]), 
        .b_i(B[12]), 
        .cin_i(c[11]), 
        .sum_o(sum[12]), 
        .cout_o(c[12])
    );
    full_adder fa13 
    (
        .a_i(A[13]), 
        .b_i(B[13]), 
        .cin_i(c[12]), 
        .sum_o(sum[13]), 
        .cout_o(c[13])
    );
    full_adder fa14 
    (
        .a_i(A[14]), 
        .b_i(B[14]), 
        .cin_i(c[13]), 
        .sum_o(sum[14]), 
        .cout_o(c[14])
    );
    full_adder fa15 
    (
        .a_i(A[15]), 
        .b_i(B[15]), 
        .cin_i(c[14]), 
        .sum_o(sum[15]), 
        .cout_o(c[15])
    );
    full_adder fa16 
    (
        .a_i(A[16]), 
        .b_i(B[16]), 
        .cin_i(c[15]), 
        .sum_o(sum[16]), 
        .cout_o(c[16])
    );
    full_adder fa17 
    (.a_i(A[17]), 
     .b_i(B[17]), 
     .cin_i(c[16]), 
     .sum_o(sum[17]), 
     .cout_o(c[17])
    );
    full_adder fa18 
    (.a_i(A[18]), 
     .b_i(B[18]), 
     .cin_i(c[17]), 
     .sum_o(sum[18]), 
     .cout_o(c[18])
    );
    full_adder fa19 
    (
        .a_i(A[19]), 
        .b_i(B[19]), 
        .cin_i(c[18]), 
        .sum_o(sum[19]), 
        .cout_o(c[19])
    );
    full_adder fa20 
    (
        .a_i(A[20]), 
        .b_i(B[20]), 
        .cin_i(c[19]), 
        .sum_o(sum[20]), 
        .cout_o(c[20])
    );
    full_adder fa21 
    (
        .a_i(A[21]), 
        .b_i(B[21]), 
        .cin_i(c[20]), 
        .sum_o(sum[21]), 
        .cout_o(c[21])
    );
    full_adder fa22 
    (
        .a_i(A[22]), 
        .b_i(B[22]), 
        .cin_i(c[21]), 
        .sum_o(sum[22]), 
        .cout_o(c[22])
    );
    full_adder fa23 
    (
        .a_i(A[23]), 
        .b_i(B[23]), 
        .cin_i(c[22]), 
        .sum_o(sum[23]), 
        .cout_o(c[23])
    );
    full_adder fa24 
    (
        .a_i(A[24]), 
        .b_i(B[24]), 
        .cin_i(c[23]), 
        .sum_o(sum[24]), 
        .cout_o(c[24])
    );
    full_adder fa25 
    (
        .a_i(A[25]), 
        .b_i(B[25]), 
        .cin_i(c[24]), 
        .sum_o(sum[25]), 
        .cout_o(c[25])
    );
    full_adder fa26 
    (
        .a_i(A[26]), 
        .b_i(B[26]), 
        .cin_i(c[25]), 
        .sum_o(sum[26]), 
        .cout_o(c[26])
    );
    full_adder fa27 
    (
        .a_i(A[27]), 
        .b_i(B[27]), 
        .cin_i(c[26]), 
        .sum_o(sum[27]), 
        .cout_o(c[27])
    );
    full_adder fa28 
    (
        .a_i(A[28]), 
        .b_i(B[28]), 
        .cin_i(c[27]), 
        .sum_o(sum[28]), 
        .cout_o(c[28])
    );
    full_adder fa29 
    (
        .a_i(A[29]), 
        .b_i(B[29]), 
        .cin_i(c[28]), 
        .sum_o(sum[29]), 
        .cout_o(c[29])
    );
    full_adder fa30 
    (
        .a_i(A[30]), 
         .b_i(B[30]), 
        .cin_i(c[29]), 
        .sum_o(sum[30]), 
        .cout_o(c[30])
    );
    full_adder fa31
    (
        .a_i(A[31]),
        .b_i(B[31]),
        .cin_i(c[30]),
        sum_o(sum[31]),
        .cout_o(cout)
    );
  /*  full_adder FA0 
    (
        .a_i(A[0]),
        .b_i(B[0]),
        .cin_i(cin),
        .sum_o(sum[0]),
        .cout_o(c[0])
    );

    // FA[1] đến FA[30]
    genvar i;
    generate
        for (i = 1; i < 32; i++) begin : gen_fa
            full_adder FAi (
                .a_i(A[i]),
                .b_i(B[i]),
                .cin_i(c[i-1]),
                .sum_o(sum[i]),
                .cout_o(c[i])
            );
        end
    endgenerate
*/
endmodule

