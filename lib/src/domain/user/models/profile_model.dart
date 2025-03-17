import '../entities/profile_entity.dart';

/// Modelo para serialização/deserialização de ProfileEntity
class ProfileModel extends ProfileEntity {
  /// Construtor
  ProfileModel({
    required int id,
    required String userId,
    required String name,
    required String slug,
    String? photoUrl,
    String? bio,
    String? phoneNumber,
    String? title,
    String? company,
    String? website,
    String? location,
    Map<String, String>? socialLinks,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super(
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

  /// Cria um modelo a partir de um Map (JSON)
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
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
        (k, e) => MapEntry(k, e as String),
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
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// Cria um modelo a partir de uma entidade
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
}
