import '../../../domain/subscription/entities/subscription_entity.dart';

/// Modelo (DTO) para serialização/deserialização e transferência de dados de SubscriptionEntity.
/// Reside na camada de Dados.
class SubscriptionModel {
  /// ID da assinatura
  final int? id;

  /// ID do plano associado à assinatura
  final int? planId;

  /// ID do usuário associado à assinatura
  final int? userId;

  /// Data de criação da assinatura (pode ser nulo)
  final DateTime? createdAt;

  /// Data de atualização da assinatura (pode ser nulo)
  final DateTime? updatedAt;

  /// Construtor
  SubscriptionModel({
    this.id,
    this.planId,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    // Adapte as chaves JSON conforme necessário
    return SubscriptionModel(
      id: json['id'] as int?,
      planId: json['plan_id'] as int?, // Exemplo
      userId: json['user_id'] as int?, // Exemplo
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String) // Exemplo
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'] as String) // Exemplo
          : null,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    // Adapte as chaves JSON conforme necessário
    return {
      'id': id,
      'plan_id': planId, // Exemplo
      'user_id': userId, // Exemplo
      'created_at': createdAt?.toIso8601String(), // Exemplo
      'updated_at': updatedAt?.toIso8601String(), // Exemplo
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory SubscriptionModel.fromEntity(SubscriptionEntity entity) {
    return SubscriptionModel(
      id: entity.id,
      planId: entity.planId,
      userId: entity.userId,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  SubscriptionEntity toEntity() {
    return SubscriptionEntity(
      id: id,
      planId: planId,
      userId: userId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
