/// Entidade que representa um usuário no sistema,
/// alinhada com a definição do backend.
class UserEntity {
  final int id;
  final String email;
  final String? customerId; // ID do cliente (e.g., Stripe)
  final int? defaultProfileId; // ID do perfil padrão associado
  final String? firebaseUid; // UID do Firebase Auth
  final String? provider; // Provedor de autenticação (e.g., 'google', 'email')
  final String? refreshToken; // Token de atualização (geralmente não exposto diretamente)
  final DateTime? lastLogin; // Data do último login
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserEntity({
    required this.id,
    required this.email,
    this.customerId,
    this.defaultProfileId,
    this.firebaseUid,
    this.provider,
    this.refreshToken,
    this.lastLogin,
    // this.token, // Campo 'token' geralmente não pertence à entidade do domínio
    required this.createdAt,
    required this.updatedAt,
  });

  /// Cria uma cópia da entidade com alguns campos alterados
  UserEntity copyWith({
    int? id,
    String? email,
    String? customerId,
    int? defaultProfileId,
    String? firebaseUid,
    String? provider,
    String? refreshToken,
    DateTime? lastLogin,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      customerId: customerId ?? this.customerId,
      defaultProfileId: defaultProfileId ?? this.defaultProfileId,
      firebaseUid: firebaseUid ?? this.firebaseUid,
      provider: provider ?? this.provider,
      refreshToken: refreshToken ?? this.refreshToken,
      lastLogin: lastLogin ?? this.lastLogin,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // TODO: Implementar métodos equals e hashCode se necessário para comparações
  // TODO: Implementar método toString para facilitar a depuração
}
