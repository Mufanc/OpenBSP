.ONESHELL : # Applies to every targets in the file!
.PHONY : target flash clean install

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
	for FILE in $(SRCS);                                    \
	do                                                      \
	    sdcc -I include -c $(CFLAGS) -o $(OUTDIR)/ $$FILE;  \
	done
	sdcc -o $(OUTDIR)/$(TARGET) $(OUTDIR)/*.rel

flash: target
	source venv/bin/activate
	sudo chmod 666 /dev/ttyUSB0
	stcgal $(OUTDIR)/$(TARGET)

clean:
	rm -f $(OUTDIR)/*

install:
	sudo apt install sdcc
	python3 -m venv venv
	source venv/bin/activate
	pip3 install stcgal
