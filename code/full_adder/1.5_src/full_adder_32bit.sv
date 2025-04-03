module full_adder_32bit (
    input [31:0] A, B,
    input         cin,
    output [31:0] sum,
    output        cout
);
    wire [31:0] c;  // dây nội bộ để nối carry giữa các FA nhỏ
    // FA[0]
    full_adder FA0 
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

    assign cout = c[31];  // Carry-out cuối cùng
endmodule

