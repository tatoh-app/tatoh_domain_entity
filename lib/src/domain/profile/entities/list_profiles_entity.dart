import '../../user/entities/user_entity.dart';

/// Entidade que representa uma lista de perfis de um usuário
class ListProfilesEntity {
  /// Usuário que contém os perfis
  final UserEntity user;

  /// Construtor
  const ListProfilesEntity({
    required this.user,
  });
  
  /// Cria uma cópia da entidade com alguns campos alterados
  ListProfilesEntity copyWith({
    UserEntity? user,
  }) {
    return ListProfilesEntity(
      user: user ?? this.user,
    );
  }
}
