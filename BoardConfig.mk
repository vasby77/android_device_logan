USE_CAMERA_STUB := true
USE_NINJA := false
#TARGET_NO_RECOVERY := true

# inherit from the proprietary version
-include vendor/samsung/logan/BoardConfigVendor.mk

LOCAL_PATH := device/samsung/logan

# Platform
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := hawaii
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOOTLOADER_BOARD_NAME := hawaii
#TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
#TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp

# Assert
TARGET_OTA_ASSERT_DEVICE := logan,S7270,GT-S7270,hawaii

# Kernel
BOARD_KERNEL_BASE := 0x82000000
BOARD_KERNEL_PAGESIZE := 4096
TARGET_KERNEL_CONFIG := bcm21664_hawaii_ss_logan_rev03_cm_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/logan
#TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.6
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin

# PARTITION SIZE
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1395654656
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2189426688
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 262144 #BOARD_KERNEL_PAGESIZE * 64

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/logan/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/logan/bluetooth/libbt_vndcfg_s7270.txt

# Connectivity - Wi-Fi
BOARD_HAVE_SAMSUNG_WIFI                     := true
BOARD_WLAN_DEVICE                           := bcmdhd
BOARD_WLAN_DEVICE_REV                       := bcm4330_b1
WPA_BUILD_SUPPLICANT                        := true
BOARD_WPA_SUPPLICANT_DRIVER                 := NL80211
WPA_SUPPLICANT_VERSION                      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB            := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER                        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB                   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM                   := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA                     := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP                      := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P                     := "/system/etc/wifi/bcmdhd_p2p.bin"
WIFI_DRIVER_MODULE_PATH                     := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_MODULE_NAME                     := "dhd"
WIFI_DRIVER_MODULE_ARG                      := "firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG                   := "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_BAND                                   := 802_11_ABG

# Resolution
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Hardware rendering
USE_OPENGL_RENDERER := true
BOARD_USE_MHEAP_SCREENSHOT := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_USES_ION := true
HWUI_COMPILE_FOR_PERF := true
#TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
#COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS -DHAWAII_HWC -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL

# Camera
#BOARD_USE_METADATABUFFERTYPE := true
#BOARD_USE_STOREMETADATA := true

# opengl
BOARD_USE_BGRA_8888 := true

# Enable dex-preoptimization to speed up the first boot sequence
# of an SDK AVD. Note that this operation only works on Linux for now
ifeq ($(HOST_OS),linux)
  ifeq ($(WITH_DEXPREOPT),)
    WITH_DEXPREOPT := true
  endif
endif

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Charger
BOARD_BATTERY_DEVICE_NAME := battery
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
CHARGING_ENABLED_PATH := "/sys/class/power_supply/battery/batt_lp_charging"
BACKLIGHT_PATH := "/sys/class/backlight/panel/brightness"

# healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd-logan.hawaii

# Use the CM PowerHAL
TARGET_USES_CM_POWERHAL := true
CM_POWERHAL_EXTENSION := hawaii
TARGET_POWERHAL_VARIANT = cm

# RIL
BOARD_RIL_CLASS := ../../../device/samsung/logan/ril/
#COMMON_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING

# Recovery
#TARGET_RECOVERY_INITRC := 
TARGET_RECOVERY_FSTAB := device/samsung/logan/ramdisk/fstab.hawaii_ss_logan
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_RECOVERY_HANDLES_MOUNT := true
BOARD_USES_MMCUTILS := false
BOARD_RECOVERY_ALWAYS_WIPES := false
BOARD_SUPPRESS_EMMC_WIPE := true
TARGET_RECOVERY_DENSITY := hdpi

# Vold
BOARD_UMS_LUNFILE                  := /sys/class/android_usb/f_mass_storage/lun/file
TARGET_USE_CUSTOM_LUN_FILE_PATH    := /sys/class/android_usb/android0/f_mass_storage/lun/file
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR   := true
BOARD_VOLD_MAX_PARTITIONS          := 19

# CMHW
BOARD_HARDWARE_CLASS := hardware/samsung/cmhw/ device/samsung/logan/cmhw/

# GPS
TARGET_SPECIFIC_HEADER_PATH := device/samsung/logan/include

# MTP
BOARD_MTP_DEVICE := /dev/mtp_usb

# jemalloc causes a lot of random crash on free()
#MALLOC_IMPL := dlmalloc

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/samsung/logan/sepolicy
