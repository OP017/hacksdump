# hacksdump

Minimal 16-byte hex dumper in C11.

## Output

```text
0x0000	23 69 6e 63 6c 75 64 65 20 3c 73 74 64 64 65 66 	#include <stddef
0x0010	2e 68 3e 0a 23 69 6e 63 6c 75 64 65 20 3c 73 74 	.h>.#include <st
...
0x02f0	20 30 3b 0a 7d 0a                               	0;}.
```

## Build & Run

Requires a C11 compiler and `make`.

```bash
make
./hacksdump <filename>
```

## Test

```bash
make test
```
