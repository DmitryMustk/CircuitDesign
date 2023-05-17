# Имя цели (выходного файла)
TARGET = synth_sim

# Список исходных файлов
SRC_FILES = main.v testbench.v

# Команда компиляции
COMPILE_CMD = iverilog -o $(TARGET) $(SRC_FILES)

# Команда запуска симуляции
SIMULATE_CMD = vvp $(TARGET)

all: compile simulate

compile:
	$(COMPILE_CMD)

simulate:
	$(SIMULATE_CMD)

clean:
	rm -f $(TARGET) *.vcd
