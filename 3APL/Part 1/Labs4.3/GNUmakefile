ifeq ($(GNUSTEP_MAKEFILES),)
 GNUSTEP_MAKEFILES := $(shell gnustep-config --variable=GNUSTEP_MAKEFILES 2>/dev/null)
endif

ifeq ($(GNUSTEP_MAKEFILES),)
 $(error You need to set GNUSTEP_MAKEFILES before compiling!)
endif


include $(GNUSTEP_MAKEFILES)/common.make

ADDITIONAL_FLAGS += -std=gnu99
ADDITIONAL_OBJC_LIBS = /usr/local/lib/libtiff.dylib # http://www.gnustep.org/resources/documentation/make_1.html#SEC28

TOOL_NAME = MsgForwarding
MsgForwarding_OBJC_FILES = main.m RealTIFFImage.m TIFFImage.m
MsgForwarding_HEADERS = RealTIFFImage.h TIFFImage.h

include $(GNUSTEP_MAKEFILES)/tool.make