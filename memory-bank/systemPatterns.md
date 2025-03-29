# System Patterns: tatoh_domain_entity

**Última Atualização:** 2025-04-02

## Arquitetura

*   **Clean Architecture:** Este pacote representa a camada de Domínio, a mais interna e independente.
    *   **Dependências:** Não depende de nenhuma outra camada (Data, Presentation, Infra). As outras camadas dependem dele.
*   **Estrutura de Diretórios:**
    *   `lib/src/domain/`: Contém subdiretórios para cada agregado ou conceito de domínio principal (e.g., `user`, `profile`, `contact`, `link`).
    *   `lib/src/domain/{conceito}/entities/`: Contém as definições das classes de entidade (e.g., `user_entity.dart`).
    *   `lib/src/domain/{conceito}/{conceito}.dart`: Arquivo de biblioteca que exporta as entidades públicas do conceito (e.g., `lib/src/domain/user/user.dart` exporta `user_entity.dart`).
    *   `lib/tatoh_domain_entity.dart`: Arquivo principal que exporta as bibliotecas de cada conceito de domínio.

## Padrões de Design

*   **Entidade (Entity):** Classes que representam objetos de negócio com identidade (ID) e ciclo de vida. Contêm dados e podem ter lógica de validação intrínseca. São classes Dart puras.
*   **Imutabilidade:** As entidades são projetadas para serem imutáveis (campos `final`, construtor `const`). Métodos `copyWith` são fornecidos para criar novas instâncias com modificações.
*   **Value Object (Implícito):** Embora não explicitamente separados, alguns atributos dentro das entidades (como talvez um tipo de endereço ou configuração) poderiam ser modelados como Value Objects se tivessem lógica de validação ou formatação específica e não tivessem identidade própria.

## Decisões Técnicas Chave

*   **Separação Domínio/Dados:** Há uma clara separação entre Entidades (domínio) e Modelos/DTOs (dados). Os modelos residem na camada de dados (`lib/src/data/**/models/`) e são responsáveis pela serialização/deserialização e mapeamento de/para entidades.
*   **Nomenclatura:** Convenção `*Entity` para classes de entidade na camada de domínio.

*(Este é um rascunho inicial baseado na estrutura observada e nas correções feitas. Precisa ser validado e expandido com mais detalhes sobre padrões específicos do projeto Tatoh.)*
