import 'package:tatoh_domain_entity/src/domain/user/entities/user_entity.dart';
import 'package:tatoh_domain_entity/src/domain/user/models/user_model.dart';
import '../entities/list_profiles_entity.dart';

/// Modelo para serialização/deserialização de listas de perfis
class ListProfilesModel extends ListProfilesEntity {
  /// Construtor
  ListProfilesModel({
    required UserEntity user,
  }) : super(user: user);
  
  /// Cria um modelo a partir de um Map (JSON)
  factory ListProfilesModel.fromJson(Map<String, dynamic> json) {
    return ListProfilesModel(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
  
  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    final userJson = user is UserModel
        ? (user as UserModel).toJson()
        : UserModel.fromEntity(user).toJson();
    
    return {
      'user': userJson,
    };
  }
  
  /// Cria um modelo a partir de uma entidade
  factory ListProfilesModel.fromEntity(ListProfilesEntity entity) {
    return ListProfilesModel(
      user: entity.user,
    );
  }
}
