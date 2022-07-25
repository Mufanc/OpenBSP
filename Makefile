.ONESHELL : # Applies to every targets in the file!
.PHONY : target flash clean install-deps

# Set default shell as "bash"
SHELL	:= bash

# Output directory
OUTDIR	:= build

SRCS	:= $(shell find src -name "*.c")
DEPS    := $(shell find src -name "*.h") $(SRCS)
TARGET	:= target.ihx

# Configure internal and external RAM size
IRAM	:= 256
XRAM	:= 2048

CFLAGS	:= --iram-size $(IRAM) --xram-size $(XRAM) --Werror

target: $(DEPS) clean
	@for FILE in $(SRCS);                                   \
	do                                                      \
	    sdcc -I include -c $(CFLAGS) -o $(OUTDIR)/ $$FILE;  \
	done
	sdcc -o $(OUTDIR)/$(TARGET) $(OUTDIR)/*.rel

flash: target
	stcgal $(OUTDIR)/$(TARGET)

clean:
	rm -f $(OUTDIR)/*

install-deps:
	sudo apt-get install -y sdcc
	pip install stcgal