#!/bin/bash

# Renkler
GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

run_test() {
    local desc="$1"
    local expected="$2"
    shift 2

    "$@" &> /dev/null
    local exit_code=$?

    if [ "$exit_code" -eq "$expected" ]; then
        echo -e "${GREEN}[PASS]${RESET} $desc (Exit: $exit_code)"
    else
        echo -e "${RED}[FAIL]${RESET} $desc (Beklenen: $expected, Gelen: $exit_code)"
        exit 1
    fi
}

echo "=== opdump Test Süiti Başlatılıyor ==="

# 1. Argümansız çağrı
run_test "Argümansız çağrı" 1 ./opdump

# 2. Fazla argüman çağrısı
run_test "Fazla argümanlı çağrı" 1 ./opdump a b c

# 3. Var olmayan hayalet dosya
run_test "Var olmayan dosya" 1 ./opdump __yok_boyle_bir_dosya_404__.bin

# 4. Okuma izni olmayan dosya (Permission Denied)
touch __gizli__.bin
chmod 000 __gizli__.bin
run_test "İzinsiz dosya okuma (chmod 000)" 1 ./opdump __gizli__.bin
rm -f __gizli__.bin

# 5. Boş dosya (0 byte)
touch __bos__.bin
run_test "Boş dosya dökümü (0 byte)" 0 ./opdump __bos__.bin
rm -f __bos__.bin

# 6. Normal dosya dökümü (kendi kaynak kodu)
run_test "Normal dosya okuma (main.c)" 0 ./opdump main.c

echo -e "${GREEN}=== Bütün Testler Başarıyla Geçti! ===${RESET}"
