import '../../../domain/card/entities/card_entity.dart';

/// Modelo (DTO) para serialização/deserialização e transferência de dados de CardEntity.
/// Reside na camada de Dados.
class CardModel {
  /// ID do perfil associado ao cartão
  final int profileID;

  /// Código QR associado ao cartão
  final String qrCode;

  /// URL da imagem do cartão
  final String artworkUrl;

  /// Construtor
  CardModel({
    required this.profileID,
    required this.qrCode,
    required this.artworkUrl,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory CardModel.fromJson(Map<String, dynamic> json) {
    // Adapte as chaves JSON conforme necessário (e.g., 'profile_id', 'qr_code', 'artwork_url')
    return CardModel(
      profileID: json['profile_id'] as int, // Exemplo de chave JSON
      qrCode: json['qr_code'] as String, // Exemplo de chave JSON
      artworkUrl: json['artwork_url'] as String, // Exemplo de chave JSON
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    // Adapte as chaves JSON conforme necessário
    return {
      'profile_id': profileID, // Exemplo de chave JSON
      'qr_code': qrCode, // Exemplo de chave JSON
      'artwork_url': artworkUrl, // Exemplo de chave JSON
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory CardModel.fromEntity(CardEntity entity) {
    return CardModel(
      profileID: entity.profileID,
      qrCode: entity.qrCode,
      artworkUrl: entity.artworkUrl,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  CardEntity toEntity() {
    return CardEntity(
      profileID: profileID,
      qrCode: qrCode,
      artworkUrl: artworkUrl,
    );
  }
}
