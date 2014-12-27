$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product-if-exists, vendor/samsung/logan/logan-common-vendor.mk)

# Use high-density artwork where available
PRODUCT_LOCALES += hdpi
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

DEVICE_PACKAGE_OVERLAYS += device/samsung/logan/overlay

# Init files
PRODUCT_COPY_FILES += \
	device/samsung/logan/ramdisk/fstab.hawaii_ss_logan:root/fstab.hawaii_ss_logan \
	device/samsung/logan/ramdisk/init.hawaii_ss_logan.rc:root/init.hawaii_ss_logan.rc \
	device/samsung/logan/ramdisk/init.bcm2166x.usb.rc:root/init.bcm2166x.usb.rc \
	device/samsung/logan/ramdisk/init.log.rc:root/init.log.rc \
	device/samsung/logan/ramdisk/ueventd.hawaii_ss_logan.rc:root/ueventd.hawaii_ss_logan.rc \
	device/samsung/logan/ramdisk/recovery/init.recovery.hawaii_ss_logan.rc:root/init.recovery.hawaii_ss_logan.rc

PRODUCT_COPY_FILES += \
	device/samsung/logan/configs/media_profiles.xml:system/etc/media_profiles.xml \
	device/samsung/logan/configs/audio_policy.conf:system/etc/audio_policy.conf \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
	device/samsung/logan/configs/media_codecs.xml:system/etc/media_codecs.xml 

# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
	device/samsung/logan/keylayouts/bcm_headset.kl:system/usr/keylayout/bcm_headset.kl \
	device/samsung/logan/keylayouts/bcm_keypad_v2.kl:system/usr/keylayout/bcm_keypad_v2.kl \
	device/samsung/logan/keylayouts/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	device/samsung/logan/keylayouts/samsung-keypad.kl:system/usr/keylayout/samsung-keypad.kl

# Copy Apps
#PRODUCT_COPY_FILES += \
#        device/samsung/baffinlite/MultiSIM-Toggle.apk:system/app/MultiSIM-Toggle.apk

# Insecure ADBD
#ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.adb.secure=3 \
	persist.sys.root_access=3

# Filesystem management tools
PRODUCT_PACKAGES += \
	setup_fs 
	
#
PRODUCT_PACKAGES += \
	libexifa \
	libjpega
		
# Usb accessory
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# Audio modules
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default
	
USE_CUSTOM_AUDIO_POLICY := 1	

# Device-specific packages
PRODUCT_PACKAGES += \
	SamsungServiceMode \
	Torch

# Charger
PRODUCT_PACKAGES += \
	charger_res_images
	
# Wi-Fi
PRODUCT_PACKAGES += \
	dhcpcd.conf \
	hostapd \
	wpa_supplicant \
	wpa_supplicant.conf	

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Support for Browser's saved page feature. This allows
# for pages saved on previous versions of the OS to be
# viewed on the current OS.
PRODUCT_PACKAGES += \
    libskia_legacy

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    mobiledata.interfaces=rmnet0 \
    ro.telephony.ril_class=SamsungBCMRIL \
    ro.zygote.disable_gl_preload=true \
	cm.updater.uri=http://lanserver.pp.ua/cm/ \
    persist.radio.multisim.config=none \
	ro.telephony.call_ring.multiple=0 \
	ro.telephony.call_ring=0
    
# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# MTP
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Dalvik heap config
include frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

ifeq ($(TARGET_BUILD_VARIANT),user)      
else      
endif

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_logan
PRODUCT_DEVICE := logan
PRODUCT_MODEL := GT-S7270
