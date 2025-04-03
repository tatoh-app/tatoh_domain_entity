import '../../../domain/plan/entities/plan_entity.dart';

/// Modelo (DTO) para serialização/deserialização e transferência de dados de PlanEntity.
/// Reside na camada de Dados.
class PlanModel {
  /// ID do plano
  final int id;

  /// Nome do plano
  final String name;

  /// Preço do plano
  final double price;

  /// Descrição do plano
  final String description;

  /// Indica se o plano é público/visível
  final bool public;

  /// Data de criação (como DateTime)
  final DateTime createdAt;

  /// Data de atualização (como DateTime)
  final DateTime updatedAt;

  /// Construtor
  PlanModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.public,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      id: json['id'] as int,
      name: json['name'] as String,
      // JSON geralmente usa num, então convertemos para double
      price: (json['price'] as num).toDouble(), 
      description: json['description'] as String,
      public: json['public'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String), // Chave JSON específica
      updatedAt: DateTime.parse(json['updated_at'] as String), // Chave JSON específica
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'public': public,
      'created_at': createdAt.toIso8601String(), // Chave JSON específica
      'updated_at': updatedAt.toIso8601String(), // Chave JSON específica
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory PlanModel.fromEntity(PlanEntity entity) {
    return PlanModel(
      id: entity.id,
      name: entity.name,
      price: entity.price,
      description: entity.description,
      public: entity.public,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  PlanEntity toEntity() {
    return PlanEntity(
      id: id,
      name: name,
      price: price,
      description: description,
      public: public,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
