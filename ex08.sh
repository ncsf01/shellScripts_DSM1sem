#!/bin/bash
opcao=0

while [ "$opcao" -ne 4 ]; do
	echo "=== CONCATENAR ARQUIVOS ==="
	echo ""
	echo "1. Criar arquivos 'exemplo1.txt' e 'exemplo2.txt'"
	echo "2. Concatenar 2 arquivos sobreescrevendo"
	echo "3. Concatenar 2 arquivos anexando"
	echo "4. Sair"
	read -p "Opção desejada (1-4): " opcao
	
	case $opcao in
		1)
			cat << EOF > exemplo1.txt
Aula de Shell Script na Fatec.
Estamos aprendendo a usar o o terminal no Linux.
O comando grep serve para buscar palavras em arquivos de texto.
O Linux é um sistema operacional incrível!
EOF
			cat << EOF > exemplo2.txt
!levírcni lanoicarepo ametsis mu é xuniL O
.otxet ed soviuqra me sarvalap racsub arap evres perg odnamoc O
.xuniL on lanimret o o rasu a odnednerpa somatsE
.cetaF an tpircS llehS ed aluA
EOF
			echo "Arquivos 'exemplo1.txt' e 'exemplo2.txt' criados com sucesso! ＼(＾O＾)／"
			echo "Arquivos no diretório atual:"
            ls
			;;
		2)
			echo "Arquivos no diretório atual:"
            ls
			read -p "Digite o nome do primeiro arquivo: " primeiro_arquivo
			read -p "Digite o nome do segundo arquivo: " segundo_arquivo
			
			if [ ! -f "$primeiro_arquivo" ]; then
				echo "Erro: O arquivo '$primeiro_arquivo' não existe!"
			elif [ ! -f "$segundo_arquivo" ]; then
				echo "Erro: O arquivo '$segundo_arquivo' não existe!"
			else
				read -p "Digite o nome do arquivo destino: " destino
			fi
			
			cat "$primeiro_arquivo" "$segundo_arquivo" > "$destino"
			
			if [ -f "$destino" ]; then
				echo "Sucesso: Conteúdo unificado em '$destino'! ＼(＾O＾)／ "
				echo ""
				echo "--- Conteúdo atual de $destino ---"
				cat "$destino"
				echo "-----------------------------------"
			else
				echo "Algo deu terrívelmente errado! (っ- ‸ - ς)"
			fi			
			;;
		3)
			echo "Arquivos no diretório atual:"
            ls
			read -p "Digite o nome do primeiro arquivo: " primeiro_arquivo
			read -p "Digite o nome do segundo arquivo: " segundo_arquivo
			
			if [ ! -f "$primeiro_arquivo" ]; then
				echo "Erro: O arquivo '$primeiro_arquivo' não existe!"
			elif [ ! -f "$segundo_arquivo" ]; then
				echo "Erro: O arquivo '$segundo_arquivo' não existe!"
			else
				read -p "Digite o nome do arquivo destino: " destino
			fi
			
			cat "$primeiro_arquivo" "$segundo_arquivo" >> "$destino"
			
			if [ -f "$destino" ]; then
				echo "Sucesso: Conteúdo anexado ao final de '$destino'! ＼(＾O＾)／ "
				echo ""
				echo "--- Conteúdo atual de $destino ---"
				cat "$destino"
				echo "-----------------------------------"
			else
				echo "Algo deu terrívelmente errado! (っ- ‸ - ς)"
			fi
			;;
		4)
            echo "Saindo..."
            ;;
		*)
            echo "Opção inválida! Escolha uma opção de 1 a 4. (っ- ‸ - ς)"
            ;;
    esac
	
	echo ""
done
