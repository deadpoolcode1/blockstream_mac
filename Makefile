# the compiler to use
ifndef CC
    CROSS_COMPILER = arm-xilinx-linux-gnueabi-g++
else
    CROSS_COMPILER = $(CC)
endif

# Compiler flags
CPP_FLAGS = -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a9 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
LIBS = -lzmq -pthread -lmysqlclient --std=c++11
RM = rm -rf

# Target definition
default: all

all: generMac

generMac: generate_MAC_set_IP.cpp 
	@echo "Compiler is: $(CROSS_COMPILER) $(CPP_FLAGS)" 
	$(CROSS_COMPILER) $(CPP_FLAGS) generate_MAC_set_IP.cpp -o generate_MAC_set_IP $(LIBS)
	@echo "Build complete"

clean:
	$(RM) *.dSYM *.out main
	@echo "Clean complete"

