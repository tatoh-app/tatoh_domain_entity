import '../../../domain/profile/entities/link_entity.dart'; // Importa LinkEntity

/// Modelo (DTO) para serialização/deserialização e transferência de dados de LinkEntity.
/// Reside na camada de Dados. Alinhado com a LinkEntity atualizada.
class LinkModel {
  /// ID do link
  final int id;

  /// ID do tipo de link (pode ser nulo)
  final int? typeId;

  /// ID do perfil associado ao link (pode ser nulo)
  final int? profileId;

  /// Descrição do link
  final String description;

  /// Valor principal do link (e.g., nome de usuário, número)
  final String value;

  /// URL completa do link
  final String url;

  /// Indica se o link é público
  final bool public;

  /// Índice para ordenação
  final int orderIndex;

  /// Data de criação (como DateTime)
  final DateTime createdAt;

  /// Data de atualização (como DateTime)
  final DateTime updatedAt;

  /// Construtor
  LinkModel({
    required this.id,
    this.typeId,
    this.profileId,
    required this.description,
    required this.value,
    required this.url,
    required this.public,
    required this.orderIndex,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory LinkModel.fromJson(Map<String, dynamic> json) {
    return LinkModel(
      id: json['id'] as int,
      typeId: json['type_id'] as int?, // Chave JSON específica
      profileId: json['profile_id'] as int?, // Chave JSON específica
      description: json['description'] as String,
      value: json['value'] as String,
      url: json['url'] as String,
      public: json['public'] as bool,
      orderIndex: json['order_index'] as int, // Chave JSON específica
      createdAt: DateTime.parse(json['created_at'] as String), // Chave JSON específica
      updatedAt: DateTime.parse(json['updated_at'] as String), // Chave JSON específica
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type_id': typeId, // Chave JSON específica
      'profile_id': profileId, // Chave JSON específica
      'description': description,
      'value': value,
      'url': url,
      'public': public,
      'order_index': orderIndex, // Chave JSON específica
      'created_at': createdAt.toIso8601String(), // Chave JSON específica
      'updated_at': updatedAt.toIso8601String(), // Chave JSON específica
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory LinkModel.fromEntity(LinkEntity entity) {
    return LinkModel(
      id: entity.id,
      typeId: entity.typeId,
      profileId: entity.profileId,
      description: entity.description,
      value: entity.value,
      url: entity.url,
      public: entity.public,
      orderIndex: entity.orderIndex,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  LinkEntity toEntity() {
    return LinkEntity(
      id: id,
      typeId: typeId,
      profileId: profileId,
      description: description,
      value: value,
      url: url,
      public: public,
      orderIndex: orderIndex,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
