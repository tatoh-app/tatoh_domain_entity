/// Entidade que representa os dados de uma assinatura
class SubscriptionEntity {
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
  const SubscriptionEntity({
    this.id,
    this.planId,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  /// Cria uma cópia da entidade com alguns campos alterados
  SubscriptionEntity copyWith({
    int? id,
    int? planId,
    int? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SubscriptionEntity(
      id: id ?? this.id,
      planId: planId ?? this.planId,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Factory para criar a entidade a partir de valores primitivos
  factory SubscriptionEntity.fromPrimitives({
    int? id,
    int? planId,
    int? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SubscriptionEntity(
      id: id != null ? int.parse(id.toString()) : null,
      planId: planId != null ? int.parse(planId.toString()) : null,
      userId: userId != null ? int.parse(userId.toString()) : null,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Verifica se a assinatura é válida (tem ID e datas)
  bool get isValid => id != null && createdAt != null;
}
