
/// Entidade que representa um perfil de usuário no sistema,
/// alinhada com a definição do backend.
class ProfileEntity {
  final int id;
  final int userId; // Alterado para int
  final int? addressId; // Nullable based on migration 1672188504629
  final String slug;
  final String name;
  final String bio;
  final String photoUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ProfileEntity({
    required this.id,
    required this.userId,
    this.addressId,
    required this.slug,
    required this.name,
    required this.bio,
    required this.photoUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Cria uma cópia da entidade com alguns campos alterados
  ProfileEntity copyWith({
    int? id,
    int? userId,
    int? addressId,
    String? slug,
    String? name,
    String? bio,
    String? photoUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProfileEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      addressId: addressId ?? this.addressId,
      slug: slug ?? this.slug,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      photoUrl: photoUrl ?? this.photoUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // TODO: Implementar métodos equals e hashCode se necessário para comparações
  // TODO: Implementar método toString para facilitar a depuração
}
