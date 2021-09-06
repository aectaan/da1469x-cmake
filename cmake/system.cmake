# Toolchain
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER arm-none-eabi-g++)
set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)
set(CMAKE_AR arm-none-eabi-ar)
set(CMAKE_OBJCOPY arm-none-eabi-objcopy)
set(CMAKE_OBJDUMP arm-none-eabi-objdump)
set(SIZE arm-none-eabi-size)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
set(CMAKE_SYSTEM_PROCESSOR cortex-m33)
set(CMAKE_EXECUTABLE_SUFFIX ".elf")
# Language standart
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_C_STANDARD 11)
# SDK definitions
message("sdk path is " ${SDK_PATH})
set(BSP_CONFIG_DIR ${SDK_PATH}/bsp/config)
message("bsp config path is " ${BSP_CONFIG_DIR})
set(MIDDLEWARE_CONFIG_DIR ${SDK_PATH}/middleware/config)
message("middleware config path is " ${MIDDLEWARE_CONFIG_DIR})
if(BLE)
    set(LDSCRIPT_PATH ${SDK_PATH}/bsp/ldscripts/ble_projects)
    set(LIB_BLE_PATH ${SDK_PATH}/interfaces/ble/binaries/DA1469x-Release)
else()
    set(LDSCRIPT_PATH ${SDK_PATH}/bsp/ldscripts/non_ble_projects)
endif(BLE)
message("ldscript path is " ${LDSCRIPT_PATH}) 

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mcpu=${CMAKE_SYSTEM_PROCESSOR} -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -Og -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Werror -Wall -g3 -std=gnu++${CMAKE_CXX_STANDARD} -fno-strict-aliasing -fno-exceptions -fno-rtti -fno-threadsafe-statics -fno-use-cxa-atexit -Wall -std=gnu++2a -fstack-usage --specs=nano.specs")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mcpu=${CMAKE_SYSTEM_PROCESSOR} -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -Og -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall -g3 -std=gnu${CMAKE_C_STANDARD} -fno-strict-aliasing -fstack-usage --specs=nano.specs")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -mcpu=${CMAKE_SYSTEM_PROCESSOR} -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -Og -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Werror -Wall -g3 -T ${CMAKE_CURRENT_BINARY_DIR}/mem.ld -T ${CMAKE_CURRENT_BINARY_DIR}/sections.ld -Xlinker --gc-sections -L${LDSCRIPT_PATH} -L${BLE_LIB_PATH} -Wl,-Map,${PROJECT_NAME}.map --specs=nosys.specs -Wl,--print-memory-usage")
set(CMAKE_ASM_FLAGS "-mcpu=${CMAKE_SYSTEM_PROCESSOR} -g3 -c -x assembler-with-cpp --specs=nano.specs -mfloat-abi=hard -mfpu=fpv5-sp-d16 -mthumb")

# set(CMAKE_C_LINK_EXECUTABLE "<CMAKE_C_COMPILER> <LINK_FLAGS> -o <TARGET> <OBJECTS>")
# set(CMAKE_CXX_LINK_EXECUTABLE "<CMAKE_CXX_COMPILER> <LINK_FLAGS> -o <TARGET> <OBJECTS>")