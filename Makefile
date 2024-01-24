# the compiler to use
CROSS_COMPILER = arm-xilinx-linux-gnueabi-g++
CC = 
CPP_FLAGS = -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a9 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/opt/petalinux/2022.2/sysroots/cortexa9t2hf-neon-xilinx-linux-gnueabi

# compiler flags:
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
CCFLAGS =  
LIBS = -lzmq -pthread -lmysqlclient --std=c++11 
RM      = rm -rf

default: all

all: generMac 

generMac: generate_MAC_set_IP.cpp 
	@echo "compiler is: $(CROSS_COMPILER) $(CPP_FLAGS)" 
	$(CROSS_COMPILER) $(CPP_FLAGS) generate_MAC_set_IP.cpp -o generate_MAC_set_IP 
#	@echo "Build complete"
clean:
	$(RM) *.dSYM *.out main
	@echo "Clean complete"
