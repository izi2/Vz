cmake_minimum_required(VERSION 3.12)
project(VZ)

set(CMAKE_CXX_STANDARD 14)

add_executable(VZ
        Debug_Drv.c
        ESP_12F_DRV.c
        Main.c
        Bitset.c
        MCP23S17_DRV.c
        PIC_DRV_Uconnect.c
        SC16IS740_DRV.c
        SRAM_IS62WVS5128GBLL_DRV.c)