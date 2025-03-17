import 'link_entity.dart';
import 'qrcode_entity.dart';

/// Entidade que representa um perfil completo com todos os seus dados
class CompleteProfileEntity {
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
  
  /// Data de criação do perfil
  final String? createdAt;
  
  /// Data de atualização do perfil
  final String? updatedAt;
  
  /// Lista de links associados ao perfil
  final List<LinkEntity>? links;
  
  /// Lista de códigos QR associados ao perfil
  final List<QRCodeEntity>? qrcodes;

  /// Construtor
  const CompleteProfileEntity({
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
  
  /// Cria uma cópia da entidade com alguns campos alterados
  CompleteProfileEntity copyWith({
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
  }) {
    return CompleteProfileEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      slug: slug ?? this.slug,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      photoUrl: photoUrl ?? this.photoUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      links: links ?? this.links,
      qrcodes: qrcodes ?? this.qrcodes,
    );
  }
  

}
