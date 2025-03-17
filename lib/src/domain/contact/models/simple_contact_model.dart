import '../entities/simple_contact_entity.dart';

/// Modelo para serialização/deserialização de SimpleContactEntity
class SimpleContactModel extends SimpleContactEntity {
  /// Construtor
  SimpleContactModel({
    String? name,
    String? slug,
    String? photoUrl,
  }) : super(
          name: name,
          slug: slug,
          photoUrl: photoUrl,
        );

  /// Cria um modelo a partir de um Map (JSON)
  factory SimpleContactModel.fromJson(Map<String, dynamic> json) {
    return SimpleContactModel(
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      photoUrl: json['photoUrl'] as String?,
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
  factory SimpleContactModel.fromEntity(SimpleContactEntity entity) {
    return SimpleContactModel(
      name: entity.name,
      slug: entity.slug,
      photoUrl: entity.photoUrl,
    );
  }
}
