import '../../../domain/subscription/entities/subscription_entity.dart'; // Importa SubscriptionEntity

/// Modelo (DTO) para serialização/deserialização e transferência de dados de SubscriptionEntity.
/// Reside na camada de Dados.
class SubscriptionModel {
  /// ID da assinatura
  final int? id;

  /// ID do plano associado à assinatura
  final int? planId;

  /// ID do usuário associado à assinatura
  final int? userId;

  /// Data de criação da assinatura
  final DateTime? createdAt;

  /// Data de atualização da assinatura
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
    // TODO: Considerar adicionar validações ou tratamento de nulos mais robusto
    return SubscriptionModel(
      id: json['id'] as int?,
      planId: json['planId'] as int?,
      userId: json['userId'] as int?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : null,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'planId': planId,
      'userId': userId,
      'createdAt': createdAt?.toIso8601String(), // Converte DateTime? para String?
      'updatedAt': updatedAt?.toIso8601String(), // Converte DateTime? para String?
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