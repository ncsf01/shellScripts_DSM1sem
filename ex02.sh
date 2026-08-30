#!/bin/bash
opcao=0

while [ "$opcao" -ne 3 ]; do
	echo "=== REMOÇÃO DE ARQUIVO ==="
	echo ""
	echo "Escolha a operação:"
	echo "1. Criar um arquivo"
	echo "2. Remover um arquivo"
	echo "3. Sair"
	read -p "Opção desejada (1-3): " opcao

	case $opcao in
		1)
            read -p "Digite o nome do arquivo a criar: " arquivo_novo
            touch "$arquivo_novo"
            echo "Arquivo '$arquivo_novo' criado com sucesso!"
            echo "Arquivos no diretório atual:"
            ls
            ;;
		2)
			read -p "Digite o nome do arquivo a ser removido: " arquivo
			if [ -f "$arquivo" ]; then
				rm "$arquivo"
				echo "O arquivo '$arquivo' foi removido com sucesso!"
				echo "Arquivos no diretório atual:"
				ls
			else
				echo "O arquivo '$arquivo' não foi encontrado ou não é um arquivo comum."
				ls
			fi
			;;
		3)
			echo "Saindo..."
			;;
		*)
			echo "Opção inválida! Por favor, escolha uma das opções de 1 a 3."
			;;
	esac
	
	echo ""
	
done
