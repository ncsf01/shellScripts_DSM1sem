#!/bin/bash

echo "=== ESTATÍSTICAS DE ARQUIVO (wc) ==="
echo ""

read -p "Digite o nome (ou caminho) do arquivo: " arquivo

if [ ! -f "$arquivo" ]; then
    echo "Erro: O arquivo '$arquivo' não existe!"
    exit 1
fi

linhas=$(wc -l < "$arquivo")
palavras=$(wc -w < "$arquivo")
caracteres=$(wc -m < "$arquivo")

echo ""
echo "Arquivo: $arquivo"
echo "Linhas: $linhas"
echo "Palavras: $palavras"
echo "Caracteres: $caracteres"
