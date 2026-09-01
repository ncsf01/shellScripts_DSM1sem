#!/bin/bash

opcao=0

while [ "$opcao" -ne 2 ]; do
    echo "=== ALTERAR PERMISSÕES (chmod) ==="
    echo ""
    echo "1. Escolher arquivo e permissão"
    echo "2. Sair"
    echo ""
    
    read -p "Opção desejada (1-2): " opcao
    echo ""

    case $opcao in
        1)
            read -p "Digite o nome (ou caminho) do arquivo: " arquivo
            
            if [ -e "$arquivo" ]; then
                echo ""
                echo "Escolha a permissão desejada:"
                echo "1. 644 (Leitura/Escrita p/ dono, apenas Leitura p/ outros)"
                echo "2. 755 (Acesso total p/ dono, Leitura/Execução p/ outros)"
                echo "3. 700 (Acesso total APENAS p/ o dono)"
                echo "4. Digitar outra permissão octal manualmente"
                read -p "Opção (1-4): " op
                
                perm=""
                case $op in
                    1) perm="644" ;;
                    2) perm="755" ;;
                    3) perm="700" ;;
                    4) read -p "Digite a permissão desejada (ex: 777): " perm ;;
                    *) echo "Opção inválida de permissão!" ;;
                esac
                
                if [ -n "$perm" ]; then
                    chmod "$perm" "$arquivo"
                    echo ""
                    echo "Sucesso: A permissão do arquivo '$arquivo' foi modificada para $perm!"
                fi
            else
                echo "Erro: O arquivo ou diretório '$arquivo' não existe!"
            fi
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
