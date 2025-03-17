

/// Entidade que representa um cartão no sistema

class CardEntity {
  /// ID do perfil associado ao cartão
  final int profileID;
  
  /// Código QR associado ao cartão
  final String qrCode;
  
  /// URL da imagem do cartão
  final String artworkUrl;

  /// Construtor
  const CardEntity({
    required this.profileID,
    required this.qrCode,
    required this.artworkUrl,
  });
  
  /// Cria uma cópia da entidade com alguns campos alterados
  CardEntity copyWith({
    int? profileID,
    String? qrCode,
    String? artworkUrl,
  }) {
    return CardEntity(
      profileID: profileID ?? this.profileID,
      qrCode: qrCode ?? this.qrCode,
      artworkUrl: artworkUrl ?? this.artworkUrl,
    );
  }
  

}
