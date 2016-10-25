LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),logan)
LOCAL_PATH := $(call my-dir)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
