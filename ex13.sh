#!/bin/bash

echo "=== PROCESSOS EM EXECUÇÃO NO SISTEMA ==="
echo "A lista a seguir exibe todos os processos ativos, o usuário dono de cada um,"
echo "o consumo de CPU/Memória e o comando que deu origem ao processo."
echo "-------------------------------------------------------------------------"
echo ""
read -p "Pressione [ENTER] para exibir a listagem..."

ps aux | head -n 25
echo ""
echo "(Exibindo as primeiras 25 linhas para não poluir o terminal)"
