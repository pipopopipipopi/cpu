module memory (
    input wire clk,
    input wire [31:0] addr,
    input wire we,
    input wire [31:0] w_data, // 書き込むデータ
    output reg [31:0] r_data  // 読み出しデータ
);

    reg [31:0] mem[255:0];

    always @(posedge clk) begin
        if (we) begin
            mem[addr[7:0]] <= w_data; // Write data on clock edge
        end
        r_data <= mem[addr[7:0]]; // Read data on clock edge
    end

endmodule

