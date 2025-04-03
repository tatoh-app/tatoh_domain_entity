/// Entidade que representa um código QR associado a um perfil,
/// alinhada com a definição do backend.
class QRCodeEntity {
  final int id;
  final int? typeId; // ID do tipo de QR Code (pode ser nulo)
  final int? profileId; // ID do perfil associado (pode ser nulo)
  final int saleId; // ID da venda associada
  final String code; // O código QR em si (string)
  final int allotment; // Lote do QR Code
  final String artworksUrl; // URL das artes associadas
  final String allotmentDescription; // Descrição do lote
  final DateTime createdAt;
  final DateTime updatedAt;

  const QRCodeEntity({
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
  });

  /// Cria uma cópia da entidade com alguns campos alterados
  QRCodeEntity copyWith({
    int? id,
    int? typeId,
    int? profileId,
    int? saleId,
    String? code,
    int? allotment,
    String? artworksUrl,
    String? allotmentDescription,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return QRCodeEntity(
      id: id ?? this.id,
      typeId: typeId ?? this.typeId,
      profileId: profileId ?? this.profileId,
      saleId: saleId ?? this.saleId,
      code: code ?? this.code,
      allotment: allotment ?? this.allotment,
      artworksUrl: artworksUrl ?? this.artworksUrl,
      allotmentDescription: allotmentDescription ?? this.allotmentDescription,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // TODO: Implementar métodos equals e hashCode se necessário para comparações
  // TODO: Implementar método toString para facilitar a depuração
}
