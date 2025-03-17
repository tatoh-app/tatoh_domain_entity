/// Entidade que representa um contato no sistema
class ContactEntity {
  /// ID nome do contato
  final String name;

  /// URL da foto do contato
  final String photoUrl;

  /// Identificador único do contato (slug)
  final String slug;

  /// Dados adicionais que podem ser usados pelo aplicativo
  final Map<String, dynamic>? extraData;

  /// Construtor
  const ContactEntity({
    required this.name,
    required this.slug,
    required this.photoUrl,
    this.extraData,

  });

  /// Cria uma cópia da entidade com alguns campos alterados
  ContactEntity copyWith({
    String? name,
    String? slug,
    String? photoUrl,
    Map<String, dynamic>? extraData,
  }) {
    return ContactEntity(
      name: name ?? this.name,
      slug: slug ?? this.slug,
      photoUrl: photoUrl ?? this.photoUrl,
      extraData: extraData ?? this.extraData,
    );
  }
}
