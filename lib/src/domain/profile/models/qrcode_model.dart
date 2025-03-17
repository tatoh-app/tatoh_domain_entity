import '../entities/qrcode_entity.dart';

/// Modelo para serialização/deserialização de códigos QR
class QRCodeModel extends QRCodeEntity {
  /// Construtor
  QRCodeModel({
    int? id,
    int? profileId,
    String? qrcode,
    String? artworkUrl,
  }) : super(
          id: id,
          profileId: profileId,
          qrcode: qrcode,
          artworkUrl: artworkUrl,
        );
  
  /// Cria um modelo a partir de um Map (JSON)
  factory QRCodeModel.fromJson(Map<String, dynamic> json) {
    return QRCodeModel(
      id: json['id'] as int?,
      profileId: json['profile_id'] as int?,
      qrcode: json['qrcode'] as String?,
      artworkUrl: json['artwork_url'] as String?,
    );
  }
  
  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'profile_id': profileId,
      'qrcode': qrcode,
      'artwork_url': artworkUrl,
    };
  }
  
  /// Cria um modelo a partir de uma entidade
  factory QRCodeModel.fromEntity(QRCodeEntity entity) {
    return QRCodeModel(
      id: entity.id,
      profileId: entity.profileId,
      qrcode: entity.qrcode,
      artworkUrl: entity.artworkUrl,
    );
  }
}
