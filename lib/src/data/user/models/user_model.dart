import '../../../domain/user/entities/user_entity.dart'; // Importa UserEntity

/// Modelo (DTO) para serialização/deserialização e transferência de dados de UserEntity.
/// Reside na camada de Dados.
class UserModel {
  /// ID único do usuário (como String, baseado na serialização original)
  final String id;

  /// Email do usuário
  final String email;

  /// Nome do usuário
  final String name;

  /// URL da foto do usuário
  final String? photoUrl;

  /// Indica se o email do usuário foi verificado
  final bool emailVerified;

  /// Data de criação da conta
  final DateTime createdAt;

  /// Data da última atualização da conta
  final DateTime updatedAt;

  /// Construtor
  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.photoUrl,
    required this.emailVerified,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    // TODO: Considerar adicionar validações ou tratamento de nulos mais robusto
    return UserModel(
      id: json['id'] as String, // Mantém como String
      email: json['email'] as String,
      name: json['name'] as String,
      photoUrl: json['photo_url'] as String?, // Chave JSON específica
      emailVerified: json['email_verified'] as bool, // Chave JSON específica
      createdAt: DateTime.parse(json['created_at'] as String), // Chave JSON específica
      updatedAt: DateTime.parse(json['updated_at'] as String), // Chave JSON específica
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'photo_url': photoUrl, // Chave JSON específica
      'email_verified': emailVerified, // Chave JSON específica
      'created_at': createdAt.toIso8601String(), // Chave JSON específica
      'updated_at': updatedAt.toIso8601String(), // Chave JSON específica
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory UserModel.fromEntity(UserEntity entity) {
    // Nota: Conversão de int para String para o ID
    return UserModel(
      id: entity.id.toString(), // Converte int da entidade para String
      email: entity.email,
      name: entity.name,
      // photoUrl não está diretamente na entidade, apenas no copyWith
      emailVerified: entity.emailVerified,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  UserEntity toEntity() {
    // Nota: Conversão de String para int para o ID. Pode falhar se o ID não for numérico.
    // TODO: Adicionar tratamento de erro para a conversão do ID.
    return UserEntity(
      id: int.tryParse(id) ?? 0, // Tenta converter String para int, com fallback para 0
      email: email,
      // name não está no construtor principal da entidade
      // photoUrl não existe no construtor principal da entidade, apenas no copyWith
      emailVerified: emailVerified,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}