#!/bin/bash
op=0

while [ $op -ne 5 ]; do
	echo "=== CALCULADORA ==="
	echo ""
	echo "1. Soma"
	echo "2. Subtração"
	echo "3. Multiplicação"
	echo "4. Divisão"
	echo "5. Sair"
	echo ""
	read -p "Opção (1-5): " op
	
	case $op in
		1)
			read -p "Digite primeiro número: " num1
			read -p "Digite segundo número: " num2
			resultado=$(echo "$num1 + $num2" | bc)
			echo "Resultado da Soma: $resultado"
			;;
		2)
			read -p "Digite primeiro número: " num1
			read -p "Digite segundo número: " num2
			resultado=$(echo "$num1 - $num2" | bc)
			echo "Resultado da Subtração: $resultado"
			;;
		3)
			read -p "Digite primeiro número: " num1
			read -p "Digite segundo número: " num2
			resultado=$(echo "$num1 * $num2" | bc)
			echo "Resultado da Multiplicação: $resultado"
			;;
		4)
			read -p "Digite primeiro número: " num1
			read -p "Digite segundo número: " num2
			
			if [ "$num2" -eq 0 ]; then
				echo "Não é possível dividir por 0"
			else
				resultado=$(echo "scale=2; $num1 / $num2" | bc)
				echo "Resultado da Soma: $resultado"
			fi
			;;
		5)
			echo "Saindo..."
			;;
		*)
			echo "Opção inválida"
			;;
	esac
	echo ""
done
