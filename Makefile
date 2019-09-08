INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

ARCHS = arm64 arm64e
TARGET = iphone:clang:12.2:9.2

TWEAK_NAME = DNDPillEnabler

DNDPillEnabler_FILES = Tweak.x
DNDPillEnabler_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
