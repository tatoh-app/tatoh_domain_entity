import '../entities/validate_slug_entity.dart';

/// Modelo para serialização/deserialização de ValidateSlugEntity
class ValidateSlugModel extends ValidateSlugEntity {
  /// Construtor
  ValidateSlugModel({
    bool? validate,
    String? message,
  }) : super(
          validate: validate,
          message: message,
        );

  /// Cria um modelo a partir de um Map (JSON)
  factory ValidateSlugModel.fromJson(Map<String, dynamic> json) {
    return ValidateSlugModel(
      validate: json['validate'] as bool?,
      message: json['message'] as String?,
    );
  }

  /// Converte o modelo para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'validate': validate,
      'message': message,
    };
  }

  /// Cria um modelo a partir de uma entidade
  factory ValidateSlugModel.fromEntity(ValidateSlugEntity entity) {
    return ValidateSlugModel(
      validate: entity.validate,
      message: entity.message,
    );
  }
}
