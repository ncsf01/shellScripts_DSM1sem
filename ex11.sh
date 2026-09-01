#!/bin/bash

opcao=0

while [ "$opcao" -ne 3 ]; do
    echo "=== USUÁRIOS CONECTADOS ==="
    echo ""
    echo "1. Listagem simples (who)"
    echo "2. Listagem detalhada com cabeçalho (who -H -a)"
    echo "3. Sair"
    read -p "Opção (1-3): " op

    echo ""
    case $opcao in
        1)
            who
            echo ""
            echo "Esses são os usuários atualmente conectados ao sistema."
            ;;
        2)
            who -H -a
            echo ""
            echo "Esses são os usuários atualmente conectados ao sistema."
            ;;
        3)
            echo "Saindo do programa..."
            ;;
        *)
            echo "Opção inválida! Por favor, escolha entre 1, 2 ou 3."
            ;;
    esac

    echo ""
done
