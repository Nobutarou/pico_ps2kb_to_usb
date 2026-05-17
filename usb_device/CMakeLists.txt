#
# These are the specific top level files and build additions for a PS/2 to USB connected keyboard
# Note: CMake variables set in the parent dir are still in effect, etc
#

target_sources(${PROJECT} PRIVATE
  main.c
  usb_descriptors.c
  ../ps2kbd-lib/ps2.c
  ../ps2kbd-lib/ps2kbd.c
)

# Make sure TinyUSB can find tusb_config.h
target_include_directories(${PROJECT} PRIVATE 
  ${CMAKE_CURRENT_LIST_DIR}
  ${CMAKE_CURRENT_LIST_DIR}../ps2kbd-lib/
)

# In addition to pico_stdlib required for common PicoSDK functionality, add dependency on tinyusb_device
# for TinyUSB device support and tinyusb_board for the additional board support library used by the example
# ps2kbd-lib 入れないとどうにもリンカのエラーが止まらない
target_link_libraries(${PROJECT} PRIVATE
  pico_stdlib
  pico_unique_id
  tinyusb_device
  tinyusb_board
)

set_target_properties(${PROJECT} PROPERTIES LINKER_LANGUAGE C)

# Uncomment this line to enable fix for Errata RP2040-E5 (the fix requires use of GPIO 15)
#target_compile_definitions(dev_hid_composite PUBLIC PICO_RP2040_USB_DEVICE_ENUMERATION_FIX=1)

