/// Entidade que representa um plano de assinatura,
/// alinhada com a definição do backend.
class PlanEntity {
  final int id;
  final String name; // Nome do plano
  final double price; // Preço do plano
  final String description; // Descrição do plano
  final bool public; // Indica se o plano é público/visível
  final DateTime createdAt;
  final DateTime updatedAt;

  const PlanEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.public,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Cria uma cópia da entidade com alguns campos alterados
  PlanEntity copyWith({
    int? id,
    String? name,
    double? price,
    String? description,
    bool? public,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PlanEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      public: public ?? this.public,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // TODO: Implementar métodos equals e hashCode se necessário para comparações
  // TODO: Implementar método toString para facilitar a depuração
}
