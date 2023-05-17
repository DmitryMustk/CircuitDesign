`timescale 1ns / 1ps

module synthesizer(
	input[7:0] btn,
	input clk,
	output speaker
);

reg [31:0] cnt = 0;
reg [32:0] friq = 0;
reg [32:0] friqs[7] = '{11472, 10221, 9101, 8595, 7653, 6976, 6075};
reg speaker_signal = 1'b0;

wire [7:0] btn_signal;
assign btn_signal = ~btn;

assign speaker = btn_signal ? speaker_signal: 0;

always @(posedge clk)
begin
	if (cnt % friq == 0)
		begin
			cnt <= 1;
			speaker_signal = !speaker_signal;
		end
	else
		begin
			cnt <= cnt + 1;
		end
end

reg [2:0] i;
always @(posedge clk)
begin
	for(i = 0; i < 7; i++)
	begin
		if(btn_signal[i])
			friq <= friqs[i];
	end
end

endmodule