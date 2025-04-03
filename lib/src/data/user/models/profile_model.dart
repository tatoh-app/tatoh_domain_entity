import '../../../domain/user/entities/profile_entity.dart'; // Importa ProfileEntity

/// Modelo (DTO) para serialização/deserialização e transferência de dados de ProfileEntity.
/// Reside na camada de Dados.
class ProfileModel {
  final int id;
  final int userId;
  final int? addressId;
  final String slug;
  final String name;
  final String bio;
  final String photoUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Construtor
  ProfileModel({
    required this.id,
    required this.userId,
    this.addressId,
    required this.slug,
    required this.name,
    required this.bio,
    required this.photoUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    // TODO: Considerar adicionar validações ou tratamento de nulos mais robusto
    return ProfileModel(
      id: json['id'] as int,
      userId: json['user_id'] as int, // Assumindo snake_case e int
      addressId: json['address_id'] as int?, // Assumindo snake_case e int?
      slug: json['slug'] as String,
      name: json['name'] as String,
      bio: json['bio'] as String, // Assumindo não nulo
      photoUrl: json['photo_url'] as String, // Assumindo snake_case e não nulo
      createdAt: DateTime.parse(json['created_at'] as String), // Assumindo snake_case
      updatedAt: DateTime.parse(json['updated_at'] as String), // Assumindo snake_case
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      if (addressId != null) 'address_id': addressId,
      'slug': slug,
      'name': name,
      'bio': bio,
      'photo_url': photoUrl,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory ProfileModel.fromEntity(ProfileEntity entity) {
    return ProfileModel(
      id: entity.id,
      userId: entity.userId,
      addressId: entity.addressId,
      slug: entity.slug,
      name: entity.name,
      bio: entity.bio,
      photoUrl: entity.photoUrl,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  ProfileEntity toEntity() {
    return ProfileEntity(
      id: id,
      userId: userId,
      addressId: addressId,
      slug: slug,
      name: name,
      bio: bio,
      photoUrl: photoUrl,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
