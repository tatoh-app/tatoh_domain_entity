import '../entities/card_profile_summary_entity.dart';

/// Modelo para serialização/deserialização de CardProfileSummaryEntity
class CardProfileSummaryModel extends CardProfileSummaryEntity {
  /// Construtor
  CardProfileSummaryModel({
    required String name,
    required String slug,
    required String photoUrl,
  }) : super(
          name: name,
          slug: slug,
          photoUrl: photoUrl,
        );

  /// Cria um modelo a partir de um Map (JSON)
  factory CardProfileSummaryModel.fromJson(Map<String, dynamic> json) {
    return CardProfileSummaryModel(
      name: json['name'] as String,
      slug: json['slug'] as String,
      photoUrl: json['photoUrl'] as String,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'slug': slug,
      'photoUrl': photoUrl,
    };
  }

  /// Cria um modelo a partir de uma entidade
  factory CardProfileSummaryModel.fromEntity(CardProfileSummaryEntity entity) {
    return CardProfileSummaryModel(
      name: entity.name,
      slug: entity.slug,
      photoUrl: entity.photoUrl,
    );
  }
}
