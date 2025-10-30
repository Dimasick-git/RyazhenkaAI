##################################################################################
# RyazhenkaAI Makefile (flat, no build/Makefile)
# Author: Dimasick-git
# Version: 1.0.0
##################################################################################

ifeq ($(strip $(DEVKITPRO)),)
$(error "Please set DEVKITPRO in your environment. export DEVKITPRO=<path to>/devkitpro")
endif
include $(DEVKITPRO)/libnx/switch_rules

APP_TITLE    := RyazhenkaAI
APP_AUTHOR   := Dimasick-git
APP_VERSION  := 1.0.0
TARGET       := ryazhenkaai

SOURCES      := source
INCLUDES     := include
DATA         := lang themes
NO_ICON      := 1

CFLAGS    := -g -Wall -O2 -ffunction-sections -fdata-sections
CXXFLAGS  := $(CFLAGS) -std=c++17
LIBS      := -lnx

all: $(TARGET).ovl

$(TARGET).ovl: $(TARGET).elf $(TARGET).nacp
	elf2nro $< $@ --nacp=$(TARGET).nacp

clean:
	rm -f *.o *.d *.elf *.nro *.nacp *.ovl
	rm -rf build
