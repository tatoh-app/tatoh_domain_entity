import '../../../domain/profile/entities/qrcode_entity.dart'; // Importa QRCodeEntity

/// Modelo (DTO) para serialização/deserialização e transferência de dados de QRCodeEntity.
<<<<<<< HEAD
/// Reside na camada de Dados.
class QRCodeModel {
  /// ID do código QR
  final int? id;

  /// ID do perfil associado ao código QR
  final int? profileId;

  /// Código QR
  final String? qrcode;

  /// URL da imagem do código QR
  final String? artworkUrl;

  /// Construtor
  QRCodeModel({
    this.id,
    this.profileId,
    this.qrcode,
    this.artworkUrl,
=======
/// Reside na camada de Dados. Alinhado com a QRCodeEntity atualizada.
class QRCodeModel {
  /// ID do código QR
  final int id;

  /// ID do tipo de QR Code (pode ser nulo)
  final int? typeId;

  /// ID do perfil associado ao código QR (pode ser nulo)
  final int? profileId;

  /// ID da venda associada
  final int saleId;

  /// O código QR em si (string)
  final String code;

  /// Lote do QR Code
  final int allotment;

  /// URL das artes associadas
  final String artworksUrl;

  /// Descrição do lote
  final String allotmentDescription;

  /// Data de criação (como DateTime)
  final DateTime createdAt;

  /// Data de atualização (como DateTime)
  final DateTime updatedAt;

  /// Construtor
  QRCodeModel({
    required this.id,
    this.typeId,
    this.profileId,
    required this.saleId,
    required this.code,
    required this.allotment,
    required this.artworksUrl,
    required this.allotmentDescription,
    required this.createdAt,
    required this.updatedAt,
>>>>>>> develop
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory QRCodeModel.fromJson(Map<String, dynamic> json) {
<<<<<<< HEAD
    // TODO: Considerar adicionar validações ou tratamento de nulos mais robusto
    return QRCodeModel(
      id: json['id'] as int?,
      profileId: json['profile_id'] as int?, // Chave JSON específica
      qrcode: json['qrcode'] as String?,
      artworkUrl: json['artwork_url'] as String?, // Chave JSON específica
=======
    return QRCodeModel(
      id: json['id'] as int,
      typeId: json['type_id'] as int?, // Chave JSON específica
      profileId: json['profile_id'] as int?, // Chave JSON específica
      saleId: json['sale_id'] as int, // Chave JSON específica
      code: json['code'] as String,
      allotment: json['allotment'] as int,
      artworksUrl: json['artworks_url'] as String, // Chave JSON específica
      allotmentDescription: json['allotment_description'] as String, // Chave JSON específica
      createdAt: DateTime.parse(json['created_at'] as String), // Chave JSON específica
      updatedAt: DateTime.parse(json['updated_at'] as String), // Chave JSON específica
>>>>>>> develop
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
<<<<<<< HEAD
      'profile_id': profileId, // Chave JSON específica
      'qrcode': qrcode,
      'artwork_url': artworkUrl, // Chave JSON específica
=======
      'type_id': typeId, // Chave JSON específica
      'profile_id': profileId, // Chave JSON específica
      'sale_id': saleId, // Chave JSON específica
      'code': code,
      'allotment': allotment,
      'artworks_url': artworksUrl, // Chave JSON específica
      'allotment_description': allotmentDescription, // Chave JSON específica
      'created_at': createdAt.toIso8601String(), // Chave JSON específica
      'updated_at': updatedAt.toIso8601String(), // Chave JSON específica
>>>>>>> develop
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory QRCodeModel.fromEntity(QRCodeEntity entity) {
    return QRCodeModel(
      id: entity.id,
<<<<<<< HEAD
      profileId: entity.profileId,
      qrcode: entity.qrcode,
      artworkUrl: entity.artworkUrl,
=======
      typeId: entity.typeId,
      profileId: entity.profileId,
      saleId: entity.saleId,
      code: entity.code,
      allotment: entity.allotment,
      artworksUrl: entity.artworksUrl,
      allotmentDescription: entity.allotmentDescription,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
>>>>>>> develop
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  QRCodeEntity toEntity() {
    return QRCodeEntity(
      id: id,
<<<<<<< HEAD
      profileId: profileId,
      qrcode: qrcode,
      artworkUrl: artworkUrl,
    );
  }
}
=======
      typeId: typeId,
      profileId: profileId,
      saleId: saleId,
      code: code,
      allotment: allotment,
      artworksUrl: artworksUrl,
      allotmentDescription: allotmentDescription,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
>>>>>>> develop
