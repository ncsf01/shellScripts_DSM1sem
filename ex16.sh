#!/bin/bash

echo "Informações do Kernel"
echo "---------------------"
uname -a
echo ""

echo "=== DETALHAMENTO (Desafio) ==="
echo "1. Somente o Nome do Kernel (uname -s)"
echo "2. Somente a Versão/Release (uname -r)"
echo "3. Somente a Arquitetura da Máquina (uname -m)"
read -p "Escolha um detalhe para ver isolado (1-3) ou aperte Enter para sair: " op

case $op in
    1) echo "Kernel: $(uname -s)" ;;
    2) echo "Release: $(uname -r)" ;;
    3) echo "Arquitetura: $(uname -m)" ;;
esac
