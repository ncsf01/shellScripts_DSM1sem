#!/bin/bash
opcao=0

while [ "$opcao" -ne 3 ]; do
	echo "=== COMPARAR ARQUIVOS (diff)"
	echo ""
	echo "1. Criar arquivos 'doc1.txt', 'doc2.txt' e 'doc3.txt'"
	echo "2. Comparar arquivos"
	echo "3. Sair"
	echo ""
	read -p "Opção (1-3): " op
	
	case $opcao in
		1)
			cat << EOF > doc1.txt
Aula de Shell Script na Fatec.
Estamos aprendendo a usar o terminal no Linux.
O Linux é um sistema operacional incrível!
EOF
			cat << EOF > doc2.txt
Aula na Fatec, de Shell Script.
Estamos aprendendo no Linux, a usar o terminal.
O Linux é um sistema operacional genial!
EOF
			cat << EOF > doc3.txt
Aula de Shell Script na Fatec.
Estamos aprendendo a usar o terminal no Linux.
O Linux é um sistema operacional incrível!
EOF
			echo "Arquivos 'doc1.txt', 'doc2.txt' e 'doc3.txt' criados com sucesso"
			;;
		2)
			read -p "Digite o nome do primeiro arquivo: " arq1
			read -p "Digite o nome do segundo arquivo: " arq2
			
			if [ ! -f "$arq1" ]; then
				echo "O arquivo '$arq1' não existe"
			elif [ ! -f "$arq2" ]; then
				echo "O arquivo '$arq2' não existe"
			else
				if diff -q "$arq1" "$arq2" > /dev/null; then
					echo "Os arquivo '$arq1' e '$arq2' são idênticos"
				else
					echo "Os arquivos '$arq1' e '$arq2' são diferentes"
					
					echo ""
					
					read -p "Deseja ver as diferenças? (s/n): " ver
					if [ "$ver" = "s" ] || [ "$ver" = "S" ]; then
						echo ""
						echo "--- Diferenças encontradas (diff) ---"
						diff "$arq1" "$arq2"
						echo "--------------------------------------"
					fi
				fi
			fi
			;;
		3)
			echo "Saindo..."
			;;
		*)
			echo "Opção inválida"
			;;
	esac
	echo ""
done
