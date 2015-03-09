# Release name
PRODUCT_RELEASE_NAME := GT-S7270

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/logan/device_logan.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := logan
PRODUCT_NAME := cm_logan
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := GT-S7270
PRODUCT_CHARACTERISTICS := phone
