import '../../../domain/card/entities/card_entity.dart'; // Caminho relativo atualizado
// Importa a entidade do domínio

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
    // TODO: Considerar adicionar validações ou tratamento de nulos mais robusto
    return CardModel(
      profileID: json['profileID'] as int,
      qrCode: json['qrCode'] as String,
      artworkUrl: json['artworkUrl'] as String,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'profileID': profileID,
      'qrCode': qrCode,
      'artworkUrl': artworkUrl,
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