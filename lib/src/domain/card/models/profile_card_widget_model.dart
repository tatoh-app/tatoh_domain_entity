import '../entities/profile_card_widget_entity.dart';

/// Modelo para serialização/deserialização de ProfileCardWidgetEntity
class ProfileCardWidgetModel extends ProfileCardWidgetEntity {
  /// Construtor
  ProfileCardWidgetModel({
    String? name,
    String? slug,
    String? photoUrl,
    String? qrCode,
  }) : super(
          name: name,
          slug: slug,
          photoUrl: photoUrl,
          qrCode: qrCode,
        );

  /// Cria um modelo a partir de um Map (JSON)
  factory ProfileCardWidgetModel.fromJson(Map<String, dynamic> json) {
    return ProfileCardWidgetModel(
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      photoUrl: json['photoUrl'] as String?,
      qrCode: json['qrCode'] as String?,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'slug': slug,
      'photoUrl': photoUrl,
      'qrCode': qrCode,
    };
  }

  /// Cria um modelo a partir de uma entidade
  factory ProfileCardWidgetModel.fromEntity(ProfileCardWidgetEntity entity) {
    return ProfileCardWidgetModel(
      name: entity.name,
      slug: entity.slug,
      photoUrl: entity.photoUrl,
      qrCode: entity.qrCode,
    );
  }
}
