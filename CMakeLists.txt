cmake_minimum_required(VERSION 3.0)
project(generate_MAC_set_IP)

# Set the C++ standard you wish to use (you might need to adjust this)
set(CMAKE_CXX_STANDARD 11)

# If you have specific compiler flags, you can set them like this
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a9 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security")

# Define the executable and its source file
add_executable(generate_MAC_set_IP generate_MAC_set_IP.cpp)

# If you have any libraries to link, you can specify them like this:
# target_link_libraries(generate_MAC_set_IP library_name)
