import '../../../domain/link/entities/link_type_entity.dart';

/// Modelo (DTO) para serialização/deserialização e transferência de dados de LinkTypeEntity.
/// Reside na camada de Dados.
class LinkTypeModel {
  /// ID do tipo de link
  final int id;

  /// Nome do tipo de link
  final String name;

  /// URL do ícone associado
  final String iconUrl;

  /// Data de criação (como DateTime)
  final DateTime createdAt;

  /// Data de atualização (como DateTime)
  final DateTime updatedAt;

  /// Construtor
  LinkTypeModel({
    required this.id,
    required this.name,
    required this.iconUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory LinkTypeModel.fromJson(Map<String, dynamic> json) {
    return LinkTypeModel(
      id: json['id'] as int,
      name: json['name'] as String,
      iconUrl: json['icon_url'] as String, // Chave JSON específica
      createdAt: DateTime.parse(json['created_at'] as String), // Chave JSON específica
      updatedAt: DateTime.parse(json['updated_at'] as String), // Chave JSON específica
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon_url': iconUrl, // Chave JSON específica
      'created_at': createdAt.toIso8601String(), // Chave JSON específica
      'updated_at': updatedAt.toIso8601String(), // Chave JSON específica
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory LinkTypeModel.fromEntity(LinkTypeEntity entity) {
    return LinkTypeModel(
      id: entity.id,
      name: entity.name,
      iconUrl: entity.iconUrl,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  LinkTypeEntity toEntity() {
    return LinkTypeEntity(
      id: id,
      name: name,
      iconUrl: iconUrl,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
