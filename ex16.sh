#!/bin/bash

opcao=0

while [ "$opcao" -ne 6 ]; do
    echo "=== INFORMAÇÕES DO KERNEL E SISTEMA ==="
    echo ""
    echo "1. Ver todas as informações completas (uname -a)"
    echo "2. Nome do Kernel (uname -s)"
    echo "3. Versão / Release do Kernel (uname -r)"
    echo "4. Arquitetura da Máquina (uname -m)"
    echo "5. Nome do Host / Máquina (uname -n)"
    echo "6. Sair"
    echo ""
    read -p "Escolha uma opção (1-6): " opcao

    echo ""
    case $opcao in
        1)
            echo "Informações Gerais do Kernel"
            echo "----------------------------"
            uname -a
            ;;
        2)
            echo "Nome do Kernel:"
            echo "---------------"
            echo "$(uname -s)"
            ;;
        3)
            echo "Versão/Release do Kernel:"
            echo "-------------------------"
            echo "$(uname -r)"
            ;;
        4)
            echo "Arquitetura do Hardware:"
            echo "------------------------"
            echo "$(uname -m)"
            ;;
        5)
            echo "Nome da Máquina (Hostname):"
            echo "---------------------------"
            echo "$(uname -n)"
            ;;
        6)
            echo "Saindo das informações do kernel..."
            ;;
        *)
            echo "Opção inválida! Escolha de 1 a 6."
            ;;
    esac

    echo ""
done
