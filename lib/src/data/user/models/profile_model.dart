import '../../../domain/user/entities/profile_entity.dart'; // Importa ProfileEntity

/// Modelo (DTO) para serialização/deserialização e transferência de dados de ProfileEntity.
/// Reside na camada de Dados.
class ProfileModel {
  /// ID único do perfil
  final int id;

  /// ID do usuário associado a este perfil
  final String userId;

  /// Nome do perfil
  final String name;

  /// Slug único para o perfil (usado em URLs)
  final String slug;

  /// URL da foto do perfil
  final String? photoUrl;

  /// Biografia ou descrição do perfil
  final String? bio;

  /// Número de telefone
  final String? phoneNumber;

  /// Cargo ou título profissional
  final String? title;

  /// Empresa ou organização
  final String? company;

  /// Website pessoal ou profissional
  final String? website;

  /// Localização
  final String? location;

  /// Redes sociais
  final Map<String, String>? socialLinks;

  /// Data de criação do perfil
  final DateTime createdAt;

  /// Data da última atualização do perfil
  final DateTime updatedAt;

  /// Construtor
  ProfileModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.slug,
    this.photoUrl,
    this.bio,
    this.phoneNumber,
    this.title,
    this.company,
    this.website,
    this.location,
    this.socialLinks,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    // TODO: Considerar adicionar validações ou tratamento de nulos mais robusto
    return ProfileModel(
      id: json['id'] as int,
      userId: json['userId'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      photoUrl: json['photoUrl'] as String?,
      bio: json['bio'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      title: json['title'] as String?,
      company: json['company'] as String?,
      website: json['website'] as String?,
      location: json['location'] as String?,
      socialLinks: (json['socialLinks'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String), // Garante que o valor é String
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'slug': slug,
      'photoUrl': photoUrl,
      'bio': bio,
      'phoneNumber': phoneNumber,
      'title': title,
      'company': company,
      'website': website,
      'location': location,
      'socialLinks': socialLinks,
      'createdAt': createdAt.toIso8601String(), // Converte DateTime para String ISO8601
      'updatedAt': updatedAt.toIso8601String(), // Converte DateTime para String ISO8601
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory ProfileModel.fromEntity(ProfileEntity entity) {
    return ProfileModel(
      id: entity.id,
      userId: entity.userId,
      name: entity.name,
      slug: entity.slug,
      photoUrl: entity.photoUrl,
      bio: entity.bio,
      phoneNumber: entity.phoneNumber,
      title: entity.title,
      company: entity.company,
      website: entity.website,
      location: entity.location,
      socialLinks: entity.socialLinks,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  ProfileEntity toEntity() {
    return ProfileEntity(
      id: id,
      userId: userId,
      name: name,
      slug: slug,
      photoUrl: photoUrl,
      bio: bio,
      phoneNumber: phoneNumber,
      title: title,
      company: company,
      website: website,
      location: location,
      socialLinks: socialLinks,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}