ifeq ($(GNUSTEP_MAKEFILES),)
 GNUSTEP_MAKEFILES := $(shell gnustep-config --variable=GNUSTEP_MAKEFILES 2>/dev/null)
endif

ifeq ($(GNUSTEP_MAKEFILES),)
 $(error You need to set GNUSTEP_MAKEFILES before compiling!)
endif


include $(GNUSTEP_MAKEFILES)/common.make

ADDITIONAL_FLAGS += -std=c99

TOOL_NAME = Introspection
Introspection_OBJC_FILES = main.m Foo.m NSStringDynamicMethodsAdd.m
Introspection_C_FILES = Dumper.c
Introspection_HEADERS = Foo.h Dumper.h NSStringDynamicMethodsAdd.h

include $(GNUSTEP_MAKEFILES)/tool.make