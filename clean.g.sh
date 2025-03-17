#!/bin/bash

# Script para remover arquivos .g.dart que não são mais necessários

# Diretório base
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
SRC_DIR="$BASE_DIR/lib/src"

echo "Removendo arquivos .g.dart desnecessários..."

# Função para remover arquivos .g.dart em um diretório
remove_g_files() {
  local dir=$1
  
  # Encontra todos os arquivos .g.dart
  find "$dir" -name "*.g.dart" | while read -r file; do
    # Verifica se o arquivo correspondente importa 'package:json_annotation/json_annotation.dart'
    base_file="${file%.g.dart}.dart"
    
    if [ -f "$base_file" ]; then
      if ! grep -q "part '$(basename "$file")'" "$base_file"; then
        echo "Removendo $file"
        rm "$file"
      fi
    else
      # Se o arquivo base não existe, remove o .g.dart
      echo "Removendo $file (arquivo base não existe)"
      rm "$file"
    fi
  done
}

# Remove arquivos .g.dart em todo o diretório src
remove_g_files "$SRC_DIR"

echo "Limpeza concluída!"
