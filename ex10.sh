#!/bin/bash
opcao=0

while [ "$opcao" -ne 3 ]; do
    echo "=== COMPACTADOR / DESCOMPACTADOR (.tar.gz) ==="
    echo ""
    echo "1. Compactar arquivo ou diretório"
    echo "2. Descompactar arquivo .tar.gz"
    echo "3. Sair"
    read -p "Opção desejada (1-3): " opcao

    case $opcao in
        1)
            read -p "Digite o nome do arquivo ou pasta a compactar: " alvo
            
            if [ ! -e "$alvo" ]; then
                echo "Erro: O arquivo ou diretório '$alvo' não existe!"
            else
                read -p "Digite o nome do arquivo final (ex: meu_pacote.tar.gz): " pacote
                
                if [[ "$pacote" != *.tar.gz ]]; then
                    pacote="${pacote}.tar.gz"
                fi
                
                echo ""
                echo "--- Compactando... ---"
                # -czvf: Create, gzip, Verbose, File
                tar -czvf "$pacote" "$alvo"
                
                echo ""
                echo "Sucesso: '$alvo' foi compactado em '$pacote'!"
            fi
            ;;
        2)
            read -p "Digite o nome do arquivo .tar.gz a descompactar: " pacote
            
            if [ ! -f "$pacote" ]; then
                echo "Erro: O arquivo '$pacote' não existe!"
            else
                echo ""
                echo "--- Descompactando... ---"
                # -xzvf: eXtract, gzip, Verbose, File
                tar -xzvf "$pacote"
                
                echo ""
                echo "Sucesso: Conteúdo de '$pacote' extraído no diretório atual!"
            fi
            ;;
        3)
            echo "Saindo..."
            ;;
        *)
            echo "Opção inválida! Escolha de 1 a 3."
            ;;
    esac

    echo ""
done
