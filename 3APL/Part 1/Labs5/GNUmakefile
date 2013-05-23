ifeq ($(GNUSTEP_MAKEFILES),)
 GNUSTEP_MAKEFILES := $(shell gnustep-config --variable=GNUSTEP_MAKEFILES 2>/dev/null)
endif

ifeq ($(GNUSTEP_MAKEFILES),)
 $(error You need to set GNUSTEP_MAKEFILES before compiling!)
endif


include $(GNUSTEP_MAKEFILES)/common.make

ADDITIONAL_FLAGS += -std=c99

TOOL_NAME = zoo
zoo_OBJC_FILES = main.m Animal.m Dog.m Monkey.m Cow.m Donkey.m CatLike.m ZooDirector.m Zoo.m
zoo_HEADERS = ZooKit.h Animal.h Dog.h Monkey.h Cow.h Donkey.h CatLike.h ZooDirector.h Zoo.h

include $(GNUSTEP_MAKEFILES)/tool.make