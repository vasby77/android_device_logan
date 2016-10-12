ifeq ($(TARGET_DEVICE),logan)
    LOCAL_PATH := $(call my-dir)
    include $(all-subdir-makefiles)
    include $(CLEAR_VARS)
endif
