import '../entities/check_qrcode_entity.dart';

/// Modelo para serialização/deserialização de CheckQRCodeEntity
class CheckQRCodeModel {
  /// Construtor
  CheckQRCodeModel({
    required this.check,
    this.id,
    this.profileId,
    required this.code,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory CheckQRCodeModel.fromJson(Map<String, dynamic> json) {
    return CheckQRCodeModel(
      check: json['check'] as bool,
      id: json['id'] == null ? null : json['id'] as int,
      profileId: json['profileId'] == null ? null : json['profileId'] as int,
      code: json['code'] as String,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'check': check,
      'id': id,
      'profileId': profileId,
      'code': code,
    };
  }

  /// Cria um modelo a partir de uma entidade
  factory CheckQRCodeModel.fromEntity(CheckQRCodeEntity entity) {
    return CheckQRCodeModel(
      check: entity.check,
      id: entity.id,
      profileId: entity.profileId,
      code: entity.code,
    );
  }

  /// Propriedades
  final bool check;
  final int? id;
  final int? profileId;
  final String code;
}
