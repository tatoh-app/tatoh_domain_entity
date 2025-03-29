# Active Context: tatoh_domain_entity

**Última Atualização:** 2025-04-02

## Foco Atual

O foco principal desta sessão foi corrigir uma série de erros de compilação e lint no pacote `tatoh_domain_entity`. Os erros incluíam:

*   Regras de lint obsoletas no `analysis_options.yaml`.
*   Importações não utilizadas em modelos da camada de dados.
*   Importações incorretas (URIs inexistentes) em arquivos de exportação da camada de domínio (`lib/src/domain/**/ *.dart`) que tentavam exportar modelos da camada de dados.
*   Definições de entidades de domínio (`UserEntity`, `ContactEntity`, `LinkEntity`, `ProfileEntity`, `QRCodeEntity`) desalinhadas com as definições fornecidas pelo backend.
*   Modelos da camada de dados (`UserModel`, `ContactModel`, `LinkModel`, `ProfileModel`, `QRCodeModel`) que estavam inconsistentes com as entidades de domínio corrigidas.
*   Uma importação incorreta em `ListProfilesEntity`.

## Mudanças Recentes

*   Removidas regras de lint `iterable_contains_unrelated_type` e `list_remove_unrelated_type` de `analysis_options.yaml`.
*   Removidas importações não utilizadas de `complete_profile_model.dart` e `list_profiles_model.dart`.
*   Removidas exportações de `models` dos arquivos de biblioteca da camada de domínio (`contact.dart`, `feed.dart`, `media.dart`, `message.dart`, `notification.dart`, `profile.dart`, `settings.dart`, `subscription.dart`, `theme.dart`, `user.dart`).
*   Sobrescritas as entidades `UserEntity`, `ContactEntity`, `LinkEntity`, `ProfileEntity`, `QRCodeEntity` com base nas definições do backend fornecidas.
*   Sobrescritos os modelos `UserModel`, `ContactModel`, `LinkModel`, `ProfileModel`, `QRCodeModel` para alinhá-los com as entidades atualizadas.
*   Criadas as entidades `LinkTypeEntity` e `PlanEntity` com base nas definições do backend.
*   Corrigida a importação em `ListProfilesEntity`.
*   Criados os arquivos iniciais do Memory Bank (`projectbrief.md`, `productContext.md`, `activeContext.md`).

## Próximos Passos Imediatos

1.  Criar os arquivos restantes do Memory Bank (`systemPatterns.md`, `techContext.md`, `progress.md`).
2.  Criar o arquivo `.clinerules`.
3.  Verificar se há mais erros de análise estática ou compilação após as correções.
4.  Apresentar o resultado final.

## Decisões Ativas / Considerações

*   As entidades e modelos foram atualizados para refletir estritamente as definições fornecidas pelo backend.
*   A estrutura de diretórios existente foi mantida (e.g., `ProfileEntity` em `lib/src/domain/user/entities/`).
*   A convenção de nomenclatura `*Entity` para entidades e `*Model` para modelos da camada de dados foi seguida.
