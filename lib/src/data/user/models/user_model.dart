import '../../../domain/user/entities/user_entity.dart'; // Importa UserEntity

/// Modelo (DTO) para serialização/deserialização e transferência de dados de UserEntity.
/// Reside na camada de Dados.
class UserModel {
  final int id;
  final String email;
  final String? customerId;
  final int? defaultProfileId;
  final String? firebaseUid;
  final String? provider;
  final String? refreshToken; // Geralmente não serializado/deserializado
  final DateTime? lastLogin;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Construtor
  UserModel({
    required this.id,
    required this.email,
    this.customerId,
    this.defaultProfileId,
    this.firebaseUid,
    this.provider,
    this.refreshToken,
    this.lastLogin,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    // TODO: Considerar adicionar validações ou tratamento de nulos mais robusto
    return UserModel(
      id: json['id'] as int,
      email: json['email'] as String,
      customerId: json['customer_id'] as String?, // Assumindo snake_case
      defaultProfileId: json['default_profile_id'] as int?, // Assumindo snake_case
      firebaseUid: json['firebase_uid'] as String?, // Assumindo snake_case
      provider: json['provider'] as String?,
      refreshToken: json['refresh_token'] as String?, // Se presente no JSON
      lastLogin: json['last_login'] == null ? null : DateTime.parse(json['last_login'] as String), // Assumindo snake_case
      createdAt: DateTime.parse(json['created_at'] as String), // Assumindo snake_case
      updatedAt: DateTime.parse(json['updated_at'] as String), // Assumindo snake_case
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      if (customerId != null) 'customer_id': customerId,
      if (defaultProfileId != null) 'default_profile_id': defaultProfileId,
      if (firebaseUid != null) 'firebase_uid': firebaseUid,
      if (provider != null) 'provider': provider,
      // Geralmente não incluímos refreshToken no toJson
      if (lastLogin != null) 'last_login': lastLogin!.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      customerId: entity.customerId,
      defaultProfileId: entity.defaultProfileId,
      firebaseUid: entity.firebaseUid,
      provider: entity.provider,
      refreshToken: entity.refreshToken,
      lastLogin: entity.lastLogin,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      customerId: customerId,
      defaultProfileId: defaultProfileId,
      firebaseUid: firebaseUid,
      provider: provider,
      refreshToken: refreshToken,
      lastLogin: lastLogin,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
