#!/bin/bash

opcao=0

while [ "$opcao" -ne 2 ]; do
    echo "=== GERENCIADOR DE PROCESSOS DO SISTEMA ==="
    echo ""
    echo "1. Listar processos em execução"
    echo "2. Sair"
    echo ""
    read -p "Escolha uma opção (1-2): " opcao

    echo ""
    case $opcao in
        1)
            echo "------------------------------------------------------------------------"
            echo "ATENÇÃO: A listagem a seguir exibe todos os processos ativos no Linux."
            echo "As colunas mostram o Usuário dono (USER), o PID (ID do processo),"
            echo "o consumo de CPU/Memória (%CPU, %MEM) e o comando que deu origem a ele."
            echo "------------------------------------------------------------------------"
            echo ""
            
            read -p "Pressione [ENTER] para exibir a listagem..."
            echo ""

            ps aux | head -n 25
            
            echo ""
            ;;
        2)
            echo "Saindo..."
            ;;
        *)
            echo "Opção inválida! Escolha 1 ou 2."
            ;;
    esac

    echo ""
done
