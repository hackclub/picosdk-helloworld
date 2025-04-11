set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR ARM)

# Set the path to the ARM toolchain
set(ARM_TOOLCHAIN_DIR "/Applications/ArmGNUToolchain/13.2.Rel1/arm-none-eabi")
set(BINUTILS_PATH "${ARM_TOOLCHAIN_DIR}/bin")

# The compiler
set(CMAKE_C_COMPILER "${BINUTILS_PATH}/arm-none-eabi-gcc")
set(CMAKE_CXX_COMPILER "${BINUTILS_PATH}/arm-none-eabi-g++")
set(CMAKE_ASM_COMPILER "${BINUTILS_PATH}/arm-none-eabi-gcc")

# Compiler flags
set(CMAKE_C_FLAGS_INIT "-mcpu=cortex-m0plus -mthumb")
set(CMAKE_CXX_FLAGS_INIT "-mcpu=cortex-m0plus -mthumb")
set(CMAKE_ASM_FLAGS_INIT "-mcpu=cortex-m0plus -mthumb")

# Don't try to link with host system libraries
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# Search for programs in the build host directories
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# Search for libraries and headers in the target directories
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY) 