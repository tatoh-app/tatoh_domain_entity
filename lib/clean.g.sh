#!/bin/bash

# Vá para o diretório atual
cd "$(dirname "$0")"

# Encontre todos os diretórios e execute o comando para cada um
for dir in */; do
  echo "Entrando no diretório: $dir"
  
  # Encontre e liste os arquivos .g.dart
  files=$(find "$dir" -type f -name "*.g.dart")
  echo "Arquivos .g.dart encontrados:"
  echo "$files"
  
  # Conta o número de arquivos .g.dart
  count=$(echo "$files" | wc -l)
  echo "Número de arquivos .g.dart para remover: $count"
  
  # Remova os arquivos .g.dart
  find "$dir" -type f -name "*.g.dart" -delete
  
  # Verifique se os arquivos foram removidos
  files=$(find "$dir" -type f -name "*.g.dart")
  if [ -z "$files" ]; then
    echo "Arquivos .g.dart removidos com sucesso!"
  else
    echo "Erro ao remover arquivos .g.dart!"
  fi
  
  echo "Saindo do diretório: $dir"
  echo ""
done