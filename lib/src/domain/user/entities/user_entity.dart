/// Entidade que representa um usuário no sistema
class UserEntity {
  /// ID único do usuário
  final int id;
  
  /// Email do usuário
  final String email;
  
  /// Nome do usuário
  final String name;
  
  /// Indica se o email do usuário foi verificado
  final bool emailVerified;
  
  /// Data de criação da conta
  final DateTime createdAt;
  
  /// Data da última atualização da conta
  final DateTime updatedAt;
  
  /// Construtor
  const UserEntity({
    required this.id,
    required this.email,
    required this.emailVerified,
    required this.createdAt,
    required this.updatedAt,
  });
  
  /// Cria uma cópia da entidade com alguns campos alterados
  UserEntity copyWith({
    String? id,
    String? email,
    String? name,
    String? photoUrl,
    bool? emailVerified,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      emailVerified: emailVerified ?? this.emailVerified,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}