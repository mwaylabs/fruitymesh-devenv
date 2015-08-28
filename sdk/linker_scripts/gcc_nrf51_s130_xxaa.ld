OUTPUT_FORMAT ("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")

SEARCH_DIR(.)
SEARCH_DIR(./../ehal_latest/src)
SEARCH_DIR(./../ehal_latest/ARM/src)

SEARCH_DIR(C:/nrf/sdk/ehal_latest/ARM/src)


GROUP(-lgcc -lc -lnosys -lCMSIS)

/* 
Total Flash 256K, 
88K for s110, 15K for DFU
153K avail for application
*/

MEMORY
{
  FLASH (rx) : ORIGIN = 0x1D000, LENGTH = 0x40000 
  RAM (rwx) : ORIGIN = 0x20002800, LENGTH = 0x4000 /* 8 kB, 8 kB is taken by S110. */
}

INCLUDE "gcc_arm_flash.ld"

