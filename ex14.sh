#!/bin/bash

echo "=== PROCURAR PROCESSO EM EXECUÇÃO ==="
echo ""

read -p "Digite o nome do processo que deseja procurar (ex: firefox, bash): " proc

# O grep -v "grep" remove da lista a própria linha do comando grep que acabou de rodar
resultado=$(ps aux | grep -i "$proc" | grep -v "grep")

echo ""
if [ -n "$resultado" ]; then
    echo "Processos encontrados:"
    echo "----------------------"
    echo "$resultado"
else
    echo "Aviso: Nenhum processo referente a '$proc' foi encontrado em execução."
fi
