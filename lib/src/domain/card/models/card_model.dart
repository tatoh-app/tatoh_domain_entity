import '../entities/card_entity.dart';

/// Modelo para serialização/deserialização de CardEntity
class CardModel extends CardEntity {
  /// Construtor
  CardModel({
    required int profileID,
    required String qrCode,
    required String artworkUrl,
  }) : super(
          profileID: profileID,
          qrCode: qrCode,
          artworkUrl: artworkUrl,
        );

  /// Cria um modelo a partir de um Map (JSON)
  factory CardModel.fromJson(Map<String, dynamic> json) {
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

  /// Cria um modelo a partir de uma entidade
  factory CardModel.fromEntity(CardEntity entity) {
    return CardModel(
      profileID: entity.profileID,
      qrCode: entity.qrCode,
      artworkUrl: entity.artworkUrl,
    );
  }
}
