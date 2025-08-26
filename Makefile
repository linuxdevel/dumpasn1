CC = gcc
CFLAGS = -Wall -Wextra -O2
TARGET = dumpasn1
SRC = dumpasn1.c
CONFIG_FILE = dumpasn1.cfg

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $@ $<

install: $(TARGET)
	@echo "Installing $(TARGET) to /usr/local/bin/"
	@sudo install -m 755 $(TARGET) /usr/local/bin/
	@echo "Installing $(CONFIG_FILE) to /usr/local/bin/"
	@sudo install -m 644 $(CONFIG_FILE) /usr/local/bin/

uninstall:
	@echo "Removing $(TARGET) from /usr/local/bin/"
	@sudo rm -f /usr/local/bin/$(TARGET)
	@echo "Removing $(CONFIG_FILE) from /usr/local/bin/"
	@sudo rm -f /usr/local/bin/$(CONFIG_FILE)

clean:
	rm -f $(TARGET) *.o

.PHONY: all install uninstall clean
