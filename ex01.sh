#!/bin/bash

opcao=0

while [ "$opcao" -ne 5 ]; do
	echo "=== CALCULADORA ==="
	echo ""
	echo "Escolha a operação:"
	echo "1. Soma"
	echo "2. Subtração"
	echo "3. Multiplicação"
	echo "4. Divisão"
	echo "5. Sair"
	read -p "Opção desejada (1-5): " opcao

	case $opcao in
		1)
			read -p "Digite o primeiro número: " num1
			read -p "Digite o segundo número: " num2
			resultado=$(echo "$num1 + $num2" | bc)
			echo "Resultado da Soma: $resultado"
			;;
		2)
			read -p "Digite o primeiro número: " num1
			read -p "Digite o segundo número: " num2
			resultado=$(echo "$num1 - $num2" | bc)
			echo "Resultado da Subtração: $resultado"
			;;
		3)
			read -p "Digite o primeiro número: " num1
			read -p "Digite o segundo número: " num2
			resultado=$(echo "$num1 * $num2" | bc)
			echo "Resultado da Multiplicação: $resultado"
			;;
		4)
			read -p "Digite o primeiro número: " num1
			read -p "Digite o segundo número: " num2
			# Verificação simples para evitar divisão por zero
			if [ "$num2" -eq 0 ]; then
				echo "Erro: Não é possível dividir por zero!"
			else
				# scale=2 define 2 casas decimais na divisão com 'bc'
				resultado=$(echo "scale=2; $num1 / $num2" | bc)
				echo "Resultado da Divisão: $resultado"
			fi
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
