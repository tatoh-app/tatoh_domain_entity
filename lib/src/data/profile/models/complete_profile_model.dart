import 'link_model.dart';
import 'qrcode_model.dart';
import '../../../domain/profile/entities/link_entity.dart';
import '../../../domain/profile/entities/qrcode_entity.dart';
import '../../../domain/profile/entities/complete_profile_entity.dart';
// Importa entidades do domínio
// Importa modelos (DTOs) da camada de dados

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

  /// Data de criação do perfil (como String)
  final String? createdAt;

  /// Data de atualização do perfil (como String)
  final String? updatedAt;

  /// Lista de links associados ao perfil (como modelos DTO)
  final List<LinkModel>? links;

  /// Lista de códigos QR associados ao perfil (como modelos DTO)
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
    // TODO: Considerar adicionar validações ou tratamento de nulos mais robusto
    // TODO: Considerar converter createdAt/updatedAt para DateTime aqui, se apropriado
    return CompleteProfileModel(
      id: json['id'] as int?,
      userId: json['user_id'] as int?, // Chave JSON específica
      slug: json['slug'] as String?,
      name: json['name'] as String?,
      bio: json['bio'] as String?,
      photoUrl: json['photo_url'] as String?, // Chave JSON específica
      createdAt: json['created_at'] as String?, // Chave JSON específica
      updatedAt: json['updated_at'] as String?, // Chave JSON específica
      links: json['links'] != null
          ? (json['links'] as List)
              .map((e) => LinkModel.fromJson(e as Map<String, dynamic>)) // Usa LinkModel.fromJson
              .toList()
          : null,
      qrcodes: json['qrcodes'] != null
          ? (json['qrcodes'] as List)
              .map((e) => QRCodeModel.fromJson(e as Map<String, dynamic>)) // Usa QRCodeModel.fromJson
              .toList()
          : null,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId, // Chave JSON específica
      'slug': slug,
      'name': name,
      'bio': bio,
      'photo_url': photoUrl, // Chave JSON específica
      'created_at': createdAt, // Chave JSON específica
      'updated_at': updatedAt, // Chave JSON específica
      // Mapeia cada LinkModel para seu JSON
      'links': links?.map((linkModel) => linkModel.toJson()).toList(),
      // Mapeia cada QRCodeModel para seu JSON
      'qrcodes': qrcodes?.map((qrCodeModel) => qrCodeModel.toJson()).toList(),
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
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      // Mapeia cada LinkEntity para um LinkModel
      links: entity.links?.map((linkEntity) => LinkModel.fromEntity(linkEntity)).toList(),
      // Mapeia cada QRCodeEntity para um QRCodeModel
      qrcodes: entity.qrcodes?.map((qrCodeEntity) => QRCodeModel.fromEntity(qrCodeEntity)).toList(),
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  CompleteProfileEntity toEntity() {
    // TODO: Considerar converter createdAt/updatedAt de String para DateTime na entidade, se necessário
    return CompleteProfileEntity(
      id: id,
      userId: userId,
      slug: slug,
      name: name,
      bio: bio,
      photoUrl: photoUrl,
      createdAt: createdAt,
      updatedAt: updatedAt,
      // Mapeia cada LinkModel para uma LinkEntity
      links: links?.map((linkModel) => linkModel.toEntity()).toList(),
      // Mapeia cada QRCodeModel para uma QRCodeEntity
      qrcodes: qrcodes?.map((qrCodeModel) => qrCodeModel.toEntity()).toList(),
    );
  }
}