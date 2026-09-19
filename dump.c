#include "dump.h"
#include <ctype.h>
#include <stddef.h>
#include <stdio.h>

void dump_line (size_t offset, size_t bytes_read, const unsigned char *buffer)
{
	printf("0x%04zx\t", offset);

	for (size_t i = 0; i < bytes_read; i++) {
	printf("%02x ", buffer[i]);
	}

	if (bytes_read < 16) {
	for (size_t i = 0; i < (16 - bytes_read); i++) {
	printf("   ");
	}
	}

	printf("\t");

	for (size_t i = 0; i < bytes_read; i++) {
	if (isprint(buffer[i])) {
	printf("%c", buffer[i]);
	}
	else {
	printf(".");
	}
	}

	printf("\n");
}

