module reg_file_tb;
    reg clk = 1'b0;

    reg [4:0] rs1_addr;
    reg [4:0] rs2_addr;
    reg [4:0] rd_addr;
    reg rd_we;
    
    reg [31:0] rd_data;
    wire [31:0] rs1_data;
    wire [31:0] rs2_data;

    // Clock generation
    always #1 clk = ~clk;

    // Instantiate the register file
    reg_file reg_file_inst (
        .clk(clk),
        .rs1_addr(rs1_addr),
        .rs2_addr(rs2_addr),
        .rd_addr(rd_addr),
        .rd_we(rd_we),
        .rd_data(rd_data),
        .rs1_data(rs1_data),
        .rs2_data(rs2_data)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, reg_file_tb);

        // Initialize inputs
        rd_we = 0;
        rd_addr = 0;
        rd_data = 32'b0;
        rs1_addr = 5'b0;
        rs2_addr = 5'b0;

        // Test case 1: Write to register 1
        rd_we = 1;
        rd_addr = 5'd1;  // Write to register 1
        rd_data = 32'hA5A5A5A5;  // Data to write
        #2;  // Wait for a clock cycle

        rd_we = 1'b0;
        #2;

        rs1_addr = 5'b1;
        #2;
        rs2_addr = 5'b1;
        #2;

        // Finish the simulation
        $finish;
    end
endmodule

