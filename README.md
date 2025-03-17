# Tatoh Domain Entity

Este pacote contém todas as entidades de domínio do projeto Tatoh. As entidades são objetos que representam conceitos importantes do domínio e são independentes de qualquer framework ou tecnologia específica.

## Estrutura

O pacote segue os princípios da Arquitetura Limpa (Clean Architecture) e está organizado nas seguintes camadas:

### Core

Contém componentes fundamentais utilizados em todo o sistema:

- **Value Objects**: Objetos de valor que encapsulam e validam dados primitivos
  - `IdValue`: Para representar identificadores numéricos
  - `EmailValue`: Para representar e validar endereços de email
  - `UrlValue`: Para representar e validar URLs
  - `ColorValue`: Para representar cores
  - `DateValue`: Para representar datas
  - `SlugValue`: Para representar slugs (strings formatadas para URLs)

- **Errors**: Entidades relacionadas a erros
  - `ApiErrorEntity`: Representa um erro retornado por uma API

- **Common**: Componentes comuns
  - `TokenEntity`: Representa um token de autenticação

### Domain

Contém as entidades de domínio organizadas por contexto:

- **User**: Entidades relacionadas a usuários
  - `UserEntity`: Representa um usuário do sistema
  - `ValidateSlugEntity`: Representa o resultado de validação de um slug

- **Profile**: Entidades relacionadas a perfis
  - `CompleteProfileEntity`: Representa um perfil completo com todos os dados
  - `ListProfilesEntity`: Representa uma lista de perfis de um usuário

- **Card**: Entidades relacionadas a cartões
  - `CardEntity`: Representa um cartão de visita digital
  - `CardProfileSummaryEntity`: Representa um resumo de perfil em um cartão
  - `CheckQRCodeEntity`: Representa o resultado de verificação de um QR Code
  - `ProfileCardWidgetEntity`: Representa um widget de cartão de perfil
  - `ResponseGetDownloadUrlEntity`: Representa a resposta de obtenção de URL de download

- **Contact**: Entidades relacionadas a contatos
  - `ContactEntity`: Representa um contato
  - `CheckEntity`: Representa o resultado de verificação de um contato
  - `ListContactsEntity`: Representa uma lista de contatos
  - `SimpleContactEntity`: Representa um contato simplificado

- **Message**: Entidades relacionadas a mensagens
  - `MessageEntity`: Representa uma mensagem
  - `ConversationEntity`: Representa uma conversa

- **Notification**: Entidades relacionadas a notificações
  - `NotificationEntity`: Representa uma notificação
  - `SimpleNotificationEntity`: Representa uma notificação simplificada

- **Feed**: Entidades relacionadas ao feed
  - `FeedEntity`: Representa uma coleção de itens do feed
  - `FeedItemEntity`: Representa um item individual do feed

- **Subscription**: Entidades relacionadas a assinaturas
  - `SubscriptionEntity`: Representa uma assinatura

- **Theme**: Entidades relacionadas a temas
  - `SolidColorsEntity`: Representa uma cor sólida para temas

- **Media**: Entidades relacionadas a arquivos de mídia
  - `MediaEntity`: Representa um arquivo de mídia

- **Settings**: Entidades relacionadas a configurações
  - `SettingsEntity`: Representa as configurações de um usuário



## Instalação

Adicione o pacote ao seu `pubspec.yaml`:

```yaml
dependencies:
  tatoh_domain_entity:
    path: ../path_to_package/tatoh_domain_entity
```

## Uso

Importe o pacote em seus arquivos:

```dart
import 'package:tatoh_domain_entity/tatoh_domain_entity.dart';
```

Exemplo de uso:

```dart
// Criar uma entidade de usuário
final user = UserEntity(
  id: '123',
  email: 'usuario@exemplo.com',
  name: 'Nome do Usuário',
  emailVerified: true,
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
);

// Converter para JSON
final json = user.toJson();

// Criar a partir de JSON
final userFromJson = UserEntity.fromJson(json);
```

## Geração de código

Este pacote utiliza [json_serializable](https://pub.dev/packages/json_serializable) para gerar código de serialização JSON. Após modificar as entidades, execute o seguinte comando para gerar os arquivos `.g.dart`:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Dependências

- [equatable](https://pub.dev/packages/equatable): Para comparação de objetos
- [json_annotation](https://pub.dev/packages/json_annotation): Para anotações de serialização JSON

## Licença

Este pacote é distribuído sob a licença MIT.
