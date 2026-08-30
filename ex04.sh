#!/bin/bash
opcao=0

while [ "$opcao" -ne 5 ]; do
	echo "=== MOVER ARQUIVO ENTRE DIRETÓRIOS ==="
	echo ""
	echo "Escolha a operação:"
	echo "1. Criar um diretório"
	echo "2. Criar um arquivo"
	echo "3. Mover um arquivo"
	echo "4. Mostrar arquivos no diretório atual"
	echo "5. Sair"
	read -p "Opção desejada (1-5): " opcao

	case $opcao in
		1)
            read -p "Digite o nome do diretório a criar: " dir_novo
            if [ ! -d "$dir_novo" ]; then
				mkdir "$dir_novo"
				echo "Diretório '$dir_novo' criado com sucesso!"
			else
				echo "Diretório '$dir_novo' já existe."
			fi
            echo "Arquivos no diretório atual:"
            ls
            ;;
        2)
            read -p "Digite o nome do arquivo a criar: " arquivo_novo
            touch "$arquivo_novo"
            echo "Arquivo '$arquivo_novo' criado com sucesso!"
            echo "Arquivos no diretório atual:"
            ls
            ;;
		3)
			echo "Arquivos no diretório atual:"
			ls
			read -p "Digite o nome do arquivo a ser movido: " arquivo
			read -p "Digite o diretório de destino: " destino
			if [ ! -f "$arquivo" ]; then
				echo "Erro: O arquivo '$arquivo' não existe!"
			elif [ ! -d "$destino" ]; then
				echo "Erro: O diretório de destino '$destino' não existe!"
			else
				mv "$arquivo" "$destino"
				echo "Sucesso: O arquivo '$arquivo' foi movido para '$destino'!"
				echo "Arquivos no diretório atual:"
				ls
			fi
			;;
		4)
			echo "Arquivos no diretório atual:"
			ls
			;;
		5)
			echo "Saindo..."
			;;
		*)
			echo "Opção inválida! Por favor, escolha uma das opções de 1 a 5."
			;;
	esac
	
	echo ""
	
done
