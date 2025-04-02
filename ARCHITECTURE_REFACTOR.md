# Plano de Refatoração da Arquitetura de Entidades e Modelos

Este documento descreve o plano para refatorar a estrutura de entidades e modelos de dados do projeto, visando maior clareza, separação de camadas e manutenibilidade, seguindo princípios de arquitetura limpa.

## Diagnóstico

*   **Inconsistência:** A relação entre Entidades (`_entity.dart`) e Modelos (`_model.dart`) não é uniforme. Alguns modelos herdam das entidades, outros duplicam campos.
*   **Acoplamento de Camadas:** Os Modelos, que contêm lógica de serialização/desserialização (DTOs - Data Transfer Objects), residem atualmente na camada `domain`, misturando responsabilidades de domínio com as de infraestrutura/dados.

## Arquitetura Proposta

Adotaremos uma separação clara entre a camada de Domínio e a camada de Dados:

*   **Camada de Domínio (`lib/src/domain`):** Conterá apenas Entidades puras (imutáveis, representando conceitos de negócio) e lógica de negócio (Casos de Uso, abstrações de Repositórios).
*   **Camada de Dados (`lib/src/data`):** Conterá os Modelos (DTOs) responsáveis pela serialização/desserialização (ex: `fromJson`, `toJson`), implementações de Repositórios e lógica de acesso a fontes de dados (APIs, banco de dados local).

```mermaid
graph TD
    UI(Camada de Apresentação/UI) --> Domain(Camada de Domínio);
    UI --> Data(Camada de Dados);
    Domain -->|Usa| CoreEntities(Entidades Puras \n ex: ContactEntity);
    Data -->|Usa/Mapeia| CoreEntities;
    Data -->|Define| DTOs(Modelos/DTOs \n ex: ContactModel \n com fromJson/toJson);
    Data -->|Interage com| External(Fontes Externas \n API, DB Local);

    subgraph Domain [Camada de Domínio (lib/src/domain)]
        direction LR
        CoreEntities
        UseCases(Casos de Uso / Lógica de Negócio)
        RepositoriesAbs(Abstrações de Repositórios)
    end

    subgraph Data [Camada de Dados (lib/src/data)]
        direction LR
        DTOs
        RepositoriesImpl(Implementações de Repositórios)
        DataSources(Fontes de Dados \n API Clients, DB Helpers)
    end

    style Domain fill:#f9f,stroke:#333,stroke-width:2px
    style Data fill:#ccf,stroke:#333,stroke-width:2px
```

## Plano de Ação Detalhado

1.  **Criar Estrutura de Diretórios:**
    *   Criar `lib/src/data`.
    *   Criar `lib/src/data/<domain_name>` para cada domínio existente (ex: `card`, `contact`).
    *   Criar `lib/src/data/<domain_name>/models` (ex: `lib/src/data/card/models`).

2.  **Mover e Refatorar Modelos (DTOs):**
    *   Mover `lib/src/domain/**/models/*_model.dart` para `lib/src/data/**/models/`.
    *   Para cada modelo movido:
        *   Remover herança de `*_entity.dart` (se houver).
        *   Garantir campos próprios (espelhando a entidade).
        *   Manter/Ajustar `fromJson`/`toJson`.
        *   Adicionar método `toEntity()` para converter Modelo -> Entidade.
        *   Adicionar factory `fromEntity(Entity entity)` para converter Entidade -> Modelo.
        *   Atualizar `import`s.

3.  **Limpar Entidades:**
    *   Garantir que `lib/src/domain/**/entities/*_entity.dart` contenham apenas atributos e lógica de domínio pura (ex: `copyWith`). Remover qualquer lógica de serialização.

4.  **Atualizar Usos (Próxima Etapa - Modo Code):**
    *   Identificar e atualizar locais que usam os modelos para importá-los de `lib/src/data`.
    *   Utilizar os métodos `toEntity()` e `fromEntity()` para mapeamento entre camadas onde necessário.

## Estrutura de Exemplo (Após Refatoração - 'Card')

```
lib/
└── src/
    ├── domain/
    │   └── card/
    │       └── entities/
    │           └── card_entity.dart  <-- Entidade Pura
    └── data/
        └── card/
            └── models/
                └── card_model.dart   <-- DTO com fromJson/toJson/toEntity/fromEntity