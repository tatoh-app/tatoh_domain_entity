import '../../../domain/profile/entities/qrcode_entity.dart'; // Importa QRCodeEntity

/// Modelo (DTO) para serialização/deserialização e transferência de dados de QRCodeEntity.
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
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory QRCodeModel.fromJson(Map<String, dynamic> json) {
    // TODO: Considerar adicionar validações ou tratamento de nulos mais robusto
    return QRCodeModel(
      id: json['id'] as int?,
      profileId: json['profile_id'] as int?, // Chave JSON específica
      qrcode: json['qrcode'] as String?,
      artworkUrl: json['artwork_url'] as String?, // Chave JSON específica
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'profile_id': profileId, // Chave JSON específica
      'qrcode': qrcode,
      'artwork_url': artworkUrl, // Chave JSON específica
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory QRCodeModel.fromEntity(QRCodeEntity entity) {
    return QRCodeModel(
      id: entity.id,
      profileId: entity.profileId,
      qrcode: entity.qrcode,
      artworkUrl: entity.artworkUrl,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  QRCodeEntity toEntity() {
    return QRCodeEntity(
      id: id,
      profileId: profileId,
      qrcode: qrcode,
      artworkUrl: artworkUrl,
    );
  }
}