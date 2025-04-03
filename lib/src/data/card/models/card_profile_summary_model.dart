import '../../../domain/card/entities/card_profile_summary_entity.dart';

/// Modelo (DTO) para serialização/deserialização e transferência de dados de CardProfileSummaryEntity.
/// Reside na camada de Dados.
class CardProfileSummaryModel {
  /// Nome do perfil
  final String name;

  /// Slug único do perfil (usado em URLs)
  final String slug;

  /// URL da foto do perfil
  final String photoUrl;

  /// Construtor
  CardProfileSummaryModel({
    required this.name,
    required this.slug,
    required this.photoUrl,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory CardProfileSummaryModel.fromJson(Map<String, dynamic> json) {
    // Adapte as chaves JSON conforme necessário (e.g., 'photo_url')
    return CardProfileSummaryModel(
      name: json['name'] as String,
      slug: json['slug'] as String,
      photoUrl: json['photo_url'] as String, // Exemplo de chave JSON
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    // Adapte as chaves JSON conforme necessário
    return {
      'name': name,
      'slug': slug,
      'photo_url': photoUrl, // Exemplo de chave JSON
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory CardProfileSummaryModel.fromEntity(CardProfileSummaryEntity entity) {
    return CardProfileSummaryModel(
      name: entity.name,
      slug: entity.slug,
      photoUrl: entity.photoUrl,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  CardProfileSummaryEntity toEntity() {
    return CardProfileSummaryEntity(
      name: name,
      slug: slug,
      photoUrl: photoUrl,
    );
  }
}
