$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Add this line if your device is 64-bit
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
# Otherwise, If you have 32-bit device, add the below line instead of above line
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_minimal.mk

# Another common config inclusion
$(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)

# If you are building from OmniROM's minimal source, Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Replace ${1601} with your Device Name's Value.
# Replace ${vivo} with your Brand's / Manufacturer's Value.
PRODUCT_COPY_FILES += device/${vivo}/${1601}/prebuilt/kernel:kernel
# Fles under $(LOCAL_PATH)/recovery/root/ gets automatically copied into recovery
# PRODUCT_COPY_FILES += $(LOCAL_PATH)/recovery/root/*:root/*

PRODUCT_DEVICE := ${1601}
PRODUCT_NAME := omni_${1601}
PRODUCT_BRAND := ${vivo}
PRODUCT_MODEL := ${1601}
PRODUCT_MANUFACTURER := ${vivo}

# Forcefully add mtp support (adb is already there)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Add fingerprint from Stock ROM build.prop
PRODUCT_BUILD_PROP_OVERRIDES += \
    # These lines are from my device. You MUST Replace yours.
    BUILD_FINGERPRINT="vivo/1601/1601:6.0/MRA58K/1603939851:user/release-keys" \
    PRIVATE_BUILD_DESC="full_bbk6750_66_m-user 6.0 MRA58K 1603939851 release-keys"