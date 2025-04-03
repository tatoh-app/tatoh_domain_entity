import '../../../domain/card/entities/profile_card_widget_entity.dart';

/// Modelo (DTO) para serialização/deserialização e transferência de dados de ProfileCardWidgetEntity.
/// Reside na camada de Dados.
class ProfileCardWidgetModel {
  /// Nome do perfil
  final String? name;

  /// Slug único do perfil (usado em URLs)
  final String? slug;

  /// URL da foto do perfil
  final String? photoUrl;

  /// Código QR associado ao cartão
  final String? qrCode;

  /// Construtor
  ProfileCardWidgetModel({
    this.name,
    this.slug,
    this.photoUrl,
    this.qrCode,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory ProfileCardWidgetModel.fromJson(Map<String, dynamic> json) {
    // Adapte as chaves JSON conforme necessário (e.g., 'photo_url', 'qr_code')
    return ProfileCardWidgetModel(
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      photoUrl: json['photo_url'] as String?, // Exemplo de chave JSON
      qrCode: json['qr_code'] as String?, // Exemplo de chave JSON
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    // Adapte as chaves JSON conforme necessário
    return {
      'name': name,
      'slug': slug,
      'photo_url': photoUrl, // Exemplo de chave JSON
      'qr_code': qrCode, // Exemplo de chave JSON
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory ProfileCardWidgetModel.fromEntity(ProfileCardWidgetEntity entity) {
    return ProfileCardWidgetModel(
      name: entity.name,
      slug: entity.slug,
      photoUrl: entity.photoUrl,
      qrCode: entity.qrCode,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  ProfileCardWidgetEntity toEntity() {
    return ProfileCardWidgetEntity(
      name: name,
      slug: slug,
      photoUrl: photoUrl,
      qrCode: qrCode,
    );
  }
}
