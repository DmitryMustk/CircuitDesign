`timescale 1ns / 1ps

module synthesizer(
        input [7:0] btn,
        input clk,
        output speaker
);

reg [31:0] cnt = 0;
reg [32:0] friq = 0;
reg [32:0] friqs [0:6];
reg speaker_signal = 1'b0;

wire [7:0] btn_signal;
assign btn_signal = ~btn;

assign speaker = btn_signal ? speaker_signal : 0;

always @(posedge clk) begin
    if (cnt % friq == 0) begin
        cnt <= 1;
        speaker_signal <= !speaker_signal;
    end else begin
        cnt <= cnt + 1;
    end
end

reg [2:0] i;
always @(posedge clk) begin
    for (i = 0; i < 7; i = i + 1) begin
        if (btn_signal[i]) begin
            friq <= friqs[i];
        end
    end
end

initial begin
    friqs[0] = 32'b00000000000000000000000000100100; // 11472
    friqs[1] = 32'b00000000000000000000000000100001; // 10221
    friqs[2] = 32'b00000000000000000000000000011110; // 9101
    friqs[3] = 32'b00000000000000000000000000011011; // 8595
    friqs[4] = 32'b00000000000000000000000000010110; // 7653
    friqs[5] = 32'b00000000000000000000000000011000; // 6976
    friqs[6] = 32'b00000000000000000000000000010011; // 6075
end

endmodule
