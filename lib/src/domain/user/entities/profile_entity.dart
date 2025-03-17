

/// Entidade que representa um perfil de usuário no sistema
class ProfileEntity {
  /// ID único do perfil
  final int id;
  
  /// ID do usuário associado a este perfil
  final String userId;
  
  /// Nome do perfil
  final String name;
  
  /// Slug único para o perfil (usado em URLs)
  final String slug;
  
  /// URL da foto do perfil
  final String? photoUrl;
  
  /// Biografia ou descrição do perfil
  final String? bio;
  
  /// Número de telefone
  final String? phoneNumber;
  
  /// Cargo ou título profissional
  final String? title;
  
  /// Empresa ou organização
  final String? company;
  
  /// Website pessoal ou profissional
  final String? website;
  
  /// Localização
  final String? location;
  
  /// Redes sociais
  final Map<String, String>? socialLinks;
  
  /// Data de criação do perfil
  final DateTime createdAt;
  
  /// Data da última atualização do perfil
  final DateTime updatedAt;
  
  /// Construtor
  const ProfileEntity({
    required this.id,
    required this.userId,
    required this.name,
    required this.slug,
    this.photoUrl,
    this.bio,
    this.phoneNumber,
    this.title,
    this.company,
    this.website,
    this.location,
    this.socialLinks,
    required this.createdAt,
    required this.updatedAt,
  });
  
  /// Cria uma cópia da entidade com alguns campos alterados
  ProfileEntity copyWith({
    int? id,
    String? userId,
    String? name,
    String? slug,
    String? photoUrl,
    String? bio,
    String? phoneNumber,
    String? title,
    String? company,
    String? website,
    String? location,
    Map<String, String>? socialLinks,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProfileEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      photoUrl: photoUrl ?? this.photoUrl,
      bio: bio ?? this.bio,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      title: title ?? this.title,
      company: company ?? this.company,
      website: website ?? this.website,
      location: location ?? this.location,
      socialLinks: socialLinks ?? this.socialLinks,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
  

}
