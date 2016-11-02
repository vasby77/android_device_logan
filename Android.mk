LOCAL_PATH := $(call my-dir)
ifeq ($(TARGET_DEVICE),logan)
    include $(call all-makefiles-under,$(LOCAL_PATH))
endif

LOCAL_CLANG := false
