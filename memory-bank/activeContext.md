# Active Context: tatoh_domain_entity

**Última Atualização:** 2025-04-02 (Fim da Sessão)

## Foco Atual

O foco principal desta sessão foi atualizar as definições das entidades de domínio (`ContactEntity`, `ProfileEntity`, `UserEntity`) e seus modelos de dados correspondentes (`ContactModel`, `ProfileModel`, `UserModel`) para alinhá-las com as novas especificações fornecidas, baseadas no backend AdonisJS. Também foram corrigidos erros decorrentes dessas atualizações e problemas preexistentes em outros arquivos.

## Mudanças Recentes

*   **Leitura do Memory Bank:** Todos os arquivos do Memory Bank (`projectbrief.md`, `productContext.md`, `systemPatterns.md`, `techContext.md`, `activeContext.md`, `progress.md`) foram lidos para contextualização.
*   **Entidades Atualizadas:**
    *   `ContactEntity` (`lib/src/domain/contact/entities/contact_entity.dart`) foi atualizada para a nova definição.
    *   `ProfileEntity` (`lib/src/domain/user/entities/profile_entity.dart`) foi atualizada para a nova definição.
    *   `UserEntity` (`lib/src/domain/user/entities/user_entity.dart`) foi atualizada para a nova definição.
*   **Modelos Atualizados:**
    *   `ContactModel` (`lib/src/data/contact/models/contact_model.dart`) foi atualizado para corresponder à nova `ContactEntity`.
    *   `ProfileModel` (`lib/src/data/user/models/profile_model.dart`) foi atualizado para corresponder à nova `ProfileEntity`.
    *   `UserModel` (`lib/src/data/user/models/user_model.dart`) foi atualizado para corresponder à nova `UserEntity`.
*   **Correções Adicionais:**
    *   Corrigida a importação em `ListProfilesEntity` (`lib/src/domain/profile/entities/list_profiles_entity.dart`) para usar caminho relativo e resolver conflito de tipo.
    *   Resolvidos conflitos de merge e corrigida a estrutura de `QRCodeModel` (`lib/src/data/profile/models/qrcode_model.dart`) usando `write_to_file`.
*   **Verificação:** Confirmado que `LinkEntity`, `LinkTypeEntity`, `PlanEntity` e `QRCodeEntity` já estavam alinhadas com as definições fornecidas e não necessitaram de alterações.

## Próximos Passos Imediatos

1.  Atualizar `progress.md`.
2.  Revisar `.clinerules` (nenhuma nova regra identificada nesta sessão).
3.  Apresentar o resultado final da tarefa de atualização das entidades principais.

## Decisões Ativas / Considerações

*   As entidades e modelos (`Contact`, `Profile`, `User`) foram atualizados estritamente com base nas **novas** definições fornecidas nesta sessão.
*   Os erros preexistentes ou resultantes de merges anteriores em `lib/src/data/profile/models/complete_profile_model.dart` foram **intencionalmente ignorados** nesta tarefa, conforme instruído, e permanecem como problemas conhecidos.
*   A convenção de nomenclatura `*Entity` e `*Model` foi mantida.
*   A conversão de/para JSON nos modelos assume chaves `snake_case` vindas do backend.
