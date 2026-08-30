#!/bin/bash

echo "=== USUÁRIOS CONECTADOS ==="
echo ""
echo "1. Listagem simples (who)"
echo "2. Listagem detalhada com cabeçalho (who -H -a) - Desafio"
read -p "Opção (1-2): " op

echo ""
case $op in
    1)
        who
        ;;
    2)
        who -H -a
        ;;
    *)
        echo "Opção inválida, exibindo listagem simples:"
        who
        ;;
esac

echo ""
echo "Esses são os usuários atualmente conectados ao sistema."
