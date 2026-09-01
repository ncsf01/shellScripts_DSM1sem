#!/bin/bash

opcao=0

while [ "$opcao" -ne 4 ]; do
    echo "=== GERENCIADOR DE PROCESSOS (KILL) ==="
    echo ""
    echo "1. Criar um processo de teste (sleep)"
    echo "2. Listar meus processos em execução"
    echo "3. Encerrar um processo por PID"
    echo "4. Sair"
    echo ""
    read -p "Escolha uma opção (1-4): " opcao

    echo ""
    case $opcao in
        1)
            sleep 600 &
            pid_criado=$!
            echo "Processo de teste criado com sucesso!"
            echo "Comando: sleep 600 | PID: $pid_criado"
            ;;
        2)
            echo "--- SEUS PROCESSOS EM EXECUÇÃO ---"
            ps -u "$USER" -o pid,tty,time,comm
            echo "----------------------------------"
            ;;
        3)
            read -p "Digite o PID (número do processo) que deseja encerrar: " pid

            if ! ps -p "$pid" > /dev/null 2>&1; then
                echo "Erro: O PID '$pid' não existe ou não está em execução no momento!"
            else
                echo ""
                echo "--- Informações do Processo $pid ---"
                ps -p "$pid" -o pid,user,comm
                echo "-----------------------------------"
                echo ""

                read -p "Deseja realmente encerrar esse processo? (s/n): " confirma

                if [ "$confirma" = "s" ] || [ "$confirma" = "S" ]; then
                    kill "$pid" 2>/dev/null
                    
                    sleep 1
                    if ps -p "$pid" > /dev/null 2>&1; then
                        kill -9 "$pid" 2>/dev/null
                    fi
                    
                    echo "O processo $pid foi encerrado com sucesso."
                else
                    echo "Operação cancelada. O processo continua em execução."
                fi
            fi
            ;;
        4)
            echo "Saindo..."
            ;;
        *)
            echo "Opção inválida! Escolha de 1 a 4."
            ;;
    esac

    echo ""
done
