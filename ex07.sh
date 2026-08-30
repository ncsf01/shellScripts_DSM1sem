#!/bin/bash
opcao=0

while [ "$opcao" -ne 4 ]; do
    echo "=== BUSCA DE ARQUIVOS E COMANDOS ==="
    echo ""
    echo "1. Procurar arquivo usando 'find' (no diretório atual)"
    echo "2. Procurar comando usando 'whereis'"
    echo "3. Procurar arquivo usando 'locate' (no sistema todo)"
    echo "4. Sair"
    read -p "Opção desejada (1-4): " opcao

    case $opcao in
        1)
            read -p "Digite o nome do arquivo a buscar (ex: teste.txt): " nome
            echo ""
            echo "--- Buscando com 'find' ---"
            find . -name "$nome"
            ;;
        2)
            read -p "Digite o nome do comando a localizar (ex: bash, python3, ls): " cmd
            echo ""
            echo "--- Localização do comando com 'whereis' ---"
            whereis "$cmd"
            ;;
        3)
            read -p "Digite o nome do arquivo a localizar: " arq
            echo ""
            echo "--- Buscando com 'locate' ---"
            locate "$arq"
            ;;
        4)
            echo "Saindo..."
            ;;
        *)
            echo "Opção inválida! Escolha uma opção de 1 a 4."
            ;;
    esac

    echo ""
done
