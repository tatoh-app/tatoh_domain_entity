/// Entidade que representa um tipo de link (e.g., Instagram, Website),
/// alinhada com a definição do backend.
class LinkTypeEntity {
  final int id;
  final String name; // Nome do tipo de link (e.g., "Instagram")
  final String iconUrl; // URL do ícone associado
  final DateTime createdAt;
  final DateTime updatedAt;

  const LinkTypeEntity({
    required this.id,
    required this.name,
    required this.iconUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Cria uma cópia da entidade com alguns campos alterados
  LinkTypeEntity copyWith({
    int? id,
    String? name,
    String? iconUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return LinkTypeEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      iconUrl: iconUrl ?? this.iconUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // TODO: Implementar métodos equals e hashCode se necessário para comparações
  // TODO: Implementar método toString para facilitar a depuração
}
