LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

#LOCAL_ARM_MODE := arm

LOCAL_SRC_FILES:= \
	libusb/core.c \
	libusb/descriptor.c \
	libusb/io.c \
	libusb/sync.c \
	libusb/os/linux_usbfs.c


LOCAL_C_INCLUDES += $(LOCAL_PATH)/android \
	$(LOCAL_PATH)/libusb \
	$(LOCAL_PATH)/libusb/os 

LOCAL_CFLAGS += -W -Wall
LOCAL_CFLAGS += -fPIC -DPIC


ifeq ($(TARGET_BUILD_TYPE),release)
	LOCAL_CFLAGS += -O2
endif

LOCAL_MODULE:= libusb
LOCAL_MODULE_TAGS := optional
LOCAL_PRELINK_MODULE := false 
include $(BUILD_SHARED_LIBRARY)


