/// Entidade que representa um contato (relação entre dois usuários/perfis) no sistema,
/// alinhada com a definição do backend.
class ContactEntity {
  final int id;
  final int ownerId; // ID do "dono" da relação de contato
  final int contactId; // ID do usuário/perfil que é o contato
  final DateTime createdAt;
  final DateTime updatedAt;

  const ContactEntity({
    required this.id,
    required this.ownerId,
    required this.contactId,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Cria uma cópia da entidade com alguns campos alterados
  ContactEntity copyWith({
    int? id,
    int? ownerId,
    int? contactId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ContactEntity(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      contactId: contactId ?? this.contactId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // TODO: Implementar métodos equals e hashCode se necessário para comparações
  // TODO: Implementar método toString para facilitar a depuração
}
