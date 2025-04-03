import '../../../domain/card/entities/check_qrcode_entity.dart';

/// Modelo (DTO) para serialização/deserialização e transferência de dados de CheckQRCodeEntity.
/// Reside na camada de Dados.
class CheckQRCodeModel {
  /// Indica se a verificação foi bem-sucedida
  final bool check;

  /// ID do QR Code (pode ser nulo na resposta)
  final int? id;

  /// ID do perfil associado ao QR Code (pode ser nulo na resposta)
  final int? profileId;

  /// Código QR verificado
  final String code;

  /// Construtor
  CheckQRCodeModel({
    required this.check,
    this.id,
    this.profileId,
    required this.code,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory CheckQRCodeModel.fromJson(Map<String, dynamic> json) {
    // Adapte as chaves JSON conforme necessário (e.g., 'profile_id')
    return CheckQRCodeModel(
      check: json['check'] as bool,
      id: json['id'] as int?,
      profileId: json['profile_id'] as int?, // Exemplo de chave JSON
      code: json['code'] as String,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    // Adapte as chaves JSON conforme necessário
    return {
      'check': check,
      'id': id,
      'profile_id': profileId, // Exemplo de chave JSON
      'code': code,
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory CheckQRCodeModel.fromEntity(CheckQRCodeEntity entity) {
    return CheckQRCodeModel(
      check: entity.check,
      id: entity.id,
      profileId: entity.profileId,
      code: entity.code,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  CheckQRCodeEntity toEntity() {
    return CheckQRCodeEntity(
      check: check,
      id: id,
      profileId: profileId,
      code: code,
    );
  }
}
