/// Entidade que representa um código QR associado a um perfil
class QRCodeEntity {
  /// ID do código QR
  final int? id;
  
  /// ID do perfil associado ao código QR
  final int? profileId;
  
  /// Código QR
  final String? qrcode;
  
  /// URL da imagem do código QR
  final String? artworkUrl;

  /// Construtor
  const QRCodeEntity({
    this.id,
    this.profileId,
    this.qrcode,
    this.artworkUrl,
  });
  
  /// Cria uma cópia da entidade com alguns campos alterados
  QRCodeEntity copyWith({
    int? id,
    int? profileId,
    String? qrcode,
    String? artworkUrl,
  }) {
    return QRCodeEntity(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      qrcode: qrcode ?? this.qrcode,
      artworkUrl: artworkUrl ?? this.artworkUrl,
    );
  }
}
