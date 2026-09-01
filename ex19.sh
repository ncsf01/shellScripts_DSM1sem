#!/bin/bash
opcao=0

while [ "$opcao" -ne 7 ]; do
    echo "===== INFORMAÇÕES DO SISTEMA ====="
    echo "1 - Data atual"
    echo "2 - Versão do kernel"
    echo "3 - Calendário"
    echo "4 - Tempo de funcionamento"
    echo "5 - Usuários conectados"
    echo "6 - Processos em execução"
    echo "7 - Sair"
    read -p "Opção desejada (1-7): " op

    echo ""
    case $op in
        1) date ;;
        2) uname -a ;;
        3) cal ;;
        4) uptime ;;
        5) who ;;
        6) ps aux | head -n 20 ;;
        7) echo "Saindo..." ;;
        *) echo "Opção inválida!" ;;
    esac
    echo ""
done
