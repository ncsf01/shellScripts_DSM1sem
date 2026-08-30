#!/bin/bash

echo "=================================================="
echo "          PAINEL DE INFORMAÇÕES DO SISTEMA        "
echo "=================================================="
echo ""

echo "[1. DATA E HORA ATUAL]"
date "+%A, %d de %B de %Y - %H:%M:%S"
echo ""

echo "[2. VERSÃO DO KERNEL]"
uname -sr
echo ""

echo "[3. CALENDÁRIO DO MÊS ATUAL]"
cal
echo ""

echo "[4. TEMPO DE FUNCIONAMENTO (UPTIME)]"
uptime -p
echo ""
echo "=================================================="
