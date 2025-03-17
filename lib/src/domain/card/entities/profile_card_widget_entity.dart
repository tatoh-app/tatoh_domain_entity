

/// Entidade que representa um widget de cartão de perfil
class ProfileCardWidgetEntity {
  /// Nome do perfil
  final String? name;
  
  /// Slug único do perfil (usado em URLs)
  final String? slug;
  
  /// URL da foto do perfil
  final String? photoUrl;
  
  /// Código QR associado ao cartão
  final String? qrCode;

  /// Construtor
  const ProfileCardWidgetEntity({
    this.name, 
    this.slug, 
    this.photoUrl, 
    this.qrCode
  });
  
  /// Cria uma cópia da entidade com alguns campos alterados
  ProfileCardWidgetEntity copyWith({
    String? name,
    String? slug,
    String? photoUrl,
    String? qrCode,
  }) {
    return ProfileCardWidgetEntity(
      name: name ?? this.name,
      slug: slug ?? this.slug,
      photoUrl: photoUrl ?? this.photoUrl,
      qrCode: qrCode ?? this.qrCode,
    );
  }
  

}
