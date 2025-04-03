import './link_model.dart'; // Importa o modelo filho
import './qrcode_model.dart'; // Importa o modelo filho
import '../../../domain/profile/entities/complete_profile_entity.dart';


/// Modelo (DTO) para serialização/deserialização e transferência de dados de CompleteProfileEntity.
/// Reside na camada de Dados.
class CompleteProfileModel {
  /// ID do perfil
  final int? id;

  /// ID do usuário associado ao perfil
  final int? userId;

  /// Slug único do perfil (usado em URLs)
  final String? slug;

  /// Nome do perfil
  final String? name;

  /// Biografia do perfil
  final String? bio;

  /// URL da foto do perfil
  final String? photoUrl;

  /// Data de criação do perfil (como DateTime)
  final DateTime? createdAt;

  /// Data de atualização do perfil (como DateTime)
  final DateTime? updatedAt;

  /// Lista de links associados ao perfil (como modelos)
  final List<LinkModel>? links;

  /// Lista de códigos QR associados ao perfil (como modelos)
  final List<QRCodeModel>? qrcodes;

  /// Construtor
  CompleteProfileModel({
    this.id,
    this.userId,
    this.slug,
    this.name,
    this.bio,
    this.photoUrl,
    this.createdAt,
    this.updatedAt,
    this.links,
    this.qrcodes,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory CompleteProfileModel.fromJson(Map<String, dynamic> json) {
    // Adapte as chaves JSON conforme necessário
    return CompleteProfileModel(
      id: json['id'] as int?,
      userId: json['user_id'] as int?, // Exemplo
      slug: json['slug'] as String?,
      name: json['name'] as String?,
      bio: json['bio'] as String?,
      photoUrl: json['photo_url'] as String?, // Exemplo
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String) // Exemplo
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'] as String) // Exemplo
          : null,
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
    // Adapte as chaves JSON conforme necessário
    return {
      'id': id,
      'user_id': userId, // Exemplo
      'slug': slug,
      'name': name,
      'bio': bio,
      'photo_url': photoUrl, // Exemplo
      'created_at': createdAt?.toIso8601String(), // Exemplo
      'updated_at': updatedAt?.toIso8601String(), // Exemplo
      'links': links?.map((e) => e.toJson()).toList(), // Null-aware map
      'qrcodes': qrcodes?.map((e) => e.toJson()).toList(), // Null-aware map
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory CompleteProfileModel.fromEntity(CompleteProfileEntity entity) {
    return CompleteProfileModel(
      id: entity.id,
      userId: entity.userId,
      slug: entity.slug,
      name: entity.name,
      bio: entity.bio,
      photoUrl: entity.photoUrl,
      // Atenção: A entidade original tinha createdAt/updatedAt como String?
      // Se a entidade for atualizada para DateTime?, descomente as linhas abaixo.
      // createdAt: entity.createdAt, 
      // updatedAt: entity.updatedAt,
      // Se a entidade mantiver String?, use:
      createdAt: entity.createdAt != null ? DateTime.tryParse(entity.createdAt!) : null,
      updatedAt: entity.updatedAt != null ? DateTime.tryParse(entity.updatedAt!) : null,
      links: entity.links?.map((e) => LinkModel.fromEntity(e)).toList(),
      qrcodes: entity.qrcodes?.map((e) => QRCodeModel.fromEntity(e)).toList(),
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  CompleteProfileEntity toEntity() {
    return CompleteProfileEntity(
      id: id,
      userId: userId,
      slug: slug,
      name: name,
      bio: bio,
      photoUrl: photoUrl,
      // Atenção: A entidade original tinha createdAt/updatedAt como String?
      // Se a entidade for atualizada para DateTime?, descomente as linhas abaixo.
      // createdAt: createdAt,
      // updatedAt: updatedAt,
      // Se a entidade mantiver String?, use:
      createdAt: createdAt?.toIso8601String(),
      updatedAt: updatedAt?.toIso8601String(),
      links: links?.map((e) => e.toEntity()).toList(), // Null-aware map
      qrcodes: qrcodes?.map((e) => e.toEntity()).toList(), // Null-aware map
    );
  }
}
