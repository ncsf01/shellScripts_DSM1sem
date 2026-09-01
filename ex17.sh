#!/bin/bash

opcao=0

while [ "$opcao" -ne 4 ]; do
    echo "=== ESTATÍSTICAS DE ARQUIVO (wc) ==="
    echo ""
    echo "1. Criar um arquivo de teste rápido (exemplo.txt)"
    echo "2. Listar arquivos .txt no diretório atual"
    echo "3. Contar linhas, palavras e caracteres de um arquivo"
    echo "4. Sair"
    echo ""
    read -p "Escolha uma opção (1-4): " opcao

    echo ""
    case $opcao in
        1)
            cat << 'EOF' > exemplo.txt
Olá, este é um arquivo de teste para o script Shell.
Ele possui exatamente três linhas de texto.
Aprender comandos Linux é fundamental para automação!
EOF
            echo "Arquivo 'exemplo.txt' gerado com sucesso!"
            echo "Conteúdo criado:"
            echo "----------------------------------------"
            cat exemplo.txt
            echo "----------------------------------------"
            ;;
        2)
            echo "--- ARQUIVOS .TXT ENCONTRADOS ---"
            
            shopt -s nullglob
            arquivos_txt=(*.txt)
            shopt -u nullglob

            if [ ${#arquivos_txt[@]} -eq 0 ]; then
                echo "Nenhum arquivo .txt foi encontrado no diretório atual."
            else
                for arq in "${arquivos_txt[@]}"; do
                    echo "  - $arq"
                done
            fi
            echo "---------------------------------"
            ;;
        3)
            read -p "Digite o nome (ou caminho) do arquivo: " arquivo

            if [ ! -f "$arquivo" ]; then
                echo "Erro: O arquivo '$arquivo' não existe ou não é um arquivo comum!"
            else
                linhas=$(wc -l < "$arquivo")
                palavras=$(wc -w < "$arquivo")
                caracteres=$(wc -m < "$arquivo")

                echo "=== RESULTADO PARA: $arquivo ==="
                echo "Linhas:     $linhas"
                echo "Palavras:   $palavras"
                echo "Caracteres: $caracteres"
            fi
            ;;

        4)
            echo "Saindo do leitor de estatísticas..."
            ;;

        *)
            echo "Opção inválida! Escolha de 1 a 4."
            ;;
    esac

    echo ""
done
