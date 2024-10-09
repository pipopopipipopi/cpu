module memory_tb;
    reg clk = 1'b0;

    reg [31:0] addr;
    reg we;  // Change this to a single bit
    reg [31:0] w_data;  // Ensure this is defined correctly
    wire [31:0] r_data;

    // Clock generation
    always #1 clk = ~clk;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, memory_tb);
    end

    memory data_mem (
        .clk(clk),
        .addr(addr),
        .we(we),
        .w_data(w_data),
        .r_data(r_data)
    );

    initial begin
        // Initialize
        we = 1'b0;
        #2;

        // Store operation
        we = 1'b1;  // Set write enable
        addr = 32'h12345;  // Address to write to
        w_data = 32'h54321;  // Data to write
        #2;
        
        we = 1'b0;  // Disable write
        addr = 32'h11345;  // Change address
        #2;

        // Load operation
        addr = 32'h12345;  // Address to read from
        #2;

        // Optionally, check the output
        // You might want to add a monitor or display the read data
        $display("Read data from %h: %h", addr, r_data);
        
        // Finish the simulation
        $finish;
    end
endmodule

