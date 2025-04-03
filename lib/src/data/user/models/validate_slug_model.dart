import '../../../domain/user/entities/validate_slug_entity.dart';



/// Modelo (DTO) para serialização/deserialização e transferência de dados de ValidateSlugEntity.
/// Reside na camada de Dados.
class ValidateSlugModel {
  /// Indica se o slug é válido
  final bool? validate;

  /// Mensagem de validação
  final String? message;

  /// Construtor
  ValidateSlugModel({
    this.validate,
    this.message,
  });

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

  /// Cria um modelo a partir de uma entidade do domínio
  factory ValidateSlugModel.fromEntity(ValidateSlugEntity entity) {
    return ValidateSlugModel(
      validate: entity.validate,
      message: entity.message,
    );
  }

  /// Converte o modelo (DTO) para uma entidade do domínio
  ValidateSlugEntity toEntity() {
    return ValidateSlugEntity(
      validate: validate,
      message: message,
    );
  }
}
