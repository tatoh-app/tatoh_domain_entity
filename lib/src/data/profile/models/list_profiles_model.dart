import '../../user/models/user_model.dart';
import '../../../domain/user/entities/user_entity.dart';
import '../../../domain/profile/entities/list_profiles_entity.dart';
// Importa a entidade do domínio profile
// Importa a entidade do domínio user
// Importa o UserModel da camada de dados (local futuro após refatoração)

/// Modelo (DTO) para serialização/deserialização e transferência de dados de ListProfilesEntity.
/// Reside na camada de Dados.
class ListProfilesModel {
  /// Usuário (como modelo DTO) que contém os perfis
  final UserModel user;

  /// Construtor
  ListProfilesModel({
    required this.user,
  });

  /// Cria um modelo a partir de um Map (JSON)
  factory ListProfilesModel.fromJson(Map<String, dynamic> json) {
    // TODO: Considerar adicionar validações ou tratamento de nulos mais robusto
    // Assume que 'user' existe no JSON e cria um UserModel a partir dele
    return ListProfilesModel(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      // Converte o UserModel interno para JSON
      'user': user.toJson(),
    };
  }

  /// Cria um modelo a partir de uma entidade do domínio
  factory ListProfilesModel.fromEntity(ListProfilesEntity entity) {
    // Converte a UserEntity da entidade original para um UserModel
    return ListProfilesModel(
      user: UserModel.fromEntity(entity.user),
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  ListProfilesEntity toEntity() {
    // Converte o UserModel interno de volta para uma UserEntity
    return ListProfilesEntity(
      user: user.toEntity(),
    );
  }
}