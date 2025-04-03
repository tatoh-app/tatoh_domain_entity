import '../../../domain/contact/entities/simple_contact_entity.dart';

/// Modelo (DTO) para serialização/deserialização e transferência de dados de SimpleContactEntity.
/// Reside na camada de Dados.
class SimpleContactModel {
  /// Nome do contato
  final String? name;

  /// Slug único do contato (usado em URLs)
  final String? slug;

  /// URL da foto do contato
  final String? photoUrl;

  /// Construtor
  SimpleContactModel({
    this.name,
    this.slug,
    this.photoUrl,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory SimpleContactModel.fromJson(Map<String, dynamic> json) {
    // Adapte as chaves JSON conforme necessário (e.g., 'photo_url')
    return SimpleContactModel(
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      photoUrl: json['photo_url'] as String?, // Exemplo de chave JSON
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
  factory SimpleContactModel.fromEntity(SimpleContactEntity entity) {
    return SimpleContactModel(
      name: entity.name,
      slug: entity.slug,
      photoUrl: entity.photoUrl,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  SimpleContactEntity toEntity() {
    return SimpleContactEntity(
      name: name,
      slug: slug,
      photoUrl: photoUrl,
    );
  }
}
