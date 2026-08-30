#!/bin/bash
opcao=0

while [ "$opcao" -ne 3 ]; do
	echo "=== PROCURAR PALAVRA EM ARQUIVO ==="
	echo ""
    echo "Escolha a operação:"
    echo "1. Criar arquivo de teste exemplo (exemplo.txt)"
    echo "2. Procurar palavra em um arquivo"
    echo "3. Sair"
    read -p "Opção desejada (1-3): " opcao

	case $opcao in
		1)
			cat << EOF > exemplo.txt
Aula de Shell Script na Fatec.
Estamos aprendendo a usar o terminal no Linux.
O comando grep serve para buscar palavras em arquivos de texto.
O Linux é um sistema operacional incrível!
EOF
			echo "Arquivo 'exemplo.txt' criado com sucesso!"
			echo "Dica: Você pode testar buscar a palavra 'linux', 'fatec' ou 'grep' nele."
			;;
		2)
		    read -p "Digite a palavra ou texto a ser procurado: " palavra
            read -p "Digite o nome (ou caminho) do arquivo: " arquivo
            echo ""
            
            if [ ! -f "$arquivo" ]; then
				echo "Erro: O arquivo '$arquivo' não existe ou não é um arquivo válido!"
			else
				resultado=$(grep -i "$palavra" "$arquivo")
				
				if [ -n "$resultado" ]; then
					echo "Sucesso: A palavra '$palavra' foi ENCONTRADA no arquivo '$arquivo'!"
					echo ""
					echo "--- Linhas encontradas (Desafio) ---"
					echo "$resultado"
					echo "-------------------------------------"
				else
					echo "A palavra '$palavra' NÃO foi encontrada no arquivo '$arquivo'."
				fi
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
