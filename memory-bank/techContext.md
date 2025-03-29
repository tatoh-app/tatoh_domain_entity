# Tech Context: tatoh_domain_entity

**Última Atualização:** 2025-04-02

## Tecnologias Principais

*   **Linguagem:** Dart (versão inferida >= 3.3.0, com base nas regras de lint removidas)
*   **Framework:** Flutter (implícito, dado o uso de `package:flutter_lints/flutter.yaml`)
*   **Gerenciador de Pacotes:** Pub (Flutter/Dart)

## Configuração de Desenvolvimento

*   **Análise Estática:** Configurada via `analysis_options.yaml`, utilizando as regras recomendadas de `package:flutter_lints`.
*   **Estrutura do Projeto:** Organizado em camadas (Domain, Data - inferido pela estrutura de diretórios e correções feitas).

## Dependências Chave (do Pacote)

*   `flutter_lints`: Para regras de análise de código.
*   (Nenhuma outra dependência explícita observada no `pubspec.yaml` deste pacote específico, mas ele provavelmente faz parte de um monorepo ou projeto maior com outras dependências Flutter/Dart).

## Restrições Técnicas

*   **Pure Dart:** A camada de domínio (`lib/src/domain`) deve conter apenas código Dart puro, sem dependências do Flutter ou de pacotes de UI/Infraestrutura.
*   **Imutabilidade:** As entidades devem ser imutáveis para garantir a previsibilidade e evitar efeitos colaterais.
*   **Clean Architecture:** Aderência aos princípios da Clean Architecture, especialmente a regra de dependência (camadas externas dependem de camadas internas).

## Integrações (Inferidas)

*   **Backend API:** As entidades de domínio são modeladas com base nas estruturas de dados retornadas pela API do backend (conforme fornecido pelo usuário). A camada de dados (fora deste pacote) será responsável por interagir com essa API e mapear as respostas para os modelos de dados (DTOs), que por sua vez são mapeados para as entidades de domínio.

*(Este é um rascunho inicial. Precisa ser confirmado e detalhado com informações sobre a versão exata do Dart/Flutter, dependências específicas e ferramentas de build/CI/CD utilizadas no projeto completo.)*
