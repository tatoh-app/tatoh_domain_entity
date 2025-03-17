


/// Entidade que representa o resultado de uma verificação de QR Code

class CheckQRCodeEntity {
  /// Indica se a verificação foi bem-sucedida
  final bool check;
  
  /// ID do QR Code
  final int? id;
  
  /// ID do perfil associado ao QR Code
  final int? profileId;
  
  /// Código QR
  final String code;

  /// Construtor
  const CheckQRCodeEntity({
    required this.check,
    this.id,
    this.profileId,
    required this.code,
  });
  
  /// Cria uma cópia da entidade com alguns campos alterados
  CheckQRCodeEntity copyWith({
    bool? check,
    int? id,
    int? profileId,
    String? code,
  }) {
    return CheckQRCodeEntity(
      check: check ?? this.check,
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      code: code ?? this.code,
    );
  }
  

  

  

}
