LOCAL_PATH := $(call my-dir)
ifeq ($(TARGET_DEVICE),logan)
    include $(all-subdir-makefiles)
endif
