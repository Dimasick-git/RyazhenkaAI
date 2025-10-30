##################################################################################
# RyazhenkaAI Makefile
# Author: Dimasick-git
# Version: 1.0.0
##################################################################################

ifeq ($(strip $(DEVKITPRO)),)
$(error "Please set DEVKITPRO in your environment. export DEVKITPRO=<path to>/devkitpro")
endif
TOPDIR ?= $(CURDIR)
include $(DEVKITPRO)/libnx/switch_rules

APP_TITLE    := RyazhenkaAI
APP_AUTHOR   := Dimasick-git
APP_VERSION  := 1.0.0
TARGET       := ryazhenkaai
BUILD        := build
SOURCES      := source
INCLUDES     := include
DATA         := lang themes
NO_ICON      := 1

CFLAGS    := -g -Wall -O2 -ffunction-sections -fdata-sections
CXXFLAGS  := $(CFLAGS) -std=c++17
LIBS      := -lnx

all: $(BUILD)

$(BUILD):
	@mkdir -p $(BUILD)
	@$(MAKE) --no-print-directory -C $(BUILD) -f $(CURDIR)/Makefile

clean:
	rm -fr $(BUILD) $(TARGET).ovl $(TARGET).nro $(TARGET).nacp $(TARGET).elf
	rm -rf out/
	rm -f $(TARGET).zip
