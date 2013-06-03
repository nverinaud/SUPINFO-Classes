ifeq ($(GNUSTEP_MAKEFILES),)
 GNUSTEP_MAKEFILES := $(shell gnustep-config --variable=GNUSTEP_MAKEFILES 2>/dev/null)
endif

ifeq ($(GNUSTEP_MAKEFILES),)
 $(error You need to set GNUSTEP_MAKEFILES before compiling!)
endif


include $(GNUSTEP_MAKEFILES)/common.make

ADDITIONAL_FLAGS += -std=gnu99

TOOL_NAME = Operations
Operations_OBJC_FILES = main.m DownloadOperation.m ConversionOperation.m DeleteOperation.m
Operations_HEADERS = DownloadOperation.h ConversionOperation.h DeleteOperation.h
￼ADDITIONAL_FLAGS += `pkg-config MagickWand --cflags`
Operations_LDFLAGS = `pkg-config MagickWand --libs` -ldispatch -lxdispatch

include $(GNUSTEP_MAKEFILES)/tool.make