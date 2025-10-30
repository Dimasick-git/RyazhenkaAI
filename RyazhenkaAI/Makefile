##################################################################################
# Makefile for RyazhenkaAI Overlay
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
SOURCES      := source \
                # + любые доп исходники
INCLUDES     := include \
                # + любые доп инклюды
DATA         := lang themes
NO_ICON      := 1

CFLAGS       := -g -Wall -O2 -ffunction-sections -fdata-sections
CXXFLAGS     := $(CFLAGS) -std=c++17
LIBS         := -lnx

all: $(BUILD)

$(BUILD):
	@[ -d $@ ] || mkdir -p $@
	@$(MAKE) --no-print-directory -C $@ -f $(CURDIR)/Makefile

clean:
	rm -fr $(BUILD) $(TARGET).ovl $(TARGET).nro $(TARGET).nacp $(TARGET).elf
	rm -rf out/
	rm -f $(TARGET).zip
