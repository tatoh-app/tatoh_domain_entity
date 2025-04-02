import '../../../domain/contact/entities/contact_entity.dart'; // Importa a entidade do domínio

/// Modelo (DTO) para serialização/deserialização e transferência de dados de ContactEntity.
/// Reside na camada de Dados.
class ContactModel {
  /// Nome do contato
  final String name;

  /// URL da foto do contato
  final String photoUrl;

  /// Identificador único do contato (slug)
  final String slug;

  /// Dados adicionais que podem ser usados pelo aplicativo
  final Map<String, dynamic>? extraData;

  /// Construtor
  ContactModel({
    required this.name,
    required this.photoUrl,
    required this.slug,
    this.extraData,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory ContactModel.fromJson(Map<String, dynamic> json) {
    // TODO: Considerar adicionar validações ou tratamento de nulos mais robusto
    return ContactModel(
      name: json['name'] ?? '',
      photoUrl: json['photoUrl'] ?? '',
      slug: json['slug'] ?? '',
      extraData: json['extraData'] as Map<String, dynamic>?, // Cast explícito
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'photoUrl': photoUrl,
      'slug': slug,
      if (extraData != null) 'extraData': extraData,
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory ContactModel.fromEntity(ContactEntity entity) {
    return ContactModel(
      name: entity.name,
      photoUrl: entity.photoUrl,
      slug: entity.slug,
      extraData: entity.extraData,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  ContactEntity toEntity() {
    return ContactEntity(
      name: name,
      photoUrl: photoUrl,
      slug: slug,
      extraData: extraData,
    );
  }
}