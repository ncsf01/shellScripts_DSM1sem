#!/bin/bash
opcao=0

while [ "$opcao" -ne 2 ]; do
	echo "=== VERIFICAR USUÁRIO NO SISTEMA ==="
	echo ""
	echo "Escolha a operação:"
	echo "1. Procurar nome de usuário"
	echo "2. Sair"
	read -p "Opção desejada (1-2): " opcao

	case $opcao in
		1)
            read -p "Digite o nome do do usuário a ser pesquisado: " usuario
            if grep -q "^$usuario:" /etc/passwd; then
				echo ""
				echo "Usuário encontrado."
			else
				echo ""
				echo "Usuário não encontrado."
			fi
            ;;
        2)
			echo "Saindo..."
			;;
		*)
			echo "Opção inválida! Por favor, escolha uma das opções de 1 a 2."
			;;
	esac
	
	echo ""
	
done
