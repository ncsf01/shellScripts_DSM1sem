#!/bin/bash

opcao=0

while [ "$opcao" -ne 2 ]; do
    echo "=== INFORMAÇÕES DE USUÁRIO ==="
    echo ""
    echo "1. Procurar usuário"
    echo "2. Sair"
    echo ""
    read -p "Opção (1-2): " opcao  # Ajustado para salvar na variável 'opcao'
    
    case $opcao in
        1)
            echo ""
            read -p "Digite o nome exato do usuário: " user
            
            # Busca direta e exata no /etc/passwd (ou via getent)
            linha_passwd=$(getent passwd "$user")
            
            if [ -z "$linha_passwd" ]; then
                echo "Erro: usuário '$user' não existe no sistema!"
            else
                diretorio_home=$(echo "$linha_passwd" | cut -d: -f6)
                
                echo ""
                echo "=== INFORMAÇÕES DE $user ==="
                echo "Nome do usuário: $user"
                echo "Diretório de trabalho (HOME): $diretorio_home"
                
                if [ -d "$diretorio_home" ]; then
                    espaco_disco=$(du -sh "$diretorio_home" 2>/dev/null | cut -f1)
                    echo "Espaço utilizado no disco: $espaco_disco"
                else
                    echo "Aviso: Diretório HOME não foi encontrado no disco ($diretorio_home)"
                fi
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
