# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ifeq ($(filter-out exynos5,$(TARGET_BOARD_PLATFORM)),)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_PRELINK_MODULE := false
LOCAL_SHARED_LIBRARIES := liblog libutils libcutils libexynosutils libexynosv4l2 libsync libhdmi libdisplay

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/../../exynos5/include \
	$(TOP)/hardware/samsung_slsi/exynos/include \
	$(TOP)/hardware/samsung_slsi/exynos/libexynosutils \
	$(TOP)/hardware/samsung_slsi/$(TARGET_SOC)/include \
	$(TOP)/hardware/samsung_slsi/$(TARGET_SOC)/libhwcmodule \
	$(TOP)/hardware/samsung_slsi/exynos/libhwc \
	$(TOP)/hardware/samsung_slsi/exynos/libhwcutils \
	$(TOP)/hardware/samsung_slsi/exynos/libdisplay

ifeq ($(BOARD_HDMI_INCAPABLE), true)
LOCAL_C_INCLUDES += $(TOP)/hardware/samsung_slsi/exynos/libhdmi_dummy
else
ifeq ($(BOARD_USES_NEW_HDMI), true)
LOCAL_C_INCLUDES += $(TOP)/hardware/samsung_slsi/exynos/libhdmi
else
LOCAL_C_INCLUDES += $(TOP)/hardware/samsung_slsi/exynos/libhdmi_legacy
endif
endif

LOCAL_SRC_FILES := \
	ExynosExternalDisplayModule.cpp

LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := libhdmimodule
include $(BUILD_SHARED_LIBRARY)

endif
