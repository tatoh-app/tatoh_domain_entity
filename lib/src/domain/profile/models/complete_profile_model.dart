import '../entities/complete_profile_entity.dart';
import '../entities/link_entity.dart';
import '../entities/qrcode_entity.dart';
import 'link_model.dart';
import 'qrcode_model.dart';

/// Modelo para serialização/deserialização de perfis completos
class CompleteProfileModel extends CompleteProfileEntity {
  /// Construtor
  CompleteProfileModel({
    int? id,
    int? userId,
    String? slug,
    String? name,
    String? bio,
    String? photoUrl,
    String? createdAt,
    String? updatedAt,
    List<LinkEntity>? links,
    List<QRCodeEntity>? qrcodes,
  }) : super(
          id: id,
          userId: userId,
          slug: slug,
          name: name,
          bio: bio,
          photoUrl: photoUrl,
          createdAt: createdAt,
          updatedAt: updatedAt,
          links: links,
          qrcodes: qrcodes,
        );
  
  /// Cria um modelo a partir de um Map (JSON)
  factory CompleteProfileModel.fromJson(Map<String, dynamic> json) {
    return CompleteProfileModel(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      slug: json['slug'] as String?,
      name: json['name'] as String?,
      bio: json['bio'] as String?,
      photoUrl: json['photo_url'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      links: json['links'] != null
          ? (json['links'] as List)
              .map((e) => LinkModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      qrcodes: json['qrcodes'] != null
          ? (json['qrcodes'] as List)
              .map((e) => QRCodeModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }
  
  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'slug': slug,
      'name': name,
      'bio': bio,
      'photo_url': photoUrl,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'links': links?.map((e) {
        if (e is LinkModel) {
          return e.toJson();
        }
        return LinkModel.fromEntity(e).toJson();
      }).toList(),
      'qrcodes': qrcodes?.map((e) {
        if (e is QRCodeModel) {
          return e.toJson();
        }
        return QRCodeModel.fromEntity(e).toJson();
      }).toList(),
    };
  }
  
  /// Cria um modelo a partir de uma entidade
  factory CompleteProfileModel.fromEntity(CompleteProfileEntity entity) {
    return CompleteProfileModel(
      id: entity.id,
      userId: entity.userId,
      slug: entity.slug,
      name: entity.name,
      bio: entity.bio,
      photoUrl: entity.photoUrl,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      links: entity.links,
      qrcodes: entity.qrcodes,
    );
  }
}
