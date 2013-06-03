ifeq ($(GNUSTEP_MAKEFILES),)
 GNUSTEP_MAKEFILES := $(shell gnustep-config --variable=GNUSTEP_MAKEFILES 2>/dev/null)
endif

ifeq ($(GNUSTEP_MAKEFILES),)
 $(error You need to set GNUSTEP_MAKEFILES before compiling!)
endif


include $(GNUSTEP_MAKEFILES)/common.make

ADDITIONAL_FLAGS += -std=gnu99

TOOL_NAME = gcd
gcd_OBJC_FILES = main.m
gcd_HEADERS = 
gcd += -ldispatch -lxdispatch

include $(GNUSTEP_MAKEFILES)/tool.make