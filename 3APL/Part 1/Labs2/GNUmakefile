ifeq ($(GNUSTEP_MAKEFILES),)
 GNUSTEP_MAKEFILES := $(shell gnustep-config --variable=GNUSTEP_MAKEFILES 2>/dev/null)
endif

ifeq ($(GNUSTEP_MAKEFILES),)
 $(error You need to set GNUSTEP_MAKEFILES before compiling!)
endif


include $(GNUSTEP_MAKEFILES)/common.make

TOOL_NAME = zoo
zoo_OBJC_FILES = main.m Animal.m
zoo_HEADERS = Animal.h

include $(GNUSTEP_MAKEFILES)/tool.make