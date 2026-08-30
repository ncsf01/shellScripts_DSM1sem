#!/bin/bash

echo "=== ENCERRAR PROCESSO (kill) ==="
echo ""

read -p "Digite o PID (número do processo) que deseja encerrar: " pid

# 1. Checagem se o PID existe no sistema (Desafio)
if ! ps -p "$pid" > /dev/null 2>&1; then
    echo "Erro: O PID $pid não existe ou não está em execução no momento!"
    exit 1
fi

echo ""
echo "--- Informações do Processo $pid ---"
ps -p "$pid" -o pid,user,comm
echo "-----------------------------------"
echo ""

read -p "Deseja realmente encerrar esse processo? (s/n): " confirma

if [ "$confirma" = "s" ] || [ "$confirma" = "S" ]; then
    kill -9 "$pid"
    echo "Comando enviado. O processo $pid foi encerrado."
else
    echo "Operação cancelada. O processo continua em execução."
fi
