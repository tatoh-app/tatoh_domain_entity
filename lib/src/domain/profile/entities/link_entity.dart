/// Entidade que representa um link associado a um perfil,
/// alinhada com a definição do backend.
class LinkEntity {
  final int id;
  final int? typeId; // ID do tipo de link (pode ser nulo)
  final int? profileId; // ID do perfil associado (pode ser nulo)
  final String description; // Descrição do link
  final String value; // Valor principal do link (e.g., nome de usuário, número)
  final String url; // URL completa do link
  final bool public; // Indica se o link é público
  final int orderIndex; // Índice para ordenação
  final DateTime createdAt;
  final DateTime updatedAt;

  const LinkEntity({
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

  /// Cria uma cópia da entidade com alguns campos alterados
  LinkEntity copyWith({
    int? id,
    int? typeId,
    int? profileId,
    String? description,
    String? value,
    String? url,
    bool? public,
    int? orderIndex,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return LinkEntity(
      id: id ?? this.id,
      typeId: typeId ?? this.typeId,
      profileId: profileId ?? this.profileId,
      description: description ?? this.description,
      value: value ?? this.value,
      url: url ?? this.url,
      public: public ?? this.public,
      orderIndex: orderIndex ?? this.orderIndex,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // TODO: Implementar métodos equals e hashCode se necessário para comparações
  // TODO: Implementar método toString para facilitar a depuração
}
