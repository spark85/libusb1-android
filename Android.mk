LOCAL_PATH:= $(call my-dir)

libusb1_src_files:= \
	libusb/core.c \
	libusb/descriptor.c \
	libusb/io.c \
	libusb/sync.c \
	libusb/os/linux_usbfs.c


libusb1_includes += $(LOCAL_PATH)/android \
	$(LOCAL_PATH)/libusb \
	$(LOCAL_PATH)/libusb/os 
    
libusb1_cflags := -W -Wall -fPIC -DPIC
ifeq ($(TARGET_BUILD_TYPE),release)
    libusb1_cflags += -O2
endif


include $(CLEAR_VARS)

LOCAL_CFLAGS := $(libusb1_cflags)
LOCAL_C_INCLUDES := $(libusb1_includes)
LOCAL_SRC_FILES := $(libusb1_src_files)
LOCAL_MODULE := libusb-1.0
LOCAL_MODULE_TAGS := optional
LOCAL_PRELINK_MODULE := false 
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_CFLAGS := $(libusb1_cflags)
LOCAL_C_INCLUDES := $(libusb1_includes)
LOCAL_SRC_FILES := $(libusb1_src_files)
LOCAL_MODULE := libusb-1.0
LOCAL_MODULE_TAGS := optional
LOCAL_PRELINK_MODULE := false 
include $(BUILD_STATIC_LIBRARY)
