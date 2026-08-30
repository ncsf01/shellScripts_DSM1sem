#!/bin/bash
op=0

while [ "$op" -ne 7 ]; do
    echo "===== GERENCIAMENTO DE ARQUIVOS ====="
    echo "1 - Procurar arquivo"
    echo "2 - Procurar palavra em arquivo"
    echo "3 - Renomear arquivo"
    echo "4 - Mover arquivo"
    echo "5 - Remover arquivo"
    echo "6 - Comparar arquivos"
    echo "7 - Sair"
    read -p "Opção desejada (1-7): " op

    echo ""
    case $op in
        1)
            read -p "Nome do arquivo a procurar: " arq
            find . -name "$arq"
            ;;
        2)
            read -p "Palavra a buscar: " palavra
            read -p "Arquivo onde buscar: " arq
            if [ -f "$arq" ]; then
                grep -i --color=auto "$palavra" "$arq"
            else
                echo "Arquivo não existe!"
            fi
            ;;
        3)
            read -p "Nome atual do arquivo: " orig
            read -p "Novo nome: " novo
            [ -e "$orig" ] && mv "$orig" "$novo" && echo "Arquivo renomeado!" || echo "Arquivo de origem não existe!"
            ;;
        4)
            read -p "Arquivo a mover: " arq
            read -p "Pasta de destino: " dest
            [ -e "$arq" ] && mv "$arq" "$dest" && echo "Arquivo movido!" || echo "Erro na operação!"
            ;;
        5)
            read -p "Arquivo a remover: " arq
            if [ -e "$arq" ]; then
                read -p "Tem certeza que deseja apagar '$arq'? (s/n): " conf
                [ "$conf" = "s" ] && rm -r "$arq" && echo "Removido com sucesso!"
            else
                echo "Arquivo não existe!"
            fi
            ;;
        6)
            read -p "Primeiro arquivo: " a1
            read -p "Segundo arquivo: " a2
            if diff -q "$a1" "$a2" > /dev/null 2>&1; then
                echo "Os arquivos são IDÊNTICOS."
            else
                echo "Os arquivos POSSUEM DIFERENÇAS."
            fi
            ;;
        7)
            echo "Saindo do gerenciador..."
            ;;
        *)
            echo "Opção inválida!"
            ;;
    esac
    echo ""
done
