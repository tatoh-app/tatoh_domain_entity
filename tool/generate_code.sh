#!/bin/bash

# Este script gera os arquivos .g.dart necessários para a serialização JSON

echo "Gerando arquivos .g.dart para serialização JSON..."
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs

echo "Código gerado com sucesso!"
