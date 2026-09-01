#!/bin/bash

opcao=0

while [ "$opcao" -ne 2 ]; do
    echo "=== PROCURAR PROCESSO EM EXECUÇÃO ==="
    echo ""
    echo "1. Buscar um processo por nome"
    echo "2. Sair"
    echo ""
    read -p "Escolha uma opção (1-2): " opcao

    echo ""
    case $opcao in
        1)
            read -p "Digite o nome do processo que deseja procurar (ex: firefox, bash): " proc

            resultado=$(ps aux | grep -i "$proc" | grep -v "grep")

            echo ""
            
            if [ -n "$resultado" ]; then
                echo "Processo(s) encontrado(s):"
                echo "----------------------"
                echo "$resultado"
            else
                echo "Aviso: Nenhum processo referente a '$proc' foi encontrado em execução."
            fi
            ;;
        2)
            echo "Saindo da busca de processos..."
            ;;
        *)
            echo "Opção inválida! Escolha 1 ou 2."
            ;;
    esac

    echo ""
done
