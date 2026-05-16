# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file LICENSE.rst or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "/aur/picow_ps2kb_to_ble_usb/build/_deps/picotool-src")
  file(MAKE_DIRECTORY "/aur/picow_ps2kb_to_ble_usb/build/_deps/picotool-src")
endif()
file(MAKE_DIRECTORY
  "/aur/picow_ps2kb_to_ble_usb/build/_deps/picotool-build"
  "/aur/picow_ps2kb_to_ble_usb/build/_deps"
  "/aur/picow_ps2kb_to_ble_usb/build/picotool/tmp"
  "/aur/picow_ps2kb_to_ble_usb/build/picotool/src/picotoolBuild-stamp"
  "/aur/picow_ps2kb_to_ble_usb/build/picotool/src"
  "/aur/picow_ps2kb_to_ble_usb/build/picotool/src/picotoolBuild-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/aur/picow_ps2kb_to_ble_usb/build/picotool/src/picotoolBuild-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/aur/picow_ps2kb_to_ble_usb/build/picotool/src/picotoolBuild-stamp${cfgdir}") # cfgdir has leading slash
endif()
