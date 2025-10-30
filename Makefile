##################################################################################
# RyazhenkaAI Makefile (MSYS2/devkitA64-fixed, ARM64 only)
# Author: Dimasick-git
# Version: 1.0.0
##################################################################################

ifeq ($(strip $(DEVKITPRO)),)
$(error "Please set DEVKITPRO in your environment. export DEVKITPRO=<path to>/devkitpro")
endif

default:
	@echo "To build, run: make all"

include $(DEVKITPRO)/libnx/switch_rules

APP_TITLE    := RyazhenkaAI
APP_AUTHOR   := Dimasick-git
APP_VERSION  := 1.0.0
TARGET       := ryazhenkaai

SOURCES      := source
INCLUDES     := include
DATA         := lang themes
NO_ICON      := 1

# ЯВНО ARM64 компиляторы!
CC := $(DEVKITPRO)/devkitA64/bin/aarch64-none-elf-gcc
CXX := $(DEVKITPRO)/devkitA64/bin/aarch64-none-elf-g++
LD := $(DEVKITPRO)/devkitA64/bin/aarch64-none-elf-ld
AR := $(DEVKITPRO)/devkitA64/bin/aarch64-none-elf-ar
AS := $(DEVKITPRO)/devkitA64/bin/aarch64-none-elf-as
OBJCOPY := $(DEVKITPRO)/devkitA64/bin/aarch64-none-elf-objcopy
OBJDUMP := $(DEVKITPRO)/devkitA64/bin/aarch64-none-elf-objdump
STRIP := $(DEVKITPRO)/devkitA64/bin/aarch64-none-elf-strip

CFLAGS    := -g -Wall -O2 -ffunction-sections -fdata-sections
CXXFLAGS  := $(CFLAGS) -std=c++17
LDFLAGS   += -L$(DEVKITPRO)/libnx/lib
LIBS      := -lnx

all: $(TARGET).ovl

$(TARGET).ovl: $(TARGET).elf $(TARGET).nacp
	$(DEVKITPRO)/tools/bin/elf2nro $< $@ --nacp=$(TARGET).nacp

clean:
	rm -f *.o *.d *.elf *.nro *.nacp *.ovl
	rm -rf build
