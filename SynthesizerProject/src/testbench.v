`timescale 1ns / 1ps

module synthesizer_tb();

reg [7:0] btn;
reg clk = 1'b0;
wire speaker;

// Создание экземпляра модуля synthesizer
synthesizer dut (
    .btn(btn),
    .clk(clk),
    .speaker(speaker)
);

// Генерация тактового сигнала
always 
begin
	#84 clk = ~clk;
end

initial begin
    // Инициализация входных сигналов
    btn = 8'b00000000;

    // Ожидание перед стимулами
    

    // Примеры стимулов
    #1000000 btn = 8'b00000001;  // Нажата кнопка 0
    #1000000 btn = 8'b00000000;  // Отжата кнопка 0
    //#50 btn = 8'b00000100;  // Нажата кнопка 2
    //#30 btn = 8'b00001000;  // Нажата кнопка 3
    //#20 btn = 8'b00000100;  // Нажата кнопка 2
    //#40 btn = 8'b00000000;  // Ни одна кнопка не нажата
    
    // Завершение симуляции
    #3000000 $finish;
end

initial 
begin
	// Команды для генерации .vsd файла
    $dumpvars;
    $display("Test started...");
end
// ...

endmodule
