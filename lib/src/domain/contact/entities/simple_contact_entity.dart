

/// Entidade que representa um contato simplificado no sistema
class SimpleContactEntity {
  /// Nome do contato
  final String? name;
  
  /// Slug único do contato (usado em URLs)
  final String? slug;
  
  /// URL da foto do contato
  final String? photoUrl;

  /// Construtor
  const SimpleContactEntity({
    this.name,
    this.slug,
    this.photoUrl,
  });
  
  /// Construtor alternativo compatível com a versão original
  SimpleContactEntity.fromOriginal(this.name, this.slug, this.photoUrl);
  
  /// Cria uma cópia da entidade com alguns campos alterados
  SimpleContactEntity copyWith({
    String? name,
    String? slug,
    String? photoUrl,
  }) {
    return SimpleContactEntity(
      name: name ?? this.name,
      slug: slug ?? this.slug,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }
  

}
