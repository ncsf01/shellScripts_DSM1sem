#!/bin/bash

echo "=== ALTERAR PERMISSÕES (chmod) ==="
echo ""

read -p "Digite o nome (ou caminho) do arquivo: " arquivo

if [ ! -e "$arquivo" ]; then
    echo "Erro: O arquivo ou diretório '$arquivo' não existe!"
    exit 1
fi

echo ""
echo "Escolha a permissão desejada:"
echo "1. 644 (Leitura/Escrita p/ dono, apenas Leitura p/ outros - Padrão texto)"
echo "2. 755 (Acesso total p/ dono, Leitura/Execução p/ outros - Padrão scripts)"
echo "3. 700 (Acesso total APENAS p/ o dono - Privado)"
echo "4. Digitar outra permissão octal manualmente"
read -p "Opção (1-4): " op

case $op in
    1) perm="644" ;;
    2) perm="755" ;;
    3) perm="700" ;;
    4) read -p "Digite a permissão desejada (ex: 777): " perm ;;
    *) echo "Opção inválida!"; exit 1 ;;
esac

chmod "$perm" "$arquivo"
echo ""
echo "Sucesso: A permissão do arquivo '$arquivo' foi modificada para $perm!"
