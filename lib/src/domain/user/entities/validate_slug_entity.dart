

/// Entidade que representa o resultado da validação de um slug
class ValidateSlugEntity {
  /// Indica se o slug é válido
  final bool? validate;
  
  /// Mensagem de validação
  final String? message;

  /// Construtor
  const ValidateSlugEntity({
    this.validate,
    this.message,
  });
  
  /// Cria uma cópia da entidade com alguns campos alterados
  ValidateSlugEntity copyWith({
    bool? validate,
    String? message,
  }) {
    return ValidateSlugEntity(
      validate: validate ?? this.validate,
      message: message ?? this.message,
    );
  }
  

}
