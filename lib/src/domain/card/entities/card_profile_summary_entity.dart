

/// Entidade que representa um resumo do perfil associado a um cartão
class CardProfileSummaryEntity {
  /// Nome do perfil
  final String name;
  
  /// Slug único do perfil (usado em URLs)
  final String slug;
  
  /// URL da foto do perfil
  final String photoUrl;

  /// Construtor
  const CardProfileSummaryEntity({
    required this.name,
    required this.slug,
    required this.photoUrl,
  });
  
  /// Cria uma cópia da entidade com alguns campos alterados
  CardProfileSummaryEntity copyWith({
    String? name,
    String? slug,
    String? photoUrl,
  }) {
    return CardProfileSummaryEntity(
      name: name ?? this.name,
      slug: slug ?? this.slug,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }
  

}
