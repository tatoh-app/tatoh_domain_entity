import '../entities/subscription_entity.dart';

/// Modelo para serialização/deserialização de SubscriptionEntity
class SubscriptionModel extends SubscriptionEntity {
  /// Construtor
  SubscriptionModel({
    int? id,
    int? planId,
    int? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          planId: planId,
          userId: userId,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Cria um modelo a partir de um Map (JSON)
  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
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
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  /// Cria um modelo a partir de uma entidade
  factory SubscriptionModel.fromEntity(SubscriptionEntity entity) {
    return SubscriptionModel(
      id: entity.id,
      planId: entity.planId,
      userId: entity.userId,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
