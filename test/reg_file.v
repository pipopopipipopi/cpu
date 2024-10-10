module reg_file (
    input  wire         clk,

    input  wire [4:0] rs1_addr,
    output wire [31:0] rs1_data,

    input  wire [4:0] rs2_addr,
    output wire [31:0] rs2_data,

    input  wire [4:0] rd_addr,
    input  wire       rd_we,
    input  wire [31:0] rd_data
);

    reg [31:0] regs[31:0];

    initial begin
        regs[0] = 32'b0; // x0は常に0
    end

    assign rs1_data = regs[rs1_addr];
    assign rs2_data = regs[rs2_addr];

    always @(posedge clk) begin
        if (rd_we && rd_addr != 0) begin
            regs[rd_addr] <= rd_data;
        end
    end

endmodule

